import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dao/dao.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../model/common_model.dart';
import '../../repo/tiphereth_repo.dart';
import '../../service/di_service.dart';
import '../../service/librarian_service.dart';

part 'tiphereth_bloc.mapper.dart';
part 'tiphereth_event.dart';
part 'tiphereth_state.dart';

class TipherethBloc extends Bloc<TipherethEvent, TipherethState> {
  final TipherethRepo _repo;
  final DIProvider<LibrarianService> _api;

  static Future<TipherethBloc> init(TipherethRepo repo,
      Stream<ServerID> serverID, DIProvider<LibrarianService> api) async {
    try {
      final initialState = TipherethState();
      final instance = TipherethBloc._(initialState, repo, api);
      serverID.listen((event) {
        instance.add(_TipherethSwitchServerEvent(event));
      });
      return instance;
    } catch (e) {
      debugPrint(e.toString());
      return TipherethBloc._(TipherethState(), repo, api);
    }
  }

  TipherethBloc._(super.initialState, this._repo, this._api) {
    on<_TipherethSwitchServerEvent>((event, emit) async {
      emit(TipherethState());
    });

    on<TipherethEditUserEvent>((event, emit) async {
      emit(TipherethEditUserState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.updateUser,
            UpdateUserRequest(user: event.user, password: event.password),
          );
      if (resp case Err()) {
        emit(
            TipherethEditUserState(state, EventStatus.failed, msg: resp.error));
        return;
      }
      emit(TipherethEditUserState(state, EventStatus.success));
    }, transformer: droppable());

    on<TipherethGetAccountsEvent>((event, emit) async {
      emit(TipherethGetAccountsState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.listLinkAccounts,
            ListLinkAccountsRequest(),
          );
      switch (resp) {
        case Err():
          emit(TipherethGetAccountsState(state, EventStatus.failed,
              msg: resp.error));
        case Ok():
          emit(TipherethGetAccountsState(
            state.copyWith(accounts: resp.v.accounts),
            EventStatus.success,
          ));
      }
    }, transformer: droppable());

    on<TipherethLinkAccountEvent>((event, emit) async {
      emit(TipherethLinkAccountState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.linkAccount,
            LinkAccountRequest(
              platform: event.platform,
              platformAccountId: event.platformAccountID,
            ),
          );
      if (resp case Err()) {
        emit(TipherethLinkAccountState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethGetAccountsEvent(event.context));
      emit(TipherethLinkAccountState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethUnLinkAccountEvent>((event, emit) async {
      emit(TipherethUnLinkAccountState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.unLinkAccount,
            UnLinkAccountRequest(
              platform: event.platform,
              platformAccountId: event.platformAccountID,
            ),
          );
      if (resp case Err()) {
        emit(TipherethUnLinkAccountState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethGetAccountsEvent(event.context));
      emit(TipherethUnLinkAccountState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethAddPorterContextEvent>((event, emit) async {
      emit(TipherethAddPorterContextState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.createPorterContext,
            CreatePorterContextRequest(context: event.porterContext),
          );
      if (resp case Err()) {
        emit(TipherethAddPorterContextState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadPorterContextsEvent(event.context));
      emit(TipherethAddPorterContextState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethEditPorterContextEvent>((event, emit) async {
      emit(TipherethEditPorterContextState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.updatePorterContext,
            UpdatePorterContextRequest(context: event.porterContext),
          );
      if (resp case Err()) {
        emit(TipherethEditPorterContextState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadPorterContextsEvent(event.context));
      emit(TipherethEditPorterContextState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethLoadPorterContextsEvent>((event, emit) async {
      emit(TipherethLoadPorterContextsState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.listPorterContexts,
            ListPorterContextsRequest(
              paging: PagingRequest(
                pageSize: Int64(1000),
                pageNum: Int64(1),
              ),
            ),
          );
      if (resp case Err()) {
        emit(TipherethLoadPorterContextsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      final resp2 = await _api.get(event.context.serverID).doRequest(
            (client) => client.listPorterDigests,
            ListPorterDigestsRequest(
              paging: PagingRequest(
                pageSize: Int64(1000),
                pageNum: Int64(1),
              ),
            ),
          );
      if (resp2 case Err()) {
        emit(TipherethLoadPorterContextsState(state, EventStatus.failed,
            msg: resp2.error));
        return;
      }
      emit(TipherethLoadPorterContextsState(
        state.copyWith(
          porterContexts: resp.unwrap().contexts,
          porterGroups: resp2.unwrap().porterGroups,
        ),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethLoadSessionsEvent>((event, emit) async {
      emit(TipherethLoadSessionsState(state, EventStatus.processing));
      debugPrint('load sessions ${event.context.serverID}');
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.listUserSessions,
            ListUserSessionsRequest(),
          );
      if (resp case Err()) {
        emit(TipherethLoadSessionsState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      emit(TipherethLoadSessionsState(
        state.copyWith(sessions: resp.unwrap().sessions),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<TipherethEditSessionEvent>((event, emit) async {
      emit(TipherethEditSessionState(state, EventStatus.processing));
      final resp = await _api.get(event.context.serverID).doRequest(
            (client) => client.deleteUserSession,
            DeleteUserSessionRequest(
              sessionId: event.sessionID,
            ),
          );
      if (resp case Err()) {
        emit(TipherethEditSessionState(state, EventStatus.failed,
            msg: resp.error));
        return;
      }
      add(TipherethLoadSessionsEvent(event.context));
      emit(TipherethEditSessionState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());
  }
}
