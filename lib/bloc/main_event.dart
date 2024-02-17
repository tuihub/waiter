part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class MainAutoLoginEvent extends MainEvent {
  final ServerConfig? config;

  MainAutoLoginEvent({this.config});
}

class MainSetNextServerConfigEvent extends MainEvent {
  final ServerConfig config;

  MainSetNextServerConfigEvent(this.config);
}

class MainClearNextServerConfigEvent extends MainEvent {}

class MainManualLoginEvent extends MainEvent {
  final String username;
  final String password;

  MainManualLoginEvent(this.username, this.password);
}

class MainLogoutEvent extends MainEvent {}
