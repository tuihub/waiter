import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/client/client.dart';
import 'package:waitress/common/store/setting_dao.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final SettingDao _dao;

  AppSettingBloc(this._dao) : super(AppSettingInitial()) {
    on<AppSettingEvent>((event, emit) async {
      if (event is CheckLocalSettingEvent) {
        emit(SettingLoading());
        if (_dao.exsist(SettingKey.serverUrl)) {
          final host = _dao.require<String>(SettingKey.serverUrl);
          final client = clientFactory(host: host);
          if (_dao.exsist(SettingKey.refreshToken)) {
            // check token
            final refreshToken = _dao.require(SettingKey.refreshToken);
            try {
              final resp = await client.refreshToken(RefreshTokenRequest(),
                  options: withAuth(refreshToken));
              emit(UserLoginDone(host, resp.accessToken));
            } catch (e) {
              debugPrint("login by refresh token fail");
            }
            return;
          }
          if (_dao.exsist(SettingKey.username) &&
              _dao.exsist(SettingKey.password)) {
            // do login
            final username = _dao.require<String>(SettingKey.username);
            final password = _dao.require<String>(SettingKey.password);

            try {
              final resp = await client.getToken(
                  GetTokenRequest(username: username, password: password));
              emit(UserLoginDone(
                host,
                resp.accessToken,
              ));
            } catch (e) {
              debugPrint("login by username password fail");
            }
            return;
          }
          emit(ServerConnectDone(host));
        }
        // emit(SettingEmpty());
      }
      if (event is ConnectToServerEvent) {
        emit(ServerConnectLoading(event.url));

        // final grpcProvider = newGrpc("theam-grpc.gyx.moe", port: 443);
        // final resp = await grpcProvider
        //     .getToken(GetTokenRequest(username: "", password: ""));
        _dao.set(SettingKey.serverUrl, event.url);
        emit(ServerConnectDone(event.url));
      }
      if (state is! ServerConnectDone) {
        return;
      }
      final host = (state as ServerConnectDone).serverUrl;
      final client = clientFactory(host: host);

      if (event is UserLoginEvent) {
        emit(UserLoginLoading(
          host,
          event.username,
          event.password,
        ));
        try {
          final resp = await client.getToken(
            GetTokenRequest(username: event.username, password: event.password),
          );
          print(resp.toDebugString());
          _dao.set(SettingKey.refreshToken, resp.refreshToken);
          emit(UserLoginDone(
            host,
            resp.accessToken,
          ));
        } catch (e) {
          debugPrint(e.toString());
          emit(UserLoginFailed(
            event.username,
            event.password,
            host,
            10,
            e.toString(),
          ));
        }
      }
      if (event is UserLogoutEvent) {
        await _dao.pure(SettingKey.serverUrl);
        await _dao.pure(SettingKey.username);
        await _dao.pure(SettingKey.password);
        await _dao.pure(SettingKey.refreshToken);
        emit(AppSettingInitial());
      }
    });
  }
}
