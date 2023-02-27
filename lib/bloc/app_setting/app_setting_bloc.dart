import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/store/setting_dao.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final SettingDao _dao;

  AppSettingBloc(this._dao) : super(AppSettingInitial()) {
    on<AppSettingEvent>((event, emit) async {
      if (event is CheckLocalSettingEvent) {
        if (_dao.exsist(SettingKey.serverUrl)) {
          final url = _dao.require<String>(SettingKey.serverUrl);
          // if (_dao.exsist(SettingKey.acessToken)) {
          //   // check token
          // }
          // if (_dao.exsist(SettingKey.refreshToken)) {
          //   // check token
          // }
          if (_dao.exsist(SettingKey.username) &&
              _dao.exsist(SettingKey.password)) {
            // do login
            final username = _dao.require<String>(SettingKey.username);
            final password = _dao.require<String>(SettingKey.password);
            GetTokenRequest(username: username, password: password);
            UserLoginDone(
              username,
              password,
              url,
              "",
              "",
            );
            return;
          }
          emit(ServerConnectDone(url));
        }
      }
      if (event is ConnectToServerEvent) {
        emit(ServerConnectLoading(event.url));
        await Future.delayed(
          Duration(seconds: 2),
        );
        _dao.set(SettingKey.serverUrl, event.url);
        emit(ServerConnectDone(event.url));
      }
      if (event is UserLoginEvent) {
        if (state is! ServerConnectDone) {
          throw UnsupportedError(
              "user login event emit before server connection exsist");
        }
        emit(UserLoginLoading(
          (state as ServerConnectDone).serverUrl,
          event.username,
          event.password,
        ));
        await Future.delayed(
          Duration(seconds: 2),
        );
        // emit(UserLoginFailed("test", 0));
        emit(UserLoginDone(
          event.username,
          event.password,
          (state as ServerConnectDone).serverUrl,
          "",
          "",
        ));
      }
      if (event is UserLogoutEvent) {
        emit(AppSettingInitial());
      }
    });
  }
}
