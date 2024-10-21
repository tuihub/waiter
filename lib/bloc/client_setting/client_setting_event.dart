part of 'client_setting_bloc.dart';

@immutable
abstract class ClientSettingEvent {}

class InitClientSettingEvent extends ClientSettingEvent {}

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

class ChangeUseFluentUIEvent extends ClientSettingEvent {
  final bool useFluentUI;

  ChangeUseFluentUIEvent(this.useFluentUI);
}
