part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class MainInitEvent extends MainEvent {}

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

class MainRefreshServerInfoEvent extends MainEvent {
  final String? server;

  MainRefreshServerInfoEvent({this.server});
}

class MainLogoutEvent extends MainEvent {}

class MainRegisterEvent extends MainEvent {
  final String username;
  final String password;
  final String? captchaID;
  final String? captchaAns;

  MainRegisterEvent(this.username, this.password,
      {this.captchaID, this.captchaAns});
}
