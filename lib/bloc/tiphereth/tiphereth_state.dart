part of 'tiphereth_bloc.dart';

@immutable
abstract class TipherethState {}

class PreLogin extends TipherethState {}

class OnLogin extends TipherethState {}

class PostLogin extends TipherethState {}

class AppInitialize extends PreLogin {}

class AutoLogging extends PreLogin {}

class AutoLoginFailed extends PreLogin {}

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
  final String accessToken;
  final User user;

  UserLoggedIn(
    this.serverConfig,
    this.accessToken,
    this.user,
  );
}
