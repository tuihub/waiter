import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../model/common_model.dart';
import '../../repo/grpc/api_helper.dart';
import '../../repo/grpc/client.dart';
import '../../repo/local/common.dart';

part 'tiphereth_event.dart';
part 'tiphereth_state.dart';

class TipherethBloc extends Bloc<TipherethEvent, TipherethState> {
  final ApiHelper api;
  final ClientCommonRepo repo;

  TipherethBloc(this.api, this.repo) : super(AppInitialize()) {
    final common = repo.get();

    on<LoadLocalSettingEvent>((event, emit) async {
      emit(AutoLogging());
      if (common.server != null) {
        final config = ServerConfig(
          common.server!.host,
          common.server!.port,
          common.server!.tls,
          '',
        );
        final client = clientFactory(config: config);
        if (common.server!.refreshToken != null) {
          final refreshToken = common.server!.refreshToken!;
          try {
            final resp = await client.refreshToken(RefreshTokenRequest(),
                options: withAuth(refreshToken));
            final user = await client.getUser(GetUserRequest(),
                options: withAuth(resp.accessToken));
            api.init(client, resp.accessToken, resp.refreshToken);
            emit(UserLoggedIn(config, resp.accessToken, user.user));
            return;
          } catch (e) {
            debugPrint('login by refresh token failed');
          }
        }
      }
      emit(AutoLoginFailed());
    });

    on<ManualLoginEvent>((event, emit) async {
      emit(ServerSelecting());
    });

    on<ConnectToServerEvent>((event, emit) async {
      await repo.set(common.copyWith(
        server: event.config,
      ));
      emit(ServerSelected(event.config));
    });

    on<UserLogoutEvent>((event, emit) async {
      await repo.set(ClientCommonData(
        server: null,
        theme: common.theme,
        themeMode: common.themeMode,
      ));
      emit(ServerSelecting());
    });

    on<UserLoginEvent>((event, emit) async {
      if (state is! ServerSelected) {
        return;
      }

      final config = (state as ServerSelected).serverConfig;
      final client = clientFactory(config: config);

      emit(UserLoginLoading(
        event.username,
        event.password,
        config,
      ));
      try {
        final resp = await client.getToken(
          GetTokenRequest(username: event.username, password: event.password),
        );
        debugPrint(resp.toDebugString());
        final user = await client.getUser(GetUserRequest(),
            options: withAuth(resp.accessToken));
        await repo.set(common.copyWith(
          server: ServerConfig(
            config.host,
            config.port,
            config.tls,
            '',
            refreshToken: resp.refreshToken,
          ),
        ));
        api.init(client, resp.accessToken, resp.refreshToken);
        emit(UserLoggedIn(
          config,
          resp.accessToken,
          user.user,
        ));
      } catch (e) {
        debugPrint(e.toString());
        emit(UserLoginFailed(
          event.username,
          event.password,
          config,
          10,
          e.toString(),
        ));
      }
    });
  }
}
