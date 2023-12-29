part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class MainAutoLoginEvent extends MainEvent {}

class MainSetServerConfigEvent extends MainEvent {
  final ServerConfig config;

  MainSetServerConfigEvent(this.config);
}

class MainManualLoginEvent extends MainEvent {
  final String username;
  final String password;

  MainManualLoginEvent(this.username, this.password);
}

class MainLogoutEvent extends MainEvent {}
