import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/client/api_helper.dart';
import 'package:waitress/common/client/client.dart';
import 'package:waitress/common/store/setting_dao.dart';

import '../../common/const/string.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserLoginState> {
  final SettingDao _dao;

  UserBloc(this._dao) : super(AppInitialize()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadLocalSettingEvent) {
        emit(AutoLogging());
        if (_dao.exsist(SettingKey.serverConfig)) {
          final config = _dao.require<ServerConfig>(SettingKey.serverConfig);
          final client = clientFactory(config: config);
          if (_dao.exsist(SettingKey.refreshToken)) {
            final refreshToken = _dao.require(SettingKey.refreshToken);
            try {
              final resp = await client.refreshToken(RefreshTokenRequest(),
                  options: withAuth(refreshToken));
              ApiHelper.instance.init(client, resp.accessToken);
              emit(UserLoggedIn(config, resp.accessToken));
              return;
            } catch (e) {
              debugPrint("login by refresh token fail");
            }
          }
        }
        emit(AutoLoginFailed());
      }
      if (event is ManualLoginEvent) {
        emit(ServerSelecting());
      }
      if (event is ConnectToServerEvent) {
        // emit(ServerConnectLoading(event.config));

        // final grpcProvider = newGrpc("theam-grpc.gyx.moe", port: 443);
        // final resp = await grpcProvider
        //     .getToken(GetTokenRequest(username: "", password: ""));
        _dao.set(SettingKey.serverConfig, event.config);
        emit(ServerSelected(event.config));
      }
      if (event is UserLogoutEvent) {
        await _dao.pure(SettingKey.serverConfig);
        await _dao.pure(SettingKey.refreshToken);
        emit(ServerSelecting());
      }
      if (state is! ServerSelected) {
        return;
      }
      final config = (state as ServerSelected).serverConfig;
      final client = clientFactory(config: config);

      if (event is UserLoginEvent) {
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
          _dao.set(SettingKey.refreshToken, resp.refreshToken);
          ApiHelper.instance.init(client, resp.accessToken);
          emit(UserLoggedIn(
            config,
            resp.accessToken,
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
      }
    });
  }
}
