import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import '../../common/api/api_helper.dart';
import '../../common/api/client.dart';
import '../../consts.dart';
import '../../store/setting_dao.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserLoginState> {
  final SettingDao _dao;

  UserBloc(this._dao) : super(AppInitialize()) {
    on<UserEvent>((event, emit) async {
      if (event is LoadLocalSettingEvent) {
        emit(AutoLogging());
        if (_dao.exsist(SettingKey.serverHost) &&
            _dao.exsist(SettingKey.serverPort) &&
            _dao.exsist(SettingKey.serverTls)) {
          final config = ServerConfig(
            _dao.require<String>(SettingKey.serverHost),
            _dao.require<int>(SettingKey.serverPort),
            _dao.require<bool>(SettingKey.serverTls),
          );
          final client = clientFactory(config: config);
          if (_dao.exsist(SettingKey.refreshToken)) {
            final refreshToken =
                _dao.require(SettingKey.refreshToken) as String;
            try {
              final resp = await client.refreshToken(RefreshTokenRequest(),
                  options: withAuth(refreshToken));
              GetIt.I<ApiHelper>()
                  .init(client, resp.accessToken, resp.refreshToken);
              emit(UserLoggedIn(config, resp.accessToken));
              return;
            } catch (e) {
              debugPrint('login by refresh token fail');
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
        await _dao.set(SettingKey.serverHost, event.config.host);
        await _dao.set(SettingKey.serverPort, event.config.port);
        await _dao.set(SettingKey.serverTls, event.config.tls);
        emit(ServerSelected(event.config));
      }
      if (event is UserLogoutEvent) {
        await _dao.pure(SettingKey.serverHost);
        await _dao.pure(SettingKey.serverPort);
        await _dao.pure(SettingKey.serverTls);
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
          await _dao.set(SettingKey.refreshToken, resp.refreshToken);
          GetIt.I<ApiHelper>()
              .init(client, resp.accessToken, resp.refreshToken);
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
