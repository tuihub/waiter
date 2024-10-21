part of 'client_setting_bloc.dart';

class ClientSettingState {
  final ThemeMode themeMode;
  final AppTheme theme;
  final bool? useSystemProxy;
  final bool? useFluentUI;

  const ClientSettingState(
    this.themeMode,
    this.theme, {
    this.useSystemProxy,
    this.useFluentUI,
  });

  ClientSettingState copyWith({
    ThemeMode? themeMode,
    AppTheme? theme,
    bool? useSystemProxy,
    bool? useFluentUI,
  }) {
    return ClientSettingState(
      themeMode ?? this.themeMode,
      theme ?? this.theme,
      useSystemProxy: useSystemProxy ?? this.useSystemProxy,
      useFluentUI: useFluentUI ?? this.useFluentUI,
    );
  }
}

class DefaultAppState extends ClientSettingState {
  DefaultAppState() : super(ThemeMode.system, themeData[0]);
}
