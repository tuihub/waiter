part of 'app_setting_bloc.dart';

class AppSettingState extends Equatable {
  final ThemeMode themeMode;
  final AppTheme theme;

  const AppSettingState(this.themeMode, this.theme);

  AppSettingState copyWith({
    ThemeMode? themeMode,
    AppTheme? theme,
  }) {
    return AppSettingState(
      themeMode ?? this.themeMode,
      theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [themeMode, theme];
}

class DefaultAppState extends AppSettingState {
  DefaultAppState() : super(ThemeMode.system, themeData[0]);
}
