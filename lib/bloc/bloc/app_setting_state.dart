// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_setting_bloc.dart';

class AppSettingState extends Equatable {
  final ThemeMode themeMode;
  final FlexScheme theme;

  const AppSettingState(this.themeMode, this.theme);

  AppSettingState copyWith({
    ThemeMode? themeMode,
    FlexScheme? theme,
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
  const DefaultAppState()
      : super(ThemeMode.system, FlexScheme.materialBaseline);
}
