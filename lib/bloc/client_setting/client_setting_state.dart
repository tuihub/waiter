part of 'client_setting_bloc.dart';

class ClientSettingState {
  final ThemeMode themeMode;
  final AppTheme theme;
  final bool? useSystemProxy;

  const ClientSettingState(
    this.themeMode,
    this.theme, {
    this.useSystemProxy,
  });

  ClientSettingState copyWith({
    ThemeMode? themeMode,
    AppTheme? theme,
    bool? useSystemProxy,
  }) {
    return ClientSettingState(
      themeMode ?? this.themeMode,
      theme ?? this.theme,
      useSystemProxy: useSystemProxy ?? this.useSystemProxy,
    );
  }
}

class DefaultAppState extends ClientSettingState {
  DefaultAppState() : super(ThemeMode.system, themeData[0]);
}
