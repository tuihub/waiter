import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
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
import '../../ffi/ffi.dart';
import '../../ffi/ffi_model.dart';
import '../../l10n/l10n.dart';
import '../../model/gebura_model.dart';
import '../../repo/grpc/api_helper.dart';
import '../../repo/grpc/type_helper.dart';
import '../../repo/local/gebura.dart';

part 'gebura_event.dart';
part 'gebura_state.dart';

class GeburaBloc extends Bloc<GeburaEvent, GeburaState> {
  final ApiHelper _api;
  final GeburaRepo _repo;
  final InternalID? _deviceID;

  GeburaBloc(this._api, this._repo, this._deviceID) : super(GeburaState()) {
    on<GeburaInitEvent>((event, emit) async {
      if (state.ownedApps == null) {
        add(GeburaRefreshLibraryEvent());
        add(GeburaScanLocalLibraryEvent());
      }
      final localTrackedApps = state.localTrackedApps ??
          _repo
              .loadTrackedApps()
              .asMap()
              .map((_, value) => MapEntry(value.uuid, value));
      final localTrackedAppInsts = state.localTrackedAppInsts ??
          _repo
              .loadTrackedAppInsts()
              .asMap()
              .map((_, value) => MapEntry(value.uuid, value));
      final localCommonLibraryFolders = state.localCommonLibraryFolders ??
          _repo
              .loadTrackedCommonAppFolders()
              .asMap()
              .map((_, value) => MapEntry(value.basePath, value));

      add(GeburaRefreshLibraryListEvent());
      emit(state.copyWith(
        localTrackedApps: localTrackedApps,
        localTrackedAppInsts: localTrackedAppInsts,
        localCommonLibraryFolders: localCommonLibraryFolders,
      ));
    });

    on<GeburaRefreshLibraryEvent>((event, emit) async {
      emit(GeburaRefreshLibraryState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.getPurchasedAppInfos,
        GetPurchasedAppInfosRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaRefreshLibraryState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      final ownedApps = <App>[];
      for (var i = 0; i < 1000; i++) {
        final appResp = await _api.doRequest(
          (client) => client.listApps,
          ListAppsRequest(
            paging: PagingRequest(
              pageSize: Int64(100),
              pageNum: Int64(i + 1),
            ),
          ),
        );
        if (appResp.status != ApiStatus.success) {
          emit(GeburaRefreshLibraryState(state, EventStatus.failed,
              msg: resp.error));
          return;
        }
        if (appResp.getData().apps.isEmpty) {
          break;
        }
        ownedApps.addAll(appResp.getData().apps);
      }
      final ownedAppInsts = <AppInst>[];
      for (var i = 0; i < 1000; i++) {
        final appInstResp = await _api.doRequest(
          (client) => client.listAppInsts,
          ListAppInstsRequest(
            paging: PagingRequest(
              pageSize: Int64(100),
              pageNum: Int64(i + 1),
            ),
          ),
        );
        if (appInstResp.status != ApiStatus.success) {
          emit(GeburaRefreshLibraryState(state, EventStatus.failed,
              msg: resp.error));
          return;
        }
        if (appInstResp.getData().appInsts.isEmpty) {
          break;
        }
        ownedAppInsts.addAll(appInstResp.getData().appInsts);
      }
      final appInstRunTimes = <InternalID, Duration>{};
      for (final appInst in ownedAppInsts) {
        final runTimeResp = await _api.doRequest(
          (client) => client.sumAppInstRunTime,
          SumAppInstRunTimeRequest(
            appInstId: appInst.id,
            timeAggregation: TimeAggregation(
              aggregationType:
                  TimeAggregation_AggregationType.AGGREGATION_TYPE_OVERALL,
              timeRange: toPBTimeRange(
                  DateTime.now().subtract(const Duration(days: 365 * 10)),
                  DateTime.now()),
            ),
          ),
        );
        if (runTimeResp.status != ApiStatus.success) {
          continue;
        }
        if (runTimeResp.getData().runTimeGroups.isNotEmpty) {
          final group = runTimeResp.getData().runTimeGroups.first;
          appInstRunTimes[appInst.id] = fromPBDuration(group.duration);
        }
      }
      emit(GeburaRefreshLibraryState(
        state.copyWith(
          purchasedAppInfos: resp.getData().appInfos,
          ownedApps: ownedApps,
          ownedAppInsts: ownedAppInsts,
          appInstRunTimes: appInstRunTimes,
        ),
        EventStatus.success,
        msg: resp.error,
      ));
      add(GeburaApplyLibraryFilterEvent());
    }, transformer: droppable());

    on<GeburaRefreshLibraryListEvent>((event, emit) async {
      var listItems = <LibraryListItem>[];
      if (state.localTrackedApps != null) {
        listItems = state.localTrackedApps!.values.map((e) {
          return LibraryListItem(
            uuid: const Uuid().v1(),
            name: e.name,
            localAppUUID: e.uuid,
            iconImageUrl: e.iconImageUrl ?? '',
            coverImageUrl: e.coverImageUrl ?? '',
            backgroundImageUrl: e.backgroundImageUrl ?? '',
          );
        }).toList();
      }
      listItems.sort((a, b) => a.name.compareTo(b.name));
      emit(state.copyWith(libraryListItems: listItems));
      add(GeburaApplyLibraryFilterEvent(usePreviousSettings: true));
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
      // Map<Int64, AppInfoMixed> libraryItemMap = Map.fromEntries(
      //   (state.purchasedAppInfos ?? []).map((e) => MapEntry(e.id.id, e)),
      // );
      // final appInfoMap = state.appInfoMap ?? {};
      // for (final App app in state.ownedApps ?? []) {
      //   if (app.hasAssignedAppInfoId() && app.assignedAppInfoId.id > 0) {
      //     if (libraryItemMap[app.assignedAppInfoId.id] != null) {
      //       if (libraryItemMap[app.assignedAppInfoId.id]!.name.isEmpty) {
      //         libraryItemMap[app.assignedAppInfoId.id]!.name = app.name;
      //       }
      //       continue;
      //     } else if (appInfoMap[app.assignedAppInfoId.id] != null) {
      //       libraryItemMap[app.assignedAppInfoId.id] =
      //           appInfoToMixed(mixAppInfo(
      //         appInfoMap[app.assignedAppInfoId.id]!,
      //       ));
      //     } else {
      //       add(GeburaFetchBoundAppInfosEvent(
      //         app.assignedAppInfoId,
      //         refreshAfterSuccess: true,
      //       ));
      //     }
      //   } else {
      //     libraryItemMap[app.id.id] = AppInfoMixed(
      //       id: app.id,
      //       name: app.name,
      //       shortDescription: app.description,
      //     );
      //   }
      // }
      var newListItems = state.libraryListItems ?? [];
      // reset filter flag
      newListItems = newListItems.map((e) {
        return e.copyWith(
          filtered: false,
        );
      }).toList();
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
      // libraryItemMap = Map.fromEntries(libraryItemMap.entries.toList()
      //   ..sort((a, b) => a.value.name.compareTo(b.value.name)));
      // emit
      emit(state.copyWith(
        libraryListItems: newListItems,
        librarySettings: settings,
      ));
    });

    on<GeburaSaveLocalCommonAppFolderSettingEvent>((event, emit) async {
      final setting = event.setting;
      await _repo.setTrackedCommonAppFolder(setting);
      emit(state.copyWith(
        localCommonLibraryFolders: {
          ...state.localCommonLibraryFolders ?? {},
          setting.basePath: setting,
        },
      ));
      add(GeburaScanLocalLibraryEvent());
    }, transformer: droppable());

    on<GeburaSearchAppInfosEvent>((event, emit) async {
      emit(GeburaSearchAppInfosState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.searchAppInfos,
        SearchAppInfosRequest(
          paging: PagingRequest(
            pageSize: Int64(10),
            pageNum: Int64(1),
          ),
          query: event.query,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaSearchAppInfosState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaSearchAppInfosState(
        state,
        EventStatus.success,
        msg: resp.error,
        apps: resp.getData().appInfos,
      ));
    }, transformer: droppable());

    on<GeburaPurchaseEvent>((event, emit) async {
      emit(GeburaPurchaseState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.purchaseAppInfo,
        PurchaseAppInfoRequest(
          appInfoId: AppInfoID(
            internal: true,
            sourceAppId: event.id.id.toString(),
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaPurchaseState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaPurchaseState(state, EventStatus.success, msg: resp.error));
      add(GeburaRefreshLibraryEvent());
    }, transformer: droppable());

    on<GeburaSaveLocalAppInstLaunchSettingEvent>((event, emit) async {
      debugPrint(event.commonSetting.toString());
      var appInst = state.localTrackedAppInsts?[event.uuid];
      if (appInst == null) {
        emit(GeburaSaveLocalAppInstLaunchSettingState(state, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
        return;
      }
      appInst = appInst.copyWith(
        commonLaunchSetting: event.commonSetting,
        steamLaunchSetting: event.steamSetting,
      );
      await _repo.setTrackedAppInst(appInst);
      final localTrackedAppInsts = state.localTrackedAppInsts ?? {};
      localTrackedAppInsts[event.uuid] = appInst;
      emit(GeburaSaveLocalAppInstLaunchSettingState(
        state.copyWith(localTrackedAppInsts: localTrackedAppInsts),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<GeburaAddAppInfoEvent>((event, emit) async {
      emit(GeburaAddAppState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createAppInfo,
        CreateAppInfoRequest(
          appInfo: event.appInfo,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaAddAppState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaAddAppState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<GeburaEditAppInfoEvent>((event, emit) async {
      emit(GeburaEditAppState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updateAppInfo,
        UpdateAppInfoRequest(
          appInfo: event.appInfo,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaEditAppState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaEditAppState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<GeburaAddAppEvent>((event, emit) async {
      emit(GeburaAddAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createApp,
        CreateAppRequest(
          app: event.app,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaAddAppPackageState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaAddAppPackageState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<GeburaEditAppEvent>((event, emit) async {
      emit(GeburaEditAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updateApp,
        UpdateAppRequest(
          app: event.app,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaEditAppPackageState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaEditAppPackageState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<GeburaAssignAppEvent>((event, emit) async {
      emit(GeburaAssignAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.assignApp,
        AssignAppRequest(
          appInfoId: event.appInfoID,
          appId: event.appID,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaAssignAppPackageState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaAssignAppPackageState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<GeburaSaveLastLaunchAppInstEvent>((event, emit) async {
      final appInst = state.localTrackedAppInsts?[event.uuid];
      if (appInst != null) {
        final app = state.localTrackedApps?[appInst.appUUID];
        if (app != null) {
          state.localTrackedApps![appInst.appUUID] = app.copyWith(
            lastLaunchedInstUUID: appInst.uuid,
          );
          emit(GeburaSaveLastLaunchAppInstState(state, EventStatus.success));
          return;
        }
      }
      emit(GeburaSaveLastLaunchAppInstState(state, EventStatus.failed,
          msg: S.current.unknownErrorOccurred));
    });

    on<GeburaLaunchLocalAppEvent>((event, emit) async {
      final appInst = state.localTrackedAppInsts?[event.uuid];
      if (appInst == null) {
        emit(GeburaLaunchLocalAppInstState(
            state, event.uuid, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
        return;
      }
      final app = state.localTrackedApps?[appInst.appUUID];
      if (app != null) {
        state.localTrackedApps?[appInst.appUUID] ??= app.copyWith(
          lastLaunchedInstUUID: appInst.uuid,
        );
      }
      switch (appInst.type) {
        case LocalAppInstType.steam:
          if (appInst.steamLaunchSetting == null) {
            emit(GeburaLaunchLocalAppInstState(
                state, event.uuid, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          final steamAppID = appInst.steamLaunchSetting!.steamAppID;
          await launchUrlString('steam://nav/games/details/$steamAppID');
          await launchUrlString('steam://run/$steamAppID');
          emit(GeburaLaunchLocalAppInstState(
              state, event.uuid, EventStatus.success));
        case LocalAppInstType.common:
          if (appInst.commonLaunchSetting == null) {
            emit(GeburaLaunchLocalAppInstState(
                state, event.uuid, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          add(GeburaLaunchLocalCommonAppInstEvent(event.uuid));
      }
    });

    on<GeburaLaunchLocalCommonAppInstEvent>((event, emit) async {
      final appInst = state.localTrackedAppInsts?[event.uuid];
      if (appInst == null || appInst.commonLaunchSetting == null) {
        emit(GeburaLaunchLocalAppInstState(
            state, event.uuid, EventStatus.failed,
            msg: S.current.unknownErrorOccurred));
        return;
      }
      emit(GeburaLaunchLocalAppInstState(
          state, event.uuid, EventStatus.processing));
      final setting = appInst.commonLaunchSetting;
      if (setting == null || setting.path.isEmpty) {
        emit(GeburaLaunchLocalAppInstState(
            state, event.uuid, EventStatus.failed,
            msg: S.current.pleaseSetupApplicationPath));
        return;
      }
      final runningInsts = state.runningInsts ?? {};
      if (runningInsts[event.uuid] != null) {
        emit(GeburaLaunchLocalAppInstState(
            state, event.uuid, EventStatus.failed,
            msg: S.current.pleaseDontReRunApplication));
        return;
      }
      runningInsts[event.uuid] = LocalAppInstRunRecord(
        uuid: event.uuid,
        startTime: null,
        endTime: null,
      );
      emit(GeburaLaunchLocalAppInstState(
          state, event.uuid, EventStatus.processing));
      try {
        final (start, end, suceess) = await FFI().processRunner(
            setting.advancedTracing ? TraceMode.ByName : TraceMode.Simple,
            setting.processName,
            setting.path,
            setting.realPath,
            dirname(setting.path),
            setting.sleepTime,
            1000);
        if (!suceess) {
          runningInsts.remove(event.uuid);
          emit(GeburaLaunchLocalAppInstState(
              state, event.uuid, EventStatus.failed,
              msg: S.current.applicationExitAbnormally));
          return;
        }
        final record = LocalAppInstRunRecord(
          uuid: event.uuid,
          startTime: DateTime.fromMillisecondsSinceEpoch(start * 1000),
          endTime: DateTime.fromMillisecondsSinceEpoch(end * 1000),
        );
        runningInsts.remove(event.uuid);
        // add(GeburaReportAppRunTimeEvent(
        //   event.appInstID,
        //   record.startTime!,
        //   record.endTime!,
        // ));
        emit(GeburaLaunchLocalAppInstState(
          state,
          event.uuid,
          EventStatus.success,
        ));
      } catch (e) {
        runningInsts.remove(event.uuid);
        emit(GeburaLaunchLocalAppInstState(
            state, event.uuid, EventStatus.failed,
            msg:
                '${S.current.launcherError} ${e is FrbAnyhowException ? e.anyhow : e}'));
        return;
      }
    });

    on<GeburaScanLocalLibraryEvent>((event, emit) async {
      add(GeburaScanLocalCommonLibraryEvent());
      add(GeburaScanLocalSteamLibraryEvent());
    }, transformer: droppable());

    on<GeburaScanLocalCommonLibraryEvent>((event, emit) async {
      emit(state.copyWith(
          localLibraryStateMessage: S.current.scanningLocalFiles));
      final folders = state.localCommonLibraryFolders ?? {};
      for (final folder in folders.values) {
        final result = await scanCommonApps(folder);
        final tracked = _repo.loadTrackedAppInsts();
        final unTracked = result.installedApps.where(
          (element) => !tracked.any(
            (t) =>
                t.type == LocalAppInstType.common &&
                t.path == element.installPath,
          ),
        );
        emit(state.copyWith(
          localLibraryStateMessage: unTracked.isNotEmpty
              ? S.current.newApplicationFound(unTracked.length)
              : '',
          localInstalledCommonAppInsts: result.installedApps
              .asMap()
              .map((_, value) => MapEntry(value.installPath, value)),
        ));
      }
    }, transformer: droppable());

    on<GeburaScanLocalSteamLibraryEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(state.copyWith(
          localLibraryStateMessage: S.current.scanningLocalFiles));
      final (installed, result) = await scanSteamLibrary();
      final folders = await getSteamLibraryFolders();
      final tracked = _repo.loadTrackedAppInsts();
      final unTracked = installed.where(
        (element) => !tracked.any(
          (t) =>
              t.type == LocalAppInstType.steam &&
              t.steamLaunchSetting?.steamAppID == element.appId,
        ),
      );
      emit(state.copyWith(
        localLibraryStateMessage: unTracked.isNotEmpty
            ? S.current.newApplicationFound(unTracked.length)
            : '',
        localSteamScanResult: result,
        localInstalledSteamAppInsts:
            installed.asMap().map((_, value) => MapEntry(value.appId, value)),
        localSteamLibraryFolders: folders,
      ));
    }, transformer: droppable());

    on<GeburaTrackSteamAppsEvent>((event, emit) async {
      final localTrackedApps = state.localTrackedApps ?? {};
      final localTrackedAppInsts = state.localTrackedAppInsts ?? {};
      var processCount = 0;
      var failedCount = 0;
      for (final id in event.steamAppIDs) {
        processCount += 1;
        final steamApp = state.localInstalledSteamAppInsts?[id];
        if (steamApp == null) {
          failedCount += 1;
          continue;
        }
        final app = LocalTrackedApp(
          uuid: const Uuid().v1(),
          name: steamApp.name,
        );
        final appInst = LocalTrackedAppInst(
          uuid: const Uuid().v1(),
          appUUID: app.uuid,
          type: LocalAppInstType.steam,
          name: app.name,
          path: steamApp.installPath,
          steamLaunchSetting: LocalSteamAppInstLaunchSetting(
            steamAppID: steamApp.appId,
            launchOptions: '',
          ),
        );
        localTrackedApps[app.uuid] = app;
        localTrackedAppInsts[appInst.uuid] = appInst;
        await _repo.setTrackedApp(app);
        await _repo.setTrackedAppInst(appInst);
        final msg =
            '${S.current.importingSteamApplications} $processCount ( $failedCount ) / ${event.steamAppIDs.length}';
        emit(GeburaTrackSteamAppsState(
          state.copyWith(
            localTrackedApps: localTrackedApps,
            localTrackedAppInsts: localTrackedAppInsts,
            localLibraryStateMessage: msg,
          ),
          EventStatus.processing,
          msg: msg,
        ));
      }
      add(GeburaRefreshLibraryListEvent());
      final msg =
          S.current.importSteamApplicationFinished(processCount, failedCount);
      emit(GeburaTrackSteamAppsState(
        state.copyWith(
          localTrackedApps: localTrackedApps,
          localTrackedAppInsts: localTrackedAppInsts,
          localLibraryStateMessage: msg,
        ),
        EventStatus.success,
        msg: msg,
      ));
    }, transformer: droppable());

    on<GeburaFetchBoundAppInfosEvent>((event, emit) async {
      emit(GeburaFetchBoundAppsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.getBoundAppInfos,
        GetBoundAppInfosRequest(
          appInfoId: event.appID,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaFetchBoundAppsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      final appInfoMap = state.appInfoMap ?? {};
      appInfoMap[event.appID.id] = resp.getData().appInfos;
      emit(GeburaFetchBoundAppsState(
        state.copyWith(appInfoMap: appInfoMap),
        EventStatus.success,
        msg: resp.error,
      ));
      if (event.refreshAfterSuccess ?? false) {
        add(GeburaApplyLibraryFilterEvent());
      }
    });

    on<GeburaClearLocalLibraryStateEvent>((event, emit) async {
      emit(state.copyWith(
        localLibraryStateMessage: '',
      ));
    });

    on<GeburaRefreshAppInfoEvent>((event, emit) async {
      emit(GeburaRefreshAppInfoState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.syncAppInfos,
        SyncAppInfosRequest(
          appInfoIds: event.appInfoID,
          waitData: true,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaRefreshAppInfoState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaRefreshAppInfoState(
        state,
        EventStatus.success,
        msg: resp.error,
      ));
      add(GeburaRefreshLibraryEvent());
    });

    on<GeburaSearchNewAppInfoEvent>((event, emit) async {
      emit(GeburaSearchNewAppInfoState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.searchNewAppInfos,
        SearchNewAppInfosRequest(
          paging: PagingRequest(
            pageSize: Int64(10),
            pageNum: Int64(1),
          ),
          name: event.query,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaSearchNewAppInfoState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaSearchNewAppInfoState(
        state,
        EventStatus.success,
        msg: resp.error,
        infos: resp.getData().appInfos,
      ));
    }, transformer: droppable());

    on<GeburaAssignAppWithNewInfoEvent>((event, emit) async {
      emit(GeburaAssignAppInfoState(state, EventStatus.processing));
      final syncResp = await _api.doRequest(
          (client) => client.syncAppInfos,
          SyncAppInfosRequest(
            appInfoIds: [
              AppInfoID(
                  internal: false,
                  source: event.appInfoSource,
                  sourceAppId: event.appInfoSourceID)
            ],
            waitData: false,
          ));
      if (syncResp.status != ApiStatus.success) {
        emit(GeburaAssignAppInfoState(state, EventStatus.failed,
            msg: syncResp.error));
        return;
      }
      final boundInfoResp = await _api.doRequest(
          (client) => client.getBoundAppInfos,
          GetBoundAppInfosRequest(
            appInfoId: syncResp.getData().appInfos.first.id,
          ));
      if (boundInfoResp.status != ApiStatus.success) {
        emit(GeburaAssignAppInfoState(state, EventStatus.failed,
            msg: boundInfoResp.error));
        return;
      }
      if (!boundInfoResp
          .getData()
          .appInfos
          .any((element) => element.internal)) {
        emit(GeburaAssignAppInfoState(state, EventStatus.failed,
            msg: 'No internal app info found'));
      }
      final appInfoId = boundInfoResp
          .getData()
          .appInfos
          .firstWhere((element) => element.internal)
          .id;
      final resp = await _api.doRequest(
        (client) => client.assignApp,
        AssignAppRequest(
          appInfoId: appInfoId,
          appId: event.appID,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaAssignAppInfoState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaAssignAppInfoState(state, EventStatus.success,
          msg: resp.error));
      add(GeburaRefreshLibraryEvent());
    }, transformer: droppable());

    on<GeburaReportAppRunTimeEvent>((event, emit) async {
      emit(GeburaReportAppRunTimeState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.addAppInstRunTime,
        AddAppInstRunTimeRequest(
          appInstId: event.appInstID,
          timeRange: toPBTimeRange(
            event.startTime,
            event.endTime,
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaReportAppRunTimeState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaReportAppRunTimeState(
        state,
        EventStatus.success,
        msg: resp.error,
      ));
      add(GeburaRefreshLibraryEvent());
    });
  }

  Future<ListAppInfosResponse> listAppInfos(
      int pageSize, int pageNum, List<String> sourceFilter) async {
    final resp = await _api.doRequest(
      (client) => client.listAppInfos,
      ListAppInfosRequest(
        paging:
            PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
        sourceFilter: sourceFilter,
      ),
    );
    return resp.getData();
  }

  Future<ListAppsResponse> listApps(int pageSize, int pageNum) async {
    final resp = await _api.doRequest(
      (client) => client.listApps,
      ListAppsRequest(
        paging:
            PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
      ),
    );
    return resp.getData();
  }

  Future<void> showSteamAppDetails(String steamAppID) async {
    await launchUrlString('steam://nav/games/details/$steamAppID');
  }
}

AppInfo mixAppInfo(List<AppInfo> apps) {
  var mixedApp = AppInfo();
  if (apps.isEmpty) {
    return mixedApp;
  }
  mixedApp = apps.where((element) => element.internal).isNotEmpty
      ? apps.firstWhere((element) => element.internal)
      : AppInfo();
  for (final app in apps.where((element) => !element.internal)) {
    mixedApp.name = app.name.isNotEmpty ? app.name : mixedApp.name;
    mixedApp.shortDescription = app.shortDescription.isNotEmpty
        ? app.shortDescription
        : mixedApp.shortDescription;
    mixedApp.iconImageUrl =
        app.iconImageUrl.isNotEmpty ? app.iconImageUrl : mixedApp.iconImageUrl;
    mixedApp.backgroundImageUrl = app.backgroundImageUrl.isNotEmpty
        ? app.backgroundImageUrl
        : mixedApp.backgroundImageUrl;
    mixedApp.coverImageUrl = app.coverImageUrl.isNotEmpty
        ? app.coverImageUrl
        : mixedApp.coverImageUrl;
    mixedApp.tags.addAll(app.tags);
    mixedApp.altNames.addAll(app.altNames);

    mixedApp.details.description = app.details.description.isNotEmpty
        ? app.details.description
        : mixedApp.details.description;
    mixedApp.details.releaseDate = app.details.releaseDate.isNotEmpty
        ? app.details.releaseDate
        : mixedApp.details.releaseDate;
    mixedApp.details.developer = app.details.developer.isNotEmpty
        ? app.details.developer
        : mixedApp.details.developer;
    mixedApp.details.publisher = app.details.publisher.isNotEmpty
        ? app.details.publisher
        : mixedApp.details.publisher;
    mixedApp.details.version = app.details.version.isNotEmpty
        ? app.details.version
        : mixedApp.details.version;
    mixedApp.details.imageUrls.addAll(app.details.imageUrls);
  }
  return mixedApp;
}

AppInfoMixed appInfoToMixed(AppInfo appInfo) {
  return AppInfoMixed(
    id: appInfo.id,
    name: appInfo.name,
    type: appInfo.type,
    shortDescription: appInfo.shortDescription,
    iconImageUrl: appInfo.iconImageUrl,
    backgroundImageUrl: appInfo.backgroundImageUrl,
    coverImageUrl: appInfo.coverImageUrl,
    tags: appInfo.tags,
    altNames: appInfo.altNames,
    details: appInfo.details,
  );
}
