import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:path/path.dart';
import 'package:pinyin/pinyin.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../common/platform.dart';
import '../../common/steam/local_library.dart';
import '../../ffi/ffi.dart';
import '../../ffi/ffi_model.dart';
import '../../l10n/l10n.dart';
import '../../model/gebura_model.dart';
import '../../repo/grpc/api_helper.dart';
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
      emit(GeburaRefreshLibraryState(
        state.copyWith(
          purchasedAppInfos: resp.getData().appInfos,
          ownedApps: ownedApps,
          ownedAppInsts: ownedAppInsts,
        ),
        EventStatus.success,
        msg: resp.error,
      ));
      add(GeburaApplyLibrarySettingsEvent());
    }, transformer: droppable());

    on<GeburaApplyLibrarySettingsEvent>((event, emit) async {
      var settings =
          state.librarySettings ?? const LibrarySettings(query: null);
      if (event.usePreviousSettings == null || !event.usePreviousSettings!) {
        settings = settings.copyWith(query: event.query);
      }
      // prepare library items
      Map<Int64, AppInfoMixed> libraryItemMap = Map.fromEntries(
        (state.purchasedAppInfos ?? []).map((e) => MapEntry(e.id.id, e)),
      );
      final appInfoMap = state.appInfoMap ?? {};
      for (final App app in state.ownedApps ?? []) {
        if (app.hasAssignedAppInfoId() && app.assignedAppInfoId.id > 0) {
          if (libraryItemMap[app.assignedAppInfoId.id] != null) {
            continue;
          } else if (appInfoMap[app.assignedAppInfoId.id] != null) {
            libraryItemMap[app.assignedAppInfoId.id] =
                appInfoToMixed(mixAppInfo(
              appInfoMap[app.assignedAppInfoId.id]!,
            ));
          } else {
            add(GeburaFetchBoundAppInfosEvent(
              app.assignedAppInfoId,
              refreshAfterSuccess: true,
            ));
          }
        } else {
          libraryItemMap[app.id.id] = AppInfoMixed(
            id: app.id,
            name: app.name,
            shortDescription: app.description,
          );
        }
      }
      // apply query
      if (settings.query != null && settings.query!.isNotEmpty) {
        final query = settings.query!.toLowerCase();
        libraryItemMap = Map.fromEntries(libraryItemMap.entries.where(
          (element) {
            final text = element.value.name;
            final selected =
                element.value.id.id.toInt() == state.selectedLibraryItem;
            return selected ||
                text.toLowerCase().contains(query) ||
                PinyinHelper.getPinyinE(text, separator: '')
                    .toLowerCase()
                    .contains(query);
          },
        ));
      }
      // sort by name
      libraryItemMap = Map.fromEntries(libraryItemMap.entries.toList()
        ..sort((a, b) => a.value.name.compareTo(b.value.name)));
      // emit
      emit(state.copyWith(
        libraryItems: libraryItemMap.values.toList(),
        librarySettings: settings,
      ));
    });

    on<GeburaSetSelectedLibraryItemEvent>((event, emit) async {
      final newState = state.copyWith();
      newState.selectedLibraryItem = event.id?.id.toInt();
      emit(newState);
    });

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

    on<GeburaSetLocalAppInstLauncherSettingEvent>((event, emit) async {
      debugPrint(event.setting.toString());
      await _repo.setLocalAppInstLauncherSetting(event.setting);
      emit(GeburaSetAppLauncherSettingState(state, EventStatus.success));
    });

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

    on<GeburaRunAppEvent>((event, emit) async {
      final appSetting = state.appLauncherSettings?[event.appID.id];
      if (appSetting == null) {
        emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
            msg: S.current.pleaseSetupApplicationPath));
        return;
      }
      switch (appSetting.type) {
        case AppLauncherType.steam:
          if (appSetting.steamAppID == null) {
            emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          await launchUrlString('steam://run/${appSetting.steamAppID}');
        case AppLauncherType.local:
          if (appSetting.localAppInstID == null) {
            emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          state.runState ??= {};
          emit(GeburaRunAppState(state, event.appID, EventStatus.processing));
          final setting =
              _repo.getLocalAppInstLauncherSetting(event.appID.id.toInt());
          if (setting == null || setting.path.isEmpty) {
            emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                msg: S.current.pleaseSetupApplicationPath));
            return;
          }
          if (state.runState![event.appID] != null &&
              state.runState![event.appID]!.running) {
            emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                msg: S.current.pleaseDontReRunApplication));
            return;
          }
          state.runState![event.appID] =
              const AppRunState(running: true, startTime: null, endTime: null);
          emit(GeburaRunAppState(state, event.appID, EventStatus.processing));
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
              state.runState![event.appID] =
                  state.runState![event.appID]!.copyWith(running: false);
              emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                  msg: S.current.applicationExitAbnormally));
              return;
            }
            state.runState![event.appID] = AppRunState(
              running: false,
              startTime: DateTime.fromMillisecondsSinceEpoch(start * 1000),
              endTime: DateTime.fromMillisecondsSinceEpoch(end * 1000),
            );
            emit(GeburaRunAppState(
              state,
              event.appID,
              EventStatus.success,
            ));
          } catch (e) {
            state.runState![event.appID] =
                state.runState![event.appID]!.copyWith(running: false);
            emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
                msg:
                    '${S.current.launcherError} ${e is FrbAnyhowException ? e.anyhow : e}'));
            return;
          }
      }
    });

    on<GeburaScanLocalLibraryEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(state.copyWith(localLibraryState: S.current.scanningLocalFiles));
      final (apps, result) = await scanLocalLibrary();
      final folders = await getSteamLibraryFolders();
      final imported = _repo.getImportedSteamAppInsts();
      final unImported = apps.where((element) =>
          !imported.any((imported) => imported.steamAppID == element.appId));
      emit(state.copyWith(
        localLibraryState: unImported.isNotEmpty
            ? S.current.newApplicationFound(unImported.length)
            : '',
        localSteamScanResult: result,
        localSteamAppInsts: apps,
        importedSteamAppInsts: imported,
        localSteamLibraryFolders: folders,
      ));
    }, transformer: droppable());

    on<GeburaImportNewAppInstEvent>((event, emit) async {
      emit(GeburaImportNewAppInstState(state, EventStatus.processing));
      final appResp = await _api.doRequest(
        (client) => client.createApp,
        CreateAppRequest(
          app: App(
            name: event.name,
          ),
        ),
      );
      if (appResp.status != ApiStatus.success) {
        emit(GeburaImportNewAppInstState(state, EventStatus.failed,
            msg: appResp.error));
        return;
      }
      final instResp = await _api.doRequest(
        (client) => client.createAppInst,
        CreateAppInstRequest(
          appInst: AppInst(
            appId: appResp.getData().id,
            deviceId: _deviceID,
          ),
        ),
      );
      if (instResp.status != ApiStatus.success) {
        emit(GeburaImportNewAppInstState(state, EventStatus.failed,
            msg: instResp.error));
        return;
      }
      await _repo.setLocalAppInstIndependent(LocalAppInstIndependent(
        appInstID: instResp.getData().id.id.toInt(),
        path: event.path,
      ));
      await _repo.setLocalAppInstLauncherSetting(LocalAppInstLauncherSetting(
        appInstID: instResp.getData().id.id.toInt(),
        path: '',
        installPath: event.path,
        realPath: '',
        processName: '',
        sleepTime: 0,
        advancedTracing: false,
      ));
      add(GeburaRefreshLibraryEvent());
      emit(GeburaImportNewAppInstState(state, EventStatus.success,
          msg: instResp.error));
    }, transformer: droppable());

    on<GeburaImportSteamAppsEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(GeburaImportSteamAppsState(
          state.copyWith(
              localLibraryState: S.current.importingSteamApplications),
          EventStatus.processing));
      var processCount = 0;
      var failedCount = 0;
      final importedSteamApps = _repo.getImportedSteamAppInsts();
      for (final steamAppID in event.steamAppIDs) {
        processCount += 1;
        emit(GeburaImportSteamAppsState(
            state.copyWith(
              localLibraryState:
                  '${S.current.importingSteamApplications} $processCount ( $failedCount ) / ${event.steamAppIDs.length}',
            ),
            EventStatus.processing));
        if (importedSteamApps
            .any((element) => element.steamAppID == steamAppID)) {
          continue;
        }
        await _api.doRequest(
          (client) => client.syncAppInfos,
          SyncAppInfosRequest(
            appInfoIds: [
              AppInfoID(
                  internal: false, source: 'steam', sourceAppId: steamAppID)
            ],
            waitData: true,
          ),
        );
        final purchaseResp = await _api.doRequest(
          (client) => client.purchaseAppInfo,
          PurchaseAppInfoRequest(
            appInfoId: AppInfoID(
                internal: false, source: 'steam', sourceAppId: steamAppID),
          ),
        );
        if (purchaseResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        final createResp = await _api.doRequest(
          (client) => client.createApp,
          CreateAppRequest(
            app: App(
              name: (state.localSteamAppInsts ?? [])
                  .firstWhere((element) => element.appId == steamAppID)
                  .name,
            ),
          ),
        );
        if (createResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        final assignResp = await _api.doRequest(
          (client) => client.assignApp,
          AssignAppRequest(
            appInfoId: purchaseResp.getData().id,
            appId: createResp.getData().id,
          ),
        );
        if (assignResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        final instResp = await _api.doRequest(
          (client) => client.createAppInst,
          CreateAppInstRequest(
            appInst: AppInst(
              appId: createResp.getData().id,
              deviceId: _deviceID,
            ),
          ),
        );
        if (instResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        importedSteamApps.add(ImportedSteamAppInst(
          instID: instResp.getData().id.id.toInt(),
          appID: createResp.getData().id.id.toInt(),
          steamAppID: steamAppID,
        ));
      }
      await _repo.setImportedSteamAppInsts(importedSteamApps);
      add(GeburaRefreshLibraryEvent());
      emit(GeburaImportSteamAppsState(
          state.copyWith(
            localLibraryState: S.current.importSteamApplicationFinished(
                processCount - failedCount, failedCount),
            importedSteamAppInsts: importedSteamApps,
          ),
          EventStatus.success));
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
        add(GeburaApplyLibrarySettingsEvent());
      }
    });

    on<GeburaSetAppLauncherSettingEvent>((event, emit) async {
      await _repo.setAppLauncherSetting(event.appID.id.toInt(), event.setting);
      emit(state.copyWith(
        appLauncherSettings: {
          ...state.appLauncherSettings ?? {},
          event.appID.id: event.setting,
        },
      ));
    });

    on<GeburaFetchAppLauncherSettingEvent>((event, emit) async {
      final setting = _repo.getAppLauncherSetting(event.appID.id.toInt());
      if (setting != null) {
        emit(state.copyWith(
          appLauncherSettings: {
            ...state.appLauncherSettings ?? {},
            event.appID.id: setting,
          },
        ));
      }
    });
  }

  LocalAppInstLauncherSetting? getAppLauncherSetting(InternalID id) {
    return _repo.getLocalAppInstLauncherSetting(id.id.toInt());
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
