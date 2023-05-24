part of 'user_bloc.dart';

@immutable
abstract class UserLoginState {}

class PreLogin extends UserLoginState {}
class OnLogin extends UserLoginState {}
class PostLogin extends UserLoginState {}

class AppInitialize extends PreLogin {}
class AutoLogging extends PreLogin {}
class AutoLoginFailed extends PreLogin {}

// class ServerConnectBase extends OnLogin {
//   final ServerConfig serverConfig;
//
//   ServerConnectBase(this.serverConfig);
// }

// class ServerConnectLoading extends ServerConnectBase {
//   ServerConnectLoading(super.serverUrl);
// }
//
// class ServerConnectFailed extends ServerConnectBase {
//   final int errorCode;
//   final String message;
//
//   ServerConnectFailed(super.serverUrl, this.errorCode, this.message);
// }

class ServerSelecting extends OnLogin {}

class ServerSelected extends OnLogin {
  final ServerConfig serverConfig;

  ServerSelected(this.serverConfig);
}

class UserLoginLoading extends ServerSelected {
  final String username;
  final String password;

  UserLoginLoading(this.username, this.password, super.serverConfig);
}

class UserLoginFailed extends ServerSelected {
  final String username;
  final String password;
  final int errorCode;
  final String message;

  UserLoginFailed(
    this.username,
    this.password,
    super.serverConfig,
    this.errorCode,
    this.message,
  );
}

class UserLoggedIn extends PostLogin {
  final ServerConfig serverConfig;
  final String acessToken;

  UserLoggedIn(
    this.serverConfig,
    this.acessToken,
  );
}
