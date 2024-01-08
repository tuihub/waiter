import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../model/common_model.dart';
import '../../model/tiphereth_model.dart';
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
        UpdateUserRequest(user: event.user),
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
