part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingEvent {}

class InitAppSettingEvent extends AppSettingEvent {}

class ToggleThemeModeEvent extends AppSettingEvent {}

class ChangeBrightnessEvent extends AppSettingEvent {
  final ThemeMode themeMode;

  ChangeBrightnessEvent(this.themeMode);
}

class ChangeThemeEvent extends AppSettingEvent {
  final FlexScheme theme;

  ChangeThemeEvent(this.theme);
}
