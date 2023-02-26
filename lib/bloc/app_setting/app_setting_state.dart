part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {}

class AppSettingInitial extends AppSettingState {}

class ServerConnectLoading extends AppSettingState {}

class ServerConnectFailed extends AppSettingState {
  final int errorCode;
  final String message;

  ServerConnectFailed(this.message, this.errorCode);
}

class ServerConnectDone extends AppSettingState {}

class UserLoginLoading extends ServerConnectDone {}

class UserLoginFailed extends ServerConnectDone {
  final int errorCode;
  final String message;

  UserLoginFailed(this.message, this.errorCode);
}

class UserLoginDone extends ServerConnectDone {}
