import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../repo/grpc/api_helper.dart';

part 'tiphereth_event.dart';
part 'tiphereth_state.dart';

class TipherethBloc extends Bloc<TipherethEvent, TipherethState> {
  final ApiHelper _api;

  TipherethBloc(this._api) : super(TipherethState()) {
    on<TipherethAddUserEvent>((event, emit) async {
      emit(TipherethAddUserState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createUser,
        CreateUserRequest(user: event.user),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethAddUserState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(TipherethAddUserState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<TipherethEditUserEvent>((event, emit) async {
      emit(TipherethEditUserState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updateUser,
        UpdateUserRequest(user: event.user, password: event.password),
      );
      if (resp.status != ApiStatus.success) {
        emit(
            TipherethEditUserState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(TipherethEditUserState(state, EventStatus.success, msg: resp.error));
    }, transformer: droppable());

    on<TipherethGetAccountsEvent>((event, emit) async {
      emit(TipherethGetAccountsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.listLinkAccounts,
        ListLinkAccountsRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethGetAccountsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(TipherethGetAccountsState(
          state.copyWith(accounts: resp.getData().accounts),
          EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethLinkAccountEvent>((event, emit) async {
      emit(TipherethLinkAccountState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.linkAccount,
        LinkAccountRequest(
          accountId: AccountID(
            platform: event.platform,
            platformAccountId: event.platformAccountID,
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethLinkAccountState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethGetAccountsEvent());
      emit(TipherethLinkAccountState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethUnLinkAccountEvent>((event, emit) async {
      emit(TipherethUnLinkAccountState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.unLinkAccount,
        UnLinkAccountRequest(
          accountId: AccountID(
            platform: event.platform,
            platformAccountId: event.platformAccountID,
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethUnLinkAccountState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethGetAccountsEvent());
      emit(TipherethUnLinkAccountState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethLoadPortersEvent>((event, emit) async {
      emit(TipherethLoadPortersState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.listPorters,
        ListPortersRequest(
          paging: PagingRequest(
            pageSize: Int64(100),
            pageNum: Int64(1),
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethLoadPortersState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(TipherethLoadPortersState(
          state.copyWith(porters: resp.getData().porters), EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethSetPorterEditIndexEvent>((event, emit) async {
      final newState = state.copyWith();
      newState.selectedPorterEditIndex = event.index;
      emit(newState);
    });

    on<TipherethEditPorterEvent>((event, emit) async {
      emit(TipherethEditPorterState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updatePorterStatus,
        UpdatePorterStatusRequest(
          porterId: event.porterID,
          status: event.status,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethEditPorterState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadPortersEvent());
      emit(TipherethEditPorterState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethAddPorterContextEvent>((event, emit) async {
      emit(TipherethAddPorterContextState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.createPorterContext,
        CreatePorterContextRequest(context: event.porterContext),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethAddPorterContextState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadPorterContextsEvent());
      emit(TipherethAddPorterContextState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethEditPorterContextEvent>((event, emit) async {
      emit(TipherethEditPorterContextState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.updatePorterContext,
        UpdatePorterContextRequest(context: event.porterContext),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethEditPorterContextState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadPorterContextsEvent());
      emit(TipherethEditPorterContextState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethLoadPorterContextsEvent>((event, emit) async {
      emit(TipherethLoadPorterContextsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.listPorterContexts,
        ListPorterContextsRequest(
          paging: PagingRequest(
            pageSize: Int64(1000),
            pageNum: Int64(1),
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethLoadPorterContextsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      final resp2 = await _api.doRequest(
        (client) => client.listPorterGroups,
        ListPorterGroupsRequest(
          paging: PagingRequest(
            pageSize: Int64(1000),
            pageNum: Int64(1),
          ),
        ),
      );
      if (resp2.status != ApiStatus.success) {
        emit(TipherethLoadPorterContextsState(state, EventStatus.failed,
            msg: resp2.error));
        return;
      }
      emit(TipherethLoadPorterContextsState(
          state.copyWith(
            porterContexts: resp.getData().contexts,
            porterGroups: resp2.getData().porterGroups,
          ),
          EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethLoadSessionsEvent>((event, emit) async {
      emit(TipherethLoadSessionsState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.listUserSessions,
        ListUserSessionsRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethLoadSessionsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(TipherethLoadSessionsState(
          state.copyWith(sessions: resp.getData().sessions),
          EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());

    on<TipherethSetSessionEditIndexEvent>((event, emit) async {
      final newState = state.copyWith();
      newState.selectedSessionEditIndex = event.index;
      emit(newState);
    });

    on<TipherethEditSessionEvent>((event, emit) async {
      emit(TipherethEditSessionState(state, EventStatus.processing));
      final resp = await _api.doRequest(
        (client) => client.deleteUserSession,
        DeleteUserSessionRequest(
          sessionId: event.sessionID,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(TipherethEditSessionState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadSessionsEvent());
      emit(TipherethEditSessionState(state, EventStatus.success,
          msg: resp.error));
    }, transformer: droppable());
  }

  Future<ListUsersResponse> listUsers(
    int pageSize,
    int pageNum,
    List<UserType> typeFilter,
    List<UserStatus> statusFilter,
  ) async {
    final resp = await _api.doRequest(
      (client) => client.listUsers,
      ListUsersRequest(
        paging:
            PagingRequest(pageSize: Int64(pageSize), pageNum: Int64(pageNum)),
        typeFilter: typeFilter,
        statusFilter: statusFilter,
      ),
    );
    return resp.getData();
  }
}
