part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ManualLoginEvent extends UserEvent {}

class ConnectToServerEvent extends UserEvent {
  final ServerConfig config;

  ConnectToServerEvent(this.config);
}

class UserLoginEvent extends UserEvent {
  final String username;
  final String password;

  UserLoginEvent(this.username, this.password);
}

class UserLogoutEvent extends UserEvent {}

class LoadLocalSettingEvent extends UserEvent {}
