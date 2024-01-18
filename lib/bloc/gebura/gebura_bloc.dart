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
      final appMap = state.storeApps ?? <InternalID, AppMixed>{};
      for (final app in resp.getData().apps) {
        appMap[app.id] = app;
      }
      emit(GeburaSearchAppsState(
        state.copyWith(storeApps: appMap),
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
          appId: event.id,
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
            msg: '请先设置应用路径'));
        return;
      }
      if (state.runState![event.appID] != null &&
          state.runState![event.appID]!.running) {
        emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
            msg: '请勿重复运行'));
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
              msg: '应用未正常退出'));
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
            msg: '启动器错误 ${e is FrbAnyhowException ? e.anyhow : e}'));
        return;
      }
    });

    on<GeburaScanLocalLibraryEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(state.copyWith(localLibraryState: '正在扫描本地文件'));
      final (apps, result) = await scanLocalLibrary();
      emit(state.copyWith(
        localLibraryState: '',
        localSteamScanResult: result,
        localSteamApps: apps,
      ));
    }, transformer: droppable());

    on<GeburaImportSteamAppsEvent>((event, emit) async {
      if (!PlatformHelper.isWindowsApp()) {
        return;
      }
      emit(GeburaImportSteamAppsState(
          state.copyWith(localLibraryState: '正在导入Steam应用'),
          EventStatus.processing));
      var successCount = 0;
      var failedCount = 0;
      var importedSteamApps = _repo.getImportedSteamApps();
      for (final app in event.appIDs) {
        emit(GeburaImportSteamAppsState(
            state.copyWith(
              localLibraryState:
                  '正在导入Steam应用 $successCount ( $failedCount ) / ${event.appIDs.length}',
            ),
            EventStatus.processing));
        if (importedSteamApps.any((element) => element.steamAppID == app)) {
          successCount += 1;
          continue;
        }
        final syncResp = await _api.doRequest(
          (client) => client.syncApps,
          SyncAppsRequest(
            appIds: [AppID(internal: false, source: 'steam', sourceAppId: app)],
            waitData: true,
          ),
        );
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
        } else {
          successCount += 1;
          importedSteamApps.add(ImportedSteamApp(
            steamAppID: app,
            internalID: createResp.getData().id.id.toInt(),
          ));
          if (syncResp.status == ApiStatus.success &&
              syncResp.getData().apps.isNotEmpty) {
            await _api.doRequest(
              (client) => client.assignAppPackage,
              AssignAppPackageRequest(
                appId: syncResp.getData().apps.first.id,
                appPackageId: createResp.getData().id,
              ),
            );
            await _api.doRequest(
              (client) => client.purchaseApp,
              PurchaseAppRequest(
                appId: syncResp.getData().apps.first.id,
              ),
            );
          }
        }
      }
      await _repo.setImportedSteamApps(importedSteamApps);
      add(GeburaPurchasedAppsLoadEvent());
      emit(GeburaImportSteamAppsState(
          state.copyWith(
            localLibraryState: 'Steam应用导入完成，$successCount 成功，$failedCount 失败',
            importedSteamApps: importedSteamApps,
          ),
          EventStatus.success));
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
