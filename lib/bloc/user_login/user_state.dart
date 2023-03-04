part of 'user_bloc.dart';

@immutable
abstract class UserLoginState {}

class AppSettingInitial extends UserLoginState {}

class SettingLoading extends UserLoginState {}

class SettingEmpty extends UserLoginState {}

class ServerConnectBase extends UserLoginState {
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

class UserLoginDone extends ServerConnectDone {
  final String acessToken;

  UserLoginDone(
    super.serverUrl,
    this.acessToken,
  );
}
