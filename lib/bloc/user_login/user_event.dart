part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ConnectToServerEvent extends UserEvent {
  final String url;

  ConnectToServerEvent(this.url);
}

class UserLoginEvent extends UserEvent {
  final String username;
  final String password;

  UserLoginEvent(this.username, this.password);
}

class UserLogoutEvent extends UserEvent {}

class CheckLocalSettingEvent extends UserEvent {}
