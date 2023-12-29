import 'package:freezed_annotation/freezed_annotation.dart';

part 'gebura_model.freezed.dart';
part 'gebura_model.g.dart';

@freezed
class AppLauncherSetting with _$AppLauncherSetting {
  const factory AppLauncherSetting({
    required int appID,
    required String path,
    required bool advancedTracing,
    required String processName,
    required String realPath,
    required int sleepTime,
  }) = _AppLauncherSetting;

  factory AppLauncherSetting.fromJson(Map<String, Object?> json) =>
      _$AppLauncherSettingFromJson(json);
}

@freezed
class AppRunState with _$AppRunState {
  const factory AppRunState({
    required bool running,
    required DateTime? startTime,
    required DateTime? endTime,
  }) = _AppRunState;

  factory AppRunState.fromJson(Map<String, Object?> json) =>
      _$AppRunStateFromJson(json);
}
