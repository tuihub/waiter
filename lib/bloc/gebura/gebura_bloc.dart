import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dao/dao.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';

import '../../common/app_scan/app_scan.dart';
import '../../common/app_scan/model.dart';
import '../../common/bloc_event_status_mixin.dart';
import '../../common/platform.dart';
import '../../common/steam/steam.dart';
import '../../l10n/l10n.dart';
import '../../model/gebura_model.dart';
import '../../repo/gebura/gebura_repo.dart';
import '../../rust/api/simple.dart';

part 'gebura_event.dart';
part 'gebura_state.dart';
part 'gebura_bloc.mapper.dart';

class GeburaBloc extends Bloc<GeburaEvent, GeburaState> {
  GeburaRepo get _repo => GetIt.I.get<GeburaRepo>();

  GeburaBloc() : super(GeburaState()) {
    on<GeburaInitEvent>((event, emit) async {
      if (!state.initialized) {
        add(GeburaScanLocalLibraryEvent());
        add(GeburaRefreshLibraryListEvent());
        add(GeburaLoadAppInstsEvent());
        add(GeburaLoadAppInstLaunchersEvent());
      }

      emit(state.copyWith(initialized: true));
    });

    // on<GeburaRefreshLibraryEvent>((event, emit) async {
    //   emit(GeburaRefreshLibraryState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.getPurchasedAppInfos,
    //     GetPurchasedAppInfosRequest(),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaRefreshLibraryState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   final ownedApps = <App>[];
    //   for (var i = 0; i < 1000; i++) {
    //     final appResp = await _api.doRequest(
    //       (client) => client.listApps,
    //       ListAppsRequest(
    //         paging: PagingRequest(
    //           pageSize: Int64(100),
    //           pageNum: Int64(i + 1),
    //         ),
    //       ),
    //     );
    //     if (appResp.status != ApiStatus.success) {
    //       emit(GeburaRefreshLibraryState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //     if (appResp.getData().apps.isEmpty) {
    //       break;
    //     }
    //     ownedApps.addAll(appResp.getData().apps);
    //   }
    //   final ownedAppInsts = <AppInst>[];
    //   for (var i = 0; i < 1000; i++) {
    //     final appInstResp = await _api.doRequest(
    //       (client) => client.listAppInsts,
    //       ListAppInstsRequest(
    //         paging: PagingRequest(
    //           pageSize: Int64(100),
    //           pageNum: Int64(i + 1),
    //         ),
    //       ),
    //     );
    //     if (appInstResp.status != ApiStatus.success) {
    //       emit(GeburaRefreshLibraryState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //     if (appInstResp.getData().appInsts.isEmpty) {
    //       break;
    //     }
    //     ownedAppInsts.addAll(appInstResp.getData().appInsts);
    //   }
    //   final appInstRunTimes = <InternalID, Duration>{};
    //   for (final appInst in ownedAppInsts) {
    //     final runTimeResp = await _api.doRequest(
    //       (client) => client.sumAppInstRunTime,
    //       SumAppInstRunTimeRequest(
    //         appInstId: appInst.id,
    //         timeAggregation: TimeAggregation(
    //           aggregationType:
    //               TimeAggregation_AggregationType.AGGREGATION_TYPE_OVERALL,
    //           timeRange: toPBTimeRange(
    //               DateTime.now().subtract(const Duration(days: 365 * 10)),
    //               DateTime.now()),
    //         ),
    //       ),
    //     );
    //     if (runTimeResp.status != ApiStatus.success) {
    //       continue;
    //     }
    //     if (runTimeResp.getData().runTimeGroups.isNotEmpty) {
    //       final group = runTimeResp.getData().runTimeGroups.first;
    //       appInstRunTimes[appInst.id] = fromPBDuration(group.duration);
    //     }
    //   }
    //   emit(GeburaRefreshLibraryState(
    //     state.copyWith(
    //       purchasedAppInfos: resp.getData().appInfos,
    //       ownedApps: ownedApps,
    //       ownedAppInsts: ownedAppInsts,
    //       appInstRunTimes: appInstRunTimes,
    //     ),
    //     EventStatus.success,
    //     msg: resp.error,
    //   ));
    //   add(GeburaApplyLibraryFilterEvent());
    // }, transformer: droppable());

    on<GeburaRefreshLibraryListEvent>((event, emit) async {
      try {
        final apps = await _repo.loadLocalApps();
        emit(GeburaRefreshLibraryState(
          state.copyWith(
            libraryApps: Map.fromEntries(apps.map((e) => MapEntry(e.uuid, e))),
          ),
          EventStatus.success,
        ));
        add(GeburaApplyLibraryFilterEvent(usePreviousSettings: true));
      } catch (e) {
        emit(GeburaRefreshLibraryState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
      }
    }, transformer: droppable());

    on<GeburaApplyLibraryFilterEvent>((event, emit) async {
      var settings = state.librarySettings ?? const LibrarySettings();
      if (!event.usePreviousSettings) {
        settings = settings.copyWith(
          filter: (settings.filter ?? const LibraryFilter()).copyWith(
            query: event.query,
          ),
        );
      }
      // prepare library items
      var newListItems = state.libraryApps.values
              .map((e) => LibraryListItem(
                    uuid: e.uuid,
                    name: e.name,
                    iconImagePath: e.iconImagePath,
                    coverImagePath: e.coverImagePath,
                    backgroundImagePath: e.backgroundImagePath,
                    filtered: false,
                  ))
              .toList() ??
          [];
      // apply filter
      if (settings.filter != null) {
        final filter = settings.filter!;
        if (filter.query != null && filter.query!.isNotEmpty) {
          final query = filter.query!.toLowerCase();

          newListItems = newListItems.map((e) {
            return e.copyWith(
              filtered: !e.filtered && e.name.toLowerCase().contains(query),
            );
          }).toList();
        }
      }
      // sort by name
      newListItems.sort((a, b) => a.name.compareTo(b.name));
      // emit
      emit(state.copyWith(
        libraryListItems: newListItems,
        librarySettings: settings,
      ));
    });

    on<GeburaLoadAppInstsEvent>((event, emit) async {
      try {
        final appInsts = await _repo.loadLocalAppInsts();
        final appInstsMap =
            Map.fromEntries(appInsts.map((e) => MapEntry(e.uuid, e)));
        appInstsMap.addAll(state.libraryAppInsts);
        emit(GeburaLoadAppInstsState(
          state.copyWith(
            libraryAppInsts: appInstsMap,
          ),
          EventStatus.success,
        ));
      } catch (e) {
        emit(GeburaLoadAppInstsState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
      }
    }, transformer: droppable());

    on<GeburaLoadAppInstLaunchersEvent>((event, emit) async {
      try {
        final launchers = await _repo.loadLocalAppInstLaunchers();
        final launchersMap =
            Map.fromEntries(launchers.map((e) => MapEntry(e.uuid, e)));
        launchersMap.addAll(state.libraryAppInstLaunchers);
        emit(GeburaLoadAppInstLaunchersState(
          state.copyWith(
            libraryAppInstLaunchers: launchersMap,
          ),
          EventStatus.success,
        ));
      } catch (e) {
        emit(GeburaLoadAppInstLaunchersState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
      }
    }, transformer: droppable());

    // on<GeburaSearchAppInfosEvent>((event, emit) async {
    //   emit(GeburaSearchAppInfosState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.searchAppInfos,
    //     SearchAppInfosRequest(
    //       paging: PagingRequest(
    //         pageSize: Int64(10),
    //         pageNum: Int64(1),
    //       ),
    //       query: event.query,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaSearchAppInfosState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaSearchAppInfosState(
    //     state,
    //     EventStatus.success,
    //     msg: resp.error,
    //     apps: resp.getData().appInfos,
    //   ));
    // }, transformer: droppable());

    // on<GeburaPurchaseEvent>((event, emit) async {
    //   emit(GeburaPurchaseState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.purchaseAppInfo,
    //     PurchaseAppInfoRequest(
    //       appInfoId: AppInfoID(
    //         internal: true,
    //         sourceAppId: event.id.id.toString(),
    //       ),
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaPurchaseState(state, EventStatus.failed, msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaPurchaseState(state, EventStatus.success, msg: resp.error));
    //   add(GeburaRefreshLibraryEvent());
    // }, transformer: droppable());

    on<GeburaSaveLocalAppInstLaunchSettingEvent>((event, emit) async {
      debugPrint(event.commonSetting.toString());
      var launcher = state.libraryAppInstLaunchers[event.launcherUUID];
      if (launcher == null) {
        emit(GeburaSaveLocalAppInstLaunchSettingState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
        return;
      }
      launcher = launcher.copyWith(
        common: event.commonSetting,
        steam: event.steamSetting,
      );
      await _repo.updateLocalAppInstLauncher(launcher);
      emit(GeburaSaveLocalAppInstLaunchSettingState(
        state.copyWith(
          libraryAppInstLaunchers:
              state.libraryAppInstLaunchers.map((key, value) {
            if (key == event.launcherUUID) {
              return MapEntry(key, launcher!);
            }
            return MapEntry(key, value);
          }),
        ),
        EventStatus.success,
      ));
    }, transformer: droppable());

    // on<GeburaAddAppInfoEvent>((event, emit) async {
    //   emit(GeburaAddAppState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.createAppInfo,
    //     CreateAppInfoRequest(
    //       appInfo: event.appInfo,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaAddAppState(state, EventStatus.failed, msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaAddAppState(state, EventStatus.success, msg: resp.error));
    // }, transformer: droppable());

    // on<GeburaEditAppInfoEvent>((event, emit) async {
    //   emit(GeburaEditAppState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.updateAppInfo,
    //     UpdateAppInfoRequest(
    //       appInfo: event.appInfo,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaEditAppState(state, EventStatus.failed, msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaEditAppState(state, EventStatus.success, msg: resp.error));
    // }, transformer: droppable());

    // on<GeburaAddAppEvent>((event, emit) async {
    //   emit(GeburaAddAppPackageState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.createApp,
    //     CreateAppRequest(
    //       app: event.app,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaAddAppPackageState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaAddAppPackageState(state, EventStatus.success,
    //       msg: resp.error));
    // }, transformer: droppable());

    // on<GeburaEditAppEvent>((event, emit) async {
    //   emit(GeburaEditAppPackageState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.updateApp,
    //     UpdateAppRequest(
    //       app: event.app,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaEditAppPackageState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaEditAppPackageState(state, EventStatus.success,
    //       msg: resp.error));
    // }, transformer: droppable());

    // on<GeburaAssignAppEvent>((event, emit) async {
    //   emit(GeburaAssignAppPackageState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.assignApp,
    //     AssignAppRequest(
    //       appInfoId: event.appInfoID,
    //       appId: event.appID,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaAssignAppPackageState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   emit(GeburaAssignAppPackageState(state, EventStatus.success,
    //       msg: resp.error));
    // }, transformer: droppable());

    on<GeburaSaveLastLaunchAppInstEvent>((event, emit) async {
      final launcher = state.libraryAppInstLaunchers[event.launcherUUID];
      if (launcher != null) {
        final appInst = state.libraryAppInsts[launcher.appInstUUID];
        if (appInst != null) {
          final app = state.libraryApps[appInst.appUUID];
          if (app != null) {
            emit(GeburaSaveLastLaunchAppInstState(
                state.copyWith(
                  libraryApps: state.libraryApps.map((key, value) {
                    if (key == app.uuid) {
                      return MapEntry(
                          key,
                          app.copyWith(
                            lastLaunchedInstUUID: appInst.uuid,
                          ));
                    }
                    return MapEntry(key, value);
                  }),
                  libraryAppInsts: state.libraryAppInsts.map((key, value) {
                    if (key == appInst.uuid) {
                      return MapEntry(
                          key,
                          appInst.copyWith(
                            lastLaunchedLauncherUUID: event.launcherUUID,
                          ));
                    }
                    return MapEntry(key, value);
                  }),
                ),
                EventStatus.success));
            return;
          }
        }
      }
      emit(GeburaSaveLastLaunchAppInstState(state, EventStatus.failed,
          msg: S.current.unknownErrorOccurred));
    });

    on<GeburaLaunchLocalAppEvent>((event, emit) async {
      late String appUUID;
      late LocalAppInstLauncher? launcher;
      if (event.launcherUUID != null) {
        final launcherTmp = state.libraryAppInstLaunchers[event.launcherUUID];
        if (launcherTmp != null) {
          final appInst = state.libraryAppInsts[launcherTmp.appInstUUID];
          if (appInst != null) {
            final app = state.libraryApps[appInst.appUUID];
            if (app != null) {
              state.libraryApps[app.uuid] = app.copyWith(
                lastLaunchedInstUUID: appInst.uuid,
              );
              state.libraryAppInsts[appInst.uuid] = appInst.copyWith(
                lastLaunchedLauncherUUID: launcherTmp.uuid,
              );
              appUUID = app.uuid;
              launcher = launcherTmp;
            }
          }
        }
      } else {
        final app = state.libraryApps[event.appUUID];
        if (app != null) {
          final appInst = state.libraryAppInsts[app.lastLaunchedInstUUID];
          if (appInst != null) {
            final launcherTmp =
                state.libraryAppInstLaunchers[appInst.lastLaunchedLauncherUUID];
            if (launcherTmp != null) {
              appUUID = app.uuid;
              launcher = launcherTmp;
            }
          }
        }
      }
      if (launcher == null) {
        emit(GeburaLaunchLocalAppInstState(state, appUUID, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
        return;
      }
      switch (launcher.launcherType) {
        case LocalAppInstLauncherType.steam:
          if (launcher.steam == null) {
            emit(GeburaLaunchLocalAppInstState(
                state, appUUID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          final steamAppID = launcher.steam!.steamAppID;
          await launchUrlString('steam://nav/games/details/$steamAppID');
          await launchUrlString('steam://run/$steamAppID');
          emit(GeburaLaunchLocalAppInstState(
              state, appUUID, EventStatus.success));
        case LocalAppInstLauncherType.common:
          if (launcher.common == null) {
            emit(GeburaLaunchLocalAppInstState(
                state, appUUID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          emit(GeburaLaunchLocalAppInstState(
              state, appUUID, EventStatus.processing));
          final setting = launcher.common!;
          if (setting.launcherPath.isEmpty) {
            emit(GeburaLaunchLocalAppInstState(
                state, appUUID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          if (state.runningInsts[appUUID] != null) {
            emit(GeburaLaunchLocalAppInstState(
                state, appUUID, EventStatus.failed,
                msg: S.current.pleaseDontReRunApplication));
            return;
          }
          final Map<String, LocalAppInstRunRecord> runningInsts = {};
          runningInsts.addAll(state.runningInsts);
          runningInsts[appUUID] = LocalAppInstRunRecord(
            uuid: appUUID,
            startTime: null,
            endTime: null,
          );
          emit(GeburaLaunchLocalAppInstState(
              state.copyWith(
                runningInsts: runningInsts,
              ),
              appUUID,
              EventStatus.processing));
          try {
            final (start, end, suceess) = await processRunner(
                mode: setting.advancedTracing
                    ? TraceMode.byName
                    : TraceMode.simple,
                name: setting.processName ?? '',
                executePath: setting.launcherPath ?? '',
                monitorPath: setting.processPath ?? '',
                workingDir: setting.workingDir ?? dirname(setting.launcherPath),
                sleepCount: setting.sleepCount ?? 1,
                sleepMillis: BigInt.from(1000));
            if (!suceess) {
              runningInsts.remove(appUUID);
              emit(GeburaLaunchLocalAppInstState(
                  state, appUUID, EventStatus.failed,
                  msg: S.current.applicationExitAbnormally));
              return;
            }
            // final record = LocalAppInstRunRecord(
            //   uuid: appUUID,
            //   startTime: DateTime.fromMillisecondsSinceEpoch(start * 1000),
            //   endTime: DateTime.fromMillisecondsSinceEpoch(end * 1000),
            // );
            runningInsts.remove(appUUID);
            // add(GeburaReportAppRunTimeEvent(
            //   event.appInstID,
            //   record.startTime!,
            //   record.endTime!,
            // ));
            emit(GeburaLaunchLocalAppInstState(
              state,
              appUUID,
              EventStatus.success,
            ));
          } catch (e) {
            runningInsts.remove(appUUID);
            emit(GeburaLaunchLocalAppInstState(
                state, appUUID, EventStatus.failed,
                msg: '${S.current.launcherError} $e'));
            return;
          }
      }
    });

    on<GeburaScanLocalLibraryEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(GeburaScanLocalLibraryState(state, EventStatus.processing));
      final Map<String, LocalLibraryScanResult> results = {};
      try {
        final commonFolders = await _repo.loadLocalCommonLibraryFolders();
        final refreshCommon = event.doAutoRefresh
            ? commonFolders
                .where((e) => e.enableAutoScan)
                .map((e) => e.uuid)
                .toList()
            : event.refreshCommon;
        final steamFolders = await _repo.loadLocalSteamLibraryFolders();
        final refreshSteam = event.doAutoRefresh
            ? steamFolders
                .where((e) => e.enableAutoScan)
                .map((e) => e.uuid)
                .toList()
            : event.refreshSteam;
        // Do scan
        if (refreshCommon != null) {
          for (final folder in commonFolders) {
            if (refreshCommon.isEmpty || refreshCommon.contains(folder.uuid)) {
              final result =
                  await scanCommonApps(_fromDaoCommonAppScan(folder));
              await _repo.saveLocalCommonLibraryScanResults(result.installedApps
                  .map((e) => LocalCommonAppScanResult(
                        uuid: const Uuid().v1(),
                        scanUUID: folder.uuid,
                        name: e.name,
                        version: e.version,
                        installPath: e.installPath,
                        launcherPaths: e.launcherPaths,
                      ))
                  .toList());
            }
          }
        }
        if (refreshSteam != null) {
          for (final folder in steamFolders) {
            if (refreshSteam.isEmpty || refreshSteam.contains(folder.uuid)) {
              final result = await scanSteamLibraryFolder(folder.libraryPath);
              await _repo.saveLocalSteamLibraryScanResults(result
                  .map((e) => LocalSteamAppScanResult(
                        uuid: const Uuid().v1(),
                        scanUUID: folder.uuid,
                        steamAppID: e.appId,
                        name: e.name,
                        installPath: e.installPath,
                        launcherPath: e.launcherPath,
                        sizeOnDisk: e.sizeOnDisk,
                      ))
                  .toList());
            }
          }
        }
        // Generate state
        final localInsts = await _repo.loadLocalAppInsts();
        for (final folder in commonFolders) {
          final scanResults = await _repo.loadLocalCommonLibraryScanResults(
              scanUUID: folder.uuid);
          final details = scanResults
              .map((e) => LocalLibraryScanResultDetail(
                    uuid: e.uuid,
                    name: e.name ?? e.installPath,
                    path: e.installPath,
                    tracked:
                        localInsts.any((inst) => inst.path == e.installPath),
                  ))
              .toList();
          results[folder.uuid] = LocalLibraryScanResult(
            uuid: folder.uuid,
            type: LocalLibraryScanResultType.common,
            path: folder.basePath,
            installedCount: details.length,
            trackedCount: details.where((e) => e.tracked).length,
            details: details,
          );
        }
        for (final folder in steamFolders) {
          final scanResults = await _repo.loadLocalSteamLibraryScanResults(
              scanUUID: folder.uuid);
          final details = scanResults
              .map((e) => LocalLibraryScanResultDetail(
                    uuid: e.uuid,
                    name: e.name,
                    path: e.installPath,
                    tracked:
                        localInsts.any((inst) => inst.path == e.installPath),
                  ))
              .toList();
          results[folder.uuid] = LocalLibraryScanResult(
            uuid: folder.uuid,
            type: LocalLibraryScanResultType.steam,
            path: folder.libraryPath,
            installedCount: details.length,
            trackedCount: details.where((e) => e.tracked).length,
            details: details,
          );
        }
        emit(GeburaScanLocalLibraryState(
          state.copyWith(
            localLibraryScanResults: results,
          ),
          EventStatus.success,
        ));
      } catch (e) {
        emit(GeburaScanLocalLibraryState(state, EventStatus.failed,
            msg: '${S.current.unknownErrorOccurred} $e'));
      }
    }, transformer: droppable());

    on<GeburaTrackCommonAppsEvent>((event, emit) async {
      var processCount = 0;
      var failedCount = 0;
      for (final uuid in event.uuids) {
        try {
          final commonApp =
              (await _repo.loadLocalCommonLibraryScanResults(uuid: uuid)).first;
          final app = LocalApp(
            uuid: const Uuid().v1(),
            name: commonApp.name ?? basename(commonApp.installPath),
          );
          final appInst = LocalAppInst(
            uuid: const Uuid().v1(),
            appUUID: app.uuid,
            name: app.name,
            path: commonApp.installPath,
          );
          await _repo.addLocalAppInst(appInst, app: app);
          add(GeburaRefreshAppInfoEvent(app.uuid));
          for (final launcherPath in commonApp.launcherPaths) {
            final appInstLaunch = LocalAppInstLauncher(
                uuid: const Uuid().v1(),
                appInstUUID: appInst.uuid,
                launcherType: LocalAppInstLauncherType.common,
                common: LocalAppInstLaunchCommon(
                  launcherPath: launcherPath,
                ));
            await _repo.addLocalAppInstLauncher(appInstLaunch);
          }
          final msg =
              '${S.current.importingCommonApplications} $processCount ( $failedCount ) / ${event.uuids.length}';
          emit(GeburaTrackCommonAppsState(
            state,
            EventStatus.processing,
            msg: msg,
          ));
          processCount += 1;
        } catch (e) {
          failedCount += 1;
        }
      }
      if (processCount > 0) {
        add(GeburaScanLocalLibraryEvent());
        add(GeburaRefreshLibraryListEvent());
        add(GeburaLoadAppInstsEvent());
        add(GeburaLoadAppInstLaunchersEvent());
      }
      final msg =
          S.current.importCommonApplicationFinished(processCount, failedCount);
      emit(GeburaTrackCommonAppsState(
        state,
        EventStatus.success,
        msg: msg,
      ));
    }, transformer: droppable());

    on<GeburaTrackSteamAppsEvent>((event, emit) async {
      var processCount = 0;
      var failedCount = 0;
      for (final uuid in event.uuids) {
        try {
          final steamApp =
              (await _repo.loadLocalSteamLibraryScanResults(uuid: uuid)).first;
          final app = LocalApp(
            uuid: const Uuid().v1(),
            name: steamApp.name,
          );
          final appInst = LocalAppInst(
            uuid: const Uuid().v1(),
            appUUID: app.uuid,
            name: app.name,
            path: steamApp.installPath,
          );
          await _repo.addLocalAppInst(appInst, app: app);
          add(GeburaRefreshAppInfoEvent(app.uuid));
          final appInstLaunch = LocalAppInstLauncher(
              uuid: const Uuid().v1(),
              appInstUUID: appInst.uuid,
              launcherType: LocalAppInstLauncherType.steam,
              steam: LocalAppInstLaunchSteam(
                steamAppID: steamApp.steamAppID,
              ));
          await _repo.addLocalAppInstLauncher(appInstLaunch);
          final msg =
              '${S.current.importingSteamApplications} $processCount ( $failedCount ) / ${event.uuids.length}';
          emit(GeburaTrackSteamAppsState(
            state,
            EventStatus.processing,
            msg: msg,
          ));
          processCount += 1;
        } catch (e) {
          failedCount += 1;
        }
      }
      if (processCount > 0) {
        add(GeburaScanLocalLibraryEvent());
        add(GeburaRefreshLibraryListEvent());
        add(GeburaLoadAppInstsEvent());
        add(GeburaLoadAppInstLaunchersEvent());
      }
      final msg =
          S.current.importSteamApplicationFinished(processCount, failedCount);
      emit(GeburaTrackSteamAppsState(
        state,
        EventStatus.success,
        msg: msg,
      ));
    }, transformer: droppable());

    on<GeburaRefreshAppInfoEvent>((event, emit) async {
      emit(GeburaRefreshAppInfoState(state, EventStatus.processing));
      try {
        final app = await _repo.fetchLocalAppInfo(event.uuid);
        await _repo.updateLocalApp(app);
        emit(GeburaRefreshAppInfoState(
          state.copyWith(
            libraryApps: state.libraryApps.map((key, value) {
              if (key == app.uuid) {
                return MapEntry(key, app);
              }
              return MapEntry(key, value);
            }),
            libraryListItems: state.libraryListItems?.map((e) {
              if (e.uuid == app.uuid) {
                return e.copyWith(
                  iconImagePath: app.iconImagePath,
                  coverImagePath: app.coverImagePath,
                  backgroundImagePath: app.backgroundImagePath,
                );
              }
              return e;
            }).toList(),
          ),
          EventStatus.success,
        ));
      } catch (e) {
        emit(GeburaRefreshAppInfoState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
      }
    });

    // on<GeburaFetchBoundAppInfosEvent>((event, emit) async {
    //   emit(GeburaFetchBoundAppsState(state, EventStatus.processing));
    //   final resp = await _api.doRequest(
    //     (client) => client.getBoundAppInfos,
    //     GetBoundAppInfosRequest(
    //       appInfoId: event.appID,
    //     ),
    //   );
    //   if (resp.status != ApiStatus.success) {
    //     emit(GeburaFetchBoundAppsState(state, EventStatus.failed,
    //         msg: resp.error));
    //     return;
    //   }
    //   final appInfoMap = state.appInfoMap ?? {};
    //   appInfoMap[event.appID.id] = resp.getData().appInfos;
    //   emit(GeburaFetchBoundAppsState(
    //     state.copyWith(appInfoMap: appInfoMap),
    //     EventStatus.success,
    //     msg: resp.error,
    //   ));
    //   if (event.refreshAfterSuccess ?? false) {
    //     add(GeburaApplyLibraryFilterEvent());
    //   }
    // });

    //   on<GeburaSearchNewAppInfoEvent>((event, emit) async {
    //     emit(GeburaSearchNewAppInfoState(state, EventStatus.processing));
    //     final resp = await _api.doRequest(
    //       (client) => client.searchNewAppInfos,
    //       SearchNewAppInfosRequest(
    //         paging: PagingRequest(
    //           pageSize: Int64(10),
    //           pageNum: Int64(1),
    //         ),
    //         name: event.query,
    //       ),
    //     );
    //     if (resp.status != ApiStatus.success) {
    //       emit(GeburaSearchNewAppInfoState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //     emit(GeburaSearchNewAppInfoState(
    //       state,
    //       EventStatus.success,
    //       msg: resp.error,
    //       infos: resp.getData().appInfos,
    //     ));
    //   }, transformer: droppable());
    //
    //   on<GeburaAssignAppWithNewInfoEvent>((event, emit) async {
    //     emit(GeburaAssignAppInfoState(state, EventStatus.processing));
    //     final syncResp = await _api.doRequest(
    //         (client) => client.syncAppInfos,
    //         SyncAppInfosRequest(
    //           appInfoIds: [
    //             AppInfoID(
    //                 internal: false,
    //                 source: event.appInfoSource,
    //                 sourceAppId: event.appInfoSourceID)
    //           ],
    //           waitData: false,
    //         ));
    //     if (syncResp.status != ApiStatus.success) {
    //       emit(GeburaAssignAppInfoState(state, EventStatus.failed,
    //           msg: syncResp.error));
    //       return;
    //     }
    //     final boundInfoResp = await _api.doRequest(
    //         (client) => client.getBoundAppInfos,
    //         GetBoundAppInfosRequest(
    //           appInfoId: syncResp.getData().appInfos.first.id,
    //         ));
    //     if (boundInfoResp.status != ApiStatus.success) {
    //       emit(GeburaAssignAppInfoState(state, EventStatus.failed,
    //           msg: boundInfoResp.error));
    //       return;
    //     }
    //     if (!boundInfoResp
    //         .getData()
    //         .appInfos
    //         .any((element) => element.internal)) {
    //       emit(GeburaAssignAppInfoState(state, EventStatus.failed,
    //           msg: 'No internal app info found'));
    //     }
    //     final appInfoId = boundInfoResp
    //         .getData()
    //         .appInfos
    //         .firstWhere((element) => element.internal)
    //         .id;
    //     final resp = await _api.doRequest(
    //       (client) => client.assignApp,
    //       AssignAppRequest(
    //         appInfoId: appInfoId,
    //         appId: event.appID,
    //       ),
    //     );
    //     if (resp.status != ApiStatus.success) {
    //       emit(GeburaAssignAppInfoState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //     emit(GeburaAssignAppInfoState(state, EventStatus.success,
    //         msg: resp.error));
    //     add(GeburaRefreshLibraryEvent());
    //   }, transformer: droppable());
    //
    //   on<GeburaReportAppRunTimeEvent>((event, emit) async {
    //     emit(GeburaReportAppRunTimeState(state, EventStatus.processing));
    //     final resp = await _api.doRequest(
    //       (client) => client.addAppInstRunTime,
    //       AddAppInstRunTimeRequest(
    //         appInstId: event.appInstID,
    //         timeRange: toPBTimeRange(
    //           event.startTime,
    //           event.endTime,
    //         ),
    //       ),
    //     );
    //     if (resp.status != ApiStatus.success) {
    //       emit(GeburaReportAppRunTimeState(state, EventStatus.failed,
    //           msg: resp.error));
    //       return;
    //     }
    //     emit(GeburaReportAppRunTimeState(
    //       state,
    //       EventStatus.success,
    //       msg: resp.error,
    //     ));
    //     add(GeburaRefreshLibraryEvent());
    //   });
  }
  //
  // Future<ListAppInfosResponse> listAppInfos(
  //     int pageSize, int pageNum, List<String> sourceFilter) async {
  //   final resp = await _api.doRequest(
  //     (client) => client.listAppInfos,
  //     ListAppInfosRequest(
  //       paging:
  //           PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
  //       sourceFilter: sourceFilter,
  //     ),
  //   );
  //   return resp.getData();
  // }
  //
  // Future<ListAppsResponse> listApps(int pageSize, int pageNum) async {
  //   final resp = await _api.doRequest(
  //     (client) => client.listApps,
  //     ListAppsRequest(
  //       paging:
  //           PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
  //     ),
  //   );
  //   return resp.getData();
  // }
  //
  Future<void> showSteamAppDetails(String steamAppID) async {
    await launchUrlString('steam://nav/games/details/$steamAppID');
  }

  Future<bool> saveLocalCommonAppLibraryFolder(CommonAppScan setting) async {
    try {
      await _repo.addLocalCommonLibraryFolder(_toDaoCommonAppScan(setting));
      add(GeburaScanLocalLibraryEvent(refreshCommon: [setting.uuid]));
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<CommonAppScan?> getLocalCommonAppLibraryFolder(String uuid) async {
    try {
      final setting = await _repo.getLocalCommonLibraryFolder(uuid);
      return _fromDaoCommonAppScan(setting);
    } catch (e) {
      return null;
    }
  }

  Future<(List<String>, SteamScanResult)> getLocalSteamLibraryFolders() async {
    final (folders, result) = await getSteamLibraryFolders();
    if (result == SteamScanResult.fullyScanned) {
      try {
        await _repo.saveLocalSteamLibraryFolders(folders);
        add(GeburaScanLocalLibraryEvent(refreshSteam: const []));
      } catch (e) {
        return (List<String>.empty(), SteamScanResult.unknownError);
      }
    }
    return (folders, result);
  }
}

// AppInfo mixAppInfo(List<AppInfo> apps) {
//   var mixedApp = AppInfo();
//   if (apps.isEmpty) {
//     return mixedApp;
//   }
//   mixedApp = apps.where((element) => element.internal).isNotEmpty
//       ? apps.firstWhere((element) => element.internal)
//       : AppInfo();
//   for (final app in apps.where((element) => !element.internal)) {
//     mixedApp.name = app.name.isNotEmpty ? app.name : mixedApp.name;
//     mixedApp.shortDescription = app.shortDescription.isNotEmpty
//         ? app.shortDescription
//         : mixedApp.shortDescription;
//     mixedApp.iconImageUrl =
//         app.iconImageUrl.isNotEmpty ? app.iconImageUrl : mixedApp.iconImageUrl;
//     mixedApp.backgroundImageUrl = app.backgroundImageUrl.isNotEmpty
//         ? app.backgroundImageUrl
//         : mixedApp.backgroundImageUrl;
//     mixedApp.coverImageUrl = app.coverImageUrl.isNotEmpty
//         ? app.coverImageUrl
//         : mixedApp.coverImageUrl;
//     mixedApp.tags.addAll(app.tags);
//     mixedApp.altNames.addAll(app.altNames);
//
//     mixedApp.details.description = app.details.description.isNotEmpty
//         ? app.details.description
//         : mixedApp.details.description;
//     mixedApp.details.releaseDate = app.details.releaseDate.isNotEmpty
//         ? app.details.releaseDate
//         : mixedApp.details.releaseDate;
//     mixedApp.details.developer = app.details.developer.isNotEmpty
//         ? app.details.developer
//         : mixedApp.details.developer;
//     mixedApp.details.publisher = app.details.publisher.isNotEmpty
//         ? app.details.publisher
//         : mixedApp.details.publisher;
//     mixedApp.details.version = app.details.version.isNotEmpty
//         ? app.details.version
//         : mixedApp.details.version;
//     mixedApp.details.imageUrls.addAll(app.details.imageUrls);
//   }
//   return mixedApp;
// }

// AppInfoMixed appInfoToMixed(AppInfo appInfo) {
//   return AppInfoMixed(
//     id: appInfo.id,
//     name: appInfo.name,
//     type: appInfo.type,
//     shortDescription: appInfo.shortDescription,
//     iconImageUrl: appInfo.iconImageUrl,
//     backgroundImageUrl: appInfo.backgroundImageUrl,
//     coverImageUrl: appInfo.coverImageUrl,
//     tags: appInfo.tags,
//     altNames: appInfo.altNames,
//     details: appInfo.details,
//   );
// }

LocalCommonAppScan _toDaoCommonAppScan(CommonAppScan setting) {
  return LocalCommonAppScan(
    uuid: setting.uuid,
    basePath: setting.basePath,
    enableAutoScan: setting.enableAutoScan,
    excludeDirectoryMatchers: setting.excludeDirectoryMatchers,
    minInstallDirDepth: setting.minInstallDirDepth,
    maxInstallDirDepth: setting.maxInstallDirDepth,
    pathFieldMatcher: setting.pathFieldMatcher.map((e) {
      switch (e) {
        case CommonAppScanPathFieldMatcher.ignore:
          return LocalCommonAppScanPathFieldMatcher.ignore;
        case CommonAppScanPathFieldMatcher.name:
          return LocalCommonAppScanPathFieldMatcher.name;
        case CommonAppScanPathFieldMatcher.version:
          return LocalCommonAppScanPathFieldMatcher.version;
      }
    }).toList(),
    pathFieldMatcherAlignment: (() {
      switch (setting.pathFieldMatcherAlignment) {
        case CommonAppScanPathFieldMatcherAlignment.left:
          return LocalCommonAppScanPathFieldMatcherAlignment.left;
        case CommonAppScanPathFieldMatcherAlignment.right:
          return LocalCommonAppScanPathFieldMatcherAlignment.right;
      }
    })(),
    includeExecutableMatchers: setting.includeExecutableMatchers,
    excludeExecutableMatchers: setting.excludeExecutableMatchers,
    minExecutableDepth: setting.minExecutableDepth,
    maxExecutableDepth: setting.maxExecutableDepth,
  );
}

CommonAppScan _fromDaoCommonAppScan(LocalCommonAppScan setting) {
  return CommonAppScan(
    uuid: setting.uuid,
    basePath: setting.basePath,
    enableAutoScan: setting.enableAutoScan,
    excludeDirectoryMatchers: setting.excludeDirectoryMatchers,
    minInstallDirDepth: setting.minInstallDirDepth,
    maxInstallDirDepth: setting.maxInstallDirDepth,
    pathFieldMatcher: setting.pathFieldMatcher.map((e) {
      switch (e) {
        case LocalCommonAppScanPathFieldMatcher.ignore:
          return CommonAppScanPathFieldMatcher.ignore;
        case LocalCommonAppScanPathFieldMatcher.name:
          return CommonAppScanPathFieldMatcher.name;
        case LocalCommonAppScanPathFieldMatcher.version:
          return CommonAppScanPathFieldMatcher.version;
      }
    }).toList(),
    pathFieldMatcherAlignment: (() {
      switch (setting.pathFieldMatcherAlignment) {
        case LocalCommonAppScanPathFieldMatcherAlignment.left:
          return CommonAppScanPathFieldMatcherAlignment.left;
        case LocalCommonAppScanPathFieldMatcherAlignment.right:
          return CommonAppScanPathFieldMatcherAlignment.right;
      }
    })(),
    includeExecutableMatchers: setting.includeExecutableMatchers,
    excludeExecutableMatchers: setting.excludeExecutableMatchers,
    minExecutableDepth: setting.minExecutableDepth,
    maxExecutableDepth: setting.maxExecutableDepth,
  );
}
