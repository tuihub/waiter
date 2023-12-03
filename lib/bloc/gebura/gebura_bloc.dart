import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:path/path.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../ffi/ffi.dart';
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
            pageSize: 10,
            pageNum: 1,
          ),
          keywords: event.query,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaSearchAppsState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      final appMap = state.storeApps ?? <InternalID, App>{};
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
      emit(GeburaRunAppState(state, event.appID, EventStatus.processing));
      final setting = _repo.getAppLauncherSetting(event.appID.id.toInt());
      if (setting == null) {
        emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
            msg: '请先设置应用路径'));
        return;
      }
      try {
        final (start, end, suceess) = await FFI().processRunner(
            '', setting.path, '', dirname(setting.path), 1, 1000);
        if (!suceess) {
          emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
              msg: '应用未正常退出'));
          return;
        }
        emit(GeburaRunAppState(state, event.appID, EventStatus.success,
            startTime: DateTime.fromMillisecondsSinceEpoch(start * 1000),
            endTime: DateTime.fromMillisecondsSinceEpoch(end * 1000)));
      } catch (e) {
        emit(GeburaRunAppState(state, event.appID, EventStatus.failed,
            msg: '启动器错误 ${e is FrbAnyhowException ? e.anyhow : e}'));
        return;
      }
    });
  }

  AppLauncherSetting? getAppLauncherSetting(InternalID id) {
    return _repo.getAppLauncherSetting(id.id.toInt());
  }

  Future<ListAppsResponse> listApps(
      int pageSize, int pageNum, List<AppSource> sourceFilter) async {
    final resp = await _api.doRequest(
      (client) => client.listApps,
      ListAppsRequest(
        paging: PagingRequest(pageSize: pageSize, pageNum: pageNum),
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
        paging: PagingRequest(pageSize: pageSize, pageNum: pageNum),
        sourceFilter: sourceFilter,
      ),
    );
    return resp.getData();
  }
}
