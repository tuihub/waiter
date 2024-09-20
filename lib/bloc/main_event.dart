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

class MainRefreshServerInfoEvent extends MainEvent {}

class MainLogoutEvent extends MainEvent {}

class MainRegisterEvent extends MainEvent {
  final String username;
  final String password;
  final String? captchaID;
  final String? captchaAns;

  MainRegisterEvent(this.username, this.password,
      {this.captchaID, this.captchaAns});
}

class MainGetServerInstanceInfoEvent extends MainEvent {
  final ServerConfig config;

  MainGetServerInstanceInfoEvent(this.config);
}
