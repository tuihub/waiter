part of 'main_bloc.dart';

@immutable
sealed class MainEvent {
  final EventContext context;

  MainEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

class MainInitEvent extends MainEvent {
  MainInitEvent(super.context);
}

class MainGetServerInfoEvent extends MainEvent {
  final ServerConfig server;

  MainGetServerInfoEvent(super.context, {required this.server});
}

class MainLoginEvent extends MainEvent {
  final ServerConfig? serverConfig;
  final String? password;

  MainLoginEvent(super.context, {this.password, this.serverConfig});
}

class MainRefreshServerInfoEvent extends MainEvent {
  final ServerID? server;

  MainRefreshServerInfoEvent(super.context, {this.server});
}

class MainRegisterEvent extends MainEvent {
  final ServerConfig serverConfig;
  final String password;
  final String? captchaID;
  final String? captchaAns;

  MainRegisterEvent(super.context, this.serverConfig, this.password,
      {this.captchaID, this.captchaAns});
}

class ClientSettingEvent extends MainEvent {
  ClientSettingEvent(super.context);
}

class ToggleThemeModeEvent extends ClientSettingEvent {
  ToggleThemeModeEvent(super.context);
}

class ChangeBrightnessEvent extends ClientSettingEvent {
  final ThemeMode themeMode;

  ChangeBrightnessEvent(super.context, this.themeMode);
}

class ChangeThemeEvent extends ClientSettingEvent {
  final AppTheme theme;

  ChangeThemeEvent(super.context, this.theme);
}

class ChangeUseSystemProxyEvent extends ClientSettingEvent {
  final bool useSystemProxy;

  ChangeUseSystemProxyEvent(super.context, this.useSystemProxy);
}

class ChangeUIDesignEvent extends ClientSettingEvent {
  final UIDesign design;

  ChangeUIDesignEvent(super.context, this.design);
}
