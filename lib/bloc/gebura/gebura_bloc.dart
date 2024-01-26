import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:path/path.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

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

  GeburaBloc(this._api, this._repo) : super(GeburaState()) {
    on<GeburaInitEvent>((event, emit) async {
      if (state.purchasedApps == null) {
        add(GeburaPurchasedAppsLoadEvent());
        add(GeburaScanLocalLibraryEvent());
      }
    });

    on<GeburaPurchasedAppsLoadEvent>((event, emit) async {
      emit(GeburaPurchasedAppsLoadState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.getPurchasedApps,
        GetPurchasedAppsRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaPurchasedAppsLoadState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaPurchasedAppsLoadState(
          state.copyWith(purchasedApps: resp.getData().apps),
          EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<GeburaSetPurchasedAppIndexEvent>((event, emit) async {
      final newState = state.copyWith();
      newState.selectedPurchasedAppIndex = event.index;
      emit(newState);
    });

    on<GeburaSearchAppsEvent>((event, emit) async {
      emit(GeburaSearchAppsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.searchApps,
        SearchAppsRequest(
          paging: PagingRequest(
            pageSize: Int64(10),
            pageNum: Int64(1),
          ),
          keywords: event.query,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaSearchAppsState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaSearchAppsState(
        state,
        EventStatus.success,
        msg: resp.error,
        apps: resp.getData().apps,
      ));
    }, transformer: droppable());

    on<GeburaPurchaseEvent>((event, emit) async {
      emit(GeburaPurchaseState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.purchaseApp,
        PurchaseAppRequest(
          appId: AppID(
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
      add(GeburaPurchasedAppsLoadEvent());
    }, transformer: droppable());

    on<GeburaSetAppLauncherSettingEvent>((event, emit) async {
      debugPrint(event.setting.toString());
      await _repo.setAppLauncherSetting(event.setting);
      emit(GeburaSetAppLauncherSettingState(state, EventStatus.success));
    });

    on<GeburaAddAppEvent>((event, emit) async {
      emit(GeburaAddAppState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createApp,
        CreateAppRequest(
          app: event.app,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaAddAppState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaAddAppState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<GeburaEditAppEvent>((event, emit) async {
      emit(GeburaEditAppState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updateApp,
        UpdateAppRequest(
          app: event.app,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaEditAppState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(GeburaEditAppState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<GeburaAddAppPackageEvent>((event, emit) async {
      emit(GeburaAddAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createAppPackage,
        CreateAppPackageRequest(
          appPackage: event.appPackage,
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

    on<GeburaEditAppPackageEvent>((event, emit) async {
      emit(GeburaEditAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updateAppPackage,
        UpdateAppPackageRequest(
          appPackage: event.appPackage,
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

    on<GeburaAssignAppPackageEvent>((event, emit) async {
      emit(GeburaAssignAppPackageState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.assignAppPackage,
        AssignAppPackageRequest(
          appId: event.appID,
          appPackageId: event.appPackageID,
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
      state.runState ??= {};
      emit(GeburaRunAppState(state, event.appID, EventStatus.processing));
      final setting = _repo.getAppLauncherSetting(event.appID.id.toInt());
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
    });

    on<GeburaScanLocalLibraryEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(state.copyWith(localLibraryState: S.current.scanningLocalFiles));
      final (apps, result) = await scanLocalLibrary();
      final folders = await getSteamLibraryFolders();
      final imported = _repo.getImportedSteamApps();
      final unImported = apps.where((element) =>
          !imported.any((imported) => imported.steamAppID == element.appId));
      emit(state.copyWith(
        localLibraryState: unImported.isNotEmpty
            ? S.current.newApplicationFound(unImported.length)
            : '',
        localSteamScanResult: result,
        localSteamApps: apps,
        importedSteamApps: imported,
        localSteamLibraryFolders: folders,
      ));
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
      final importedSteamApps = _repo.getImportedSteamApps();
      for (final app in event.appIDs) {
        processCount += 1;
        emit(GeburaImportSteamAppsState(
            state.copyWith(
              localLibraryState:
                  '${S.current.importingSteamApplications} $processCount ( $failedCount ) / ${event.appIDs.length}',
            ),
            EventStatus.processing));
        if (importedSteamApps.any((element) => element.steamAppID == app)) {
          continue;
        }
        await _api.doRequest(
          (client) => client.syncApps,
          SyncAppsRequest(
            appIds: [AppID(internal: false, source: 'steam', sourceAppId: app)],
            waitData: true,
          ),
        );
        final purchaseResp = await _api.doRequest(
          (client) => client.purchaseApp,
          PurchaseAppRequest(
            appId: AppID(internal: false, source: 'steam', sourceAppId: app),
          ),
        );
        if (purchaseResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        final createResp = await _api.doRequest(
          (client) => client.createAppPackage,
          CreateAppPackageRequest(
            appPackage: AppPackage(
              source: AppPackageSource.APP_PACKAGE_SOURCE_MANUAL,
              name: (state.localSteamApps ?? [])
                  .firstWhere((element) => element.appId == app)
                  .name,
            ),
          ),
        );
        if (createResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        final assignResp = await _api.doRequest(
          (client) => client.assignAppPackage,
          AssignAppPackageRequest(
            appId: purchaseResp.getData().id,
            appPackageId: createResp.getData().id,
          ),
        );
        if (assignResp.status != ApiStatus.success) {
          failedCount += 1;
          continue;
        }
        importedSteamApps.add(ImportedSteamApp(
          internalID: purchaseResp.getData().id.id.toInt(),
          steamAppID: app,
        ));
      }
      await _repo.setImportedSteamApps(importedSteamApps);
      add(GeburaPurchasedAppsLoadEvent());
      emit(GeburaImportSteamAppsState(
          state.copyWith(
            localLibraryState: S.current.importSteamApplicationFinished(
                processCount - failedCount, failedCount),
            importedSteamApps: importedSteamApps,
          ),
          EventStatus.success));
    }, transformer: droppable());

    on<GeburaFetchBoundAppsEvent>((event, emit) async {
      emit(GeburaFetchBoundAppsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.getBoundApps,
        GetBoundAppsRequest(
          appId: event.appID,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaFetchBoundAppsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      final storeApps = state.storeApps ?? {};
      storeApps[event.appID] = resp.getData().apps;
      emit(GeburaFetchBoundAppsState(
        state.copyWith(storeApps: storeApps),
        EventStatus.success,
        msg: resp.error,
      ));
    }, transformer: droppable());
  }

  AppLauncherSetting? getAppLauncherSetting(InternalID id) {
    return _repo.getAppLauncherSetting(id.id.toInt());
  }

  Future<ListAppsResponse> listApps(
      int pageSize, int pageNum, List<String> sourceFilter) async {
    final resp = await _api.doRequest(
      (client) => client.listApps,
      ListAppsRequest(
        paging:
            PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
        sourceFilter: sourceFilter,
      ),
    );
    return resp.getData();
  }

  Future<ListAppPackagesResponse> listAppPackages(
      int pageSize, int pageNum, List<AppPackageSource> sourceFilter) async {
    final resp = await _api.doRequest(
      (client) => client.listAppPackages,
      ListAppPackagesRequest(
        paging:
            PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
        sourceFilter: sourceFilter,
      ),
    );
    return resp.getData();
  }
}

App mixApp(List<App> apps) {
  var mixedApp = App();
  if (apps.isEmpty) {
    return mixedApp;
  }
  mixedApp = apps.where((element) => element.internal).isNotEmpty
      ? apps.firstWhere((element) => element.internal)
      : App();
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
