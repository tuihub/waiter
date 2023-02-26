part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingEvent {}

class ConnectToServerEvent extends AppSettingEvent {
  final String url;

  ConnectToServerEvent(this.url);
}

class UserLoginEvent extends AppSettingEvent {
  final String username;
  final String password;

  UserLoginEvent(this.username, this.password);
}

class UserLogoutEvent extends AppSettingEvent {}
