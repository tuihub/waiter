// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_setting_bloc.dart';

class AppSettingState {
  final Brightness brightness;
  final Color colorSeed;

  AppSettingState(this.brightness, this.colorSeed);

  AppSettingState copyWith({
    Brightness? brightness,
    Color? colorSeed,
  }) {
    return AppSettingState(
      brightness ?? this.brightness,
      colorSeed ?? this.colorSeed,
    );
  }
}

class DefaultTheme extends AppSettingState {
  DefaultTheme() : super(Brightness.dark, AppDefaultAccentColor);
}
