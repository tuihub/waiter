part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {}

class AppSettingInitial extends AppSettingState {}

class ServerConnectBase extends AppSettingState {
  final String serverUrl;

  ServerConnectBase(this.serverUrl);
}

class ServerConnectLoading extends ServerConnectBase {
  ServerConnectLoading(super.serverUrl);
}

class ServerConnectFailed extends ServerConnectBase {
  final int errorCode;
  final String message;

  ServerConnectFailed(super.serverUrl, this.errorCode, this.message);
}

class ServerConnectDone extends ServerConnectBase {
  ServerConnectDone(super.serverUrl);
}

class UserLoginBase extends ServerConnectDone {
  final String username;
  final String password;

  UserLoginBase(this.username, this.password, super.serverUrl);
}

class UserLoginLoading extends UserLoginBase {
  UserLoginLoading(super.username, super.password, super.serverUrl);
}

class UserLoginFailed extends UserLoginBase {
  final int errorCode;
  final String message;

  UserLoginFailed(
    super.username,
    super.password,
    super.serverUrl,
    this.errorCode,
    this.message,
  );
}

class UserLoginDone extends UserLoginBase {
  final String acessToken;
  final String refreshToken;

  UserLoginDone(
    super.username,
    super.password,
    super.serverUrl,
    this.acessToken,
    this.refreshToken,
  );
}
