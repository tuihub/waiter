part of 'tiphereth_bloc.dart';

@immutable
abstract class TipherethEvent {}

class ManualLoginEvent extends TipherethEvent {}

class ConnectToServerEvent extends TipherethEvent {
  final ServerConfig config;

  ConnectToServerEvent(this.config);
}

class UserLoginEvent extends TipherethEvent {
  final String username;
  final String password;

  UserLoginEvent(this.username, this.password);
}

class UserLogoutEvent extends TipherethEvent {}

class LoadLocalSettingEvent extends TipherethEvent {}
