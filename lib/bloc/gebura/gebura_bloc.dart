import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../model/gebura_model.dart';
import '../../repo/grpc/api_helper.dart';
import '../../repo/local/gebura.dart';

part 'gebura_event.dart';
part 'gebura_state.dart';

class GeburaBloc extends Bloc<GeburaEvent, GeburaState> {
  final ApiHelper api;
  final GeburaRepo repo;

  GeburaBloc(this.api, this.repo) : super(GeburaState()) {
    on<GeburaInitEvent>((event, emit) async {
      if (state.purchasedApps == null) {
        add(GeburaPurchasedAppsLoadEvent());
      }
    });

    on<GeburaPurchasedAppsLoadEvent>((event, emit) async {
      debugPrint('GeburaPurchasedAppsLoadEvent');
      emit(GeburaPurchasedAppsLoadState(
          state, GeburaRequestStatusCode.processing));
      final resp = await api.doRequest(
        (client) => client.getPurchasedApps,
        GetPurchasedAppsRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaPurchasedAppsLoadState(state, GeburaRequestStatusCode.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaPurchasedAppsLoadState(
          state.copyWith(purchasedApps: resp.getData().apps),
          GeburaRequestStatusCode.success,
          msg: resp.error));
    }, transformer: droppable());

    on<GeburaSetPurchasedAppIndexEvent>((event, emit) async {
      final newState = state.copyWith();
      newState.selectedPurchasedAppIndex = event.index;
      emit(newState);
    });

    on<GeburaSearchAppsEvent>((event, emit) async {
      emit(GeburaSearchAppsState(state, GeburaRequestStatusCode.processing));
      final resp = await api.doRequest(
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
        emit(GeburaSearchAppsState(state, GeburaRequestStatusCode.failed,
            msg: resp.error));
        return;
      }
      final appMap = state.storeApps ?? <InternalID, App>{};
      for (final app in resp.getData().apps) {
        appMap[app.id] = app;
      }
      emit(GeburaSearchAppsState(
        state.copyWith(storeApps: appMap),
        GeburaRequestStatusCode.success,
        msg: resp.error,
        apps: resp.getData().apps,
      ));
    }, transformer: droppable());

    on<GeburaPurchaseEvent>((event, emit) async {
      emit(GeburaPurchaseState(state, GeburaRequestStatusCode.processing));
      final resp = await api.doRequest(
        (client) => client.purchaseApp,
        PurchaseAppRequest(
          appId: event.id,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(GeburaPurchaseState(state, GeburaRequestStatusCode.failed,
            msg: resp.error));
        return;
      }
      emit(GeburaPurchaseState(state, GeburaRequestStatusCode.success,
          msg: resp.error));
      add(GeburaPurchasedAppsLoadEvent());
    }, transformer: droppable());

    on<GeburaSetAppLauncherSettingEvent>((event, emit) async {
      await repo.setAppLauncherSetting(event.setting);
      emit(GeburaSetAppLauncherSettingState(
          state, GeburaRequestStatusCode.success));
    });
  }

  AppLauncherSetting? getAppLauncherSetting(InternalID id) {
    return repo.getAppLauncherSetting(id.id.toInt());
  }
}
