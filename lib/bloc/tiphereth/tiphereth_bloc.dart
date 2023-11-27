import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../model/common_model.dart';
import '../../repo/grpc/api_helper.dart';
import '../../repo/grpc/client.dart';
import '../../repo/local/common.dart';

part 'tiphereth_event.dart';
part 'tiphereth_state.dart';

class TipherethBloc extends Bloc<TipherethEvent, TipherethState> {
  final ApiHelper _api;
  final ClientCommonRepo _repo;

  TipherethBloc(this._api, this._repo) : super(TipherethState()) {
    final common = _repo.get();

    on<TipherethAutoLoginEvent>((event, emit) async {
      emit(TipherethAutoLoginState(state, EventStatus.processing));
      if (common.server != null) {
        final config = ServerConfig(
          common.server!.host,
          common.server!.port,
          common.server!.tls,
          '',
        );
        emit(TipherethAutoLoginState(
            state.copyWith(serverConfig: config), EventStatus.processing));
        if (common.server!.refreshToken != null) {
          try {
            final client = clientFactory(config: config);
            final refreshToken = common.server!.refreshToken!;
            final resp = await client.refreshToken(RefreshTokenRequest(),
                options: withAuth(refreshToken));
            final user = await client.getUser(GetUserRequest(),
                options: withAuth(resp.accessToken));
            await _repo.set(common.copyWith(
              server: ServerConfig(
                config.host,
                config.port,
                config.tls,
                '',
                refreshToken: resp.refreshToken,
              ),
            ));
            _api.init(client, resp.accessToken, resp.refreshToken);
            debugPrint('login by refresh token success ${user.user}');
            emit(TipherethAutoLoginState(
                state.copyWith(
                  accessToken: resp.accessToken,
                  currentUser: user.user,
                ),
                EventStatus.success));
            return;
          } catch (e) {
            debugPrint('login by refresh token failed');
          }
        }
      }
      debugPrint('login by refresh token failed');
      emit(TipherethAutoLoginState(state, EventStatus.failed));
    }, transformer: droppable());

    on<TipherethSetServerConfigEvent>((event, emit) async {
      emit(state.copyWith(serverConfig: event.config));
    });

    on<TipherethManualLoginEvent>((event, emit) async {
      if (state.serverConfig == null) {
        return;
      }
      emit(TipherethManualLoginState(state, EventStatus.processing));

      try {
        final config = state.serverConfig!;
        final client = clientFactory(config: config);
        final resp = await client.getToken(
          GetTokenRequest(username: event.username, password: event.password),
        );
        final user = await client.getUser(GetUserRequest(),
            options: withAuth(resp.accessToken));
        await _repo.set(common.copyWith(
          server: ServerConfig(
            config.host,
            config.port,
            config.tls,
            '',
            refreshToken: resp.refreshToken,
          ),
        ));
        _api.init(client, resp.accessToken, resp.refreshToken);
        emit(TipherethManualLoginState(
          state.copyWith(
            accessToken: resp.accessToken,
            currentUser: user.user,
          ),
          EventStatus.success,
        ));
      } catch (e) {
        debugPrint(e.toString());
        emit(TipherethManualLoginState(state, EventStatus.failed,
            msg: e.toString()));
      }
    }, transformer: droppable());

    on<TipherethLogoutEvent>((event, emit) async {
      emit(TipherethState());
      await _repo.set(ClientCommonData(
        server: null,
        theme: common.theme,
        themeMode: common.themeMode,
      ));
    });

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
        paging: PagingRequest(pageSize: pageSize, pageNum: pageNum),
        typeFilter: typeFilter,
        statusFilter: statusFilter,
      ),
    );
    return resp.getData();
  }
}
