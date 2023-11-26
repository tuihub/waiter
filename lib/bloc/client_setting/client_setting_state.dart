part of 'client_setting_bloc.dart';

class ClientSettingState extends Equatable {
  final ThemeMode themeMode;
  final AppTheme theme;

  const ClientSettingState(this.themeMode, this.theme);

  ClientSettingState copyWith({
    ThemeMode? themeMode,
    AppTheme? theme,
  }) {
    return ClientSettingState(
      themeMode ?? this.themeMode,
      theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [themeMode, theme];
}

class DefaultAppState extends ClientSettingState {
  DefaultAppState() : super(ThemeMode.system, themeData[0]);
}
