part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingEvent {}

class ToggleBrightnessEvent extends AppSettingEvent {}

class ChangeBrightnessEvent extends AppSettingEvent {
  final Brightness brightness;

  ChangeBrightnessEvent(this.brightness);
}
