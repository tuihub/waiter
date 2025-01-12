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

class ClientSettingEvent extends MainEvent {}

class ToggleThemeModeEvent extends ClientSettingEvent {}

class ChangeBrightnessEvent extends ClientSettingEvent {
  final ThemeMode themeMode;

  ChangeBrightnessEvent(this.themeMode);
}

class ChangeThemeEvent extends ClientSettingEvent {
  final AppTheme theme;

  ChangeThemeEvent(this.theme);
}

class ChangeUseSystemProxyEvent extends ClientSettingEvent {
  final bool useSystemProxy;

  ChangeUseSystemProxyEvent(this.useSystemProxy);
}

class ChangeUIDesignEvent extends ClientSettingEvent {
  final UIDesign design;

  ChangeUIDesignEvent(this.design);
}
