import 'package:freezed_annotation/freezed_annotation.dart';

part 'gebura_model.freezed.dart';
part 'gebura_model.g.dart';

@freezed
class LocalAppInstLauncherSetting with _$LocalAppInstLauncherSetting {
  const factory LocalAppInstLauncherSetting({
    required int appInstID,
    required String installPath,
    required String path,
    required bool advancedTracing,
    required String processName,
    required String realPath,
    required int sleepTime,
  }) = _LocalAppInstLauncherSetting;

  factory LocalAppInstLauncherSetting.fromJson(Map<String, Object?> json) =>
      _$LocalAppInstLauncherSettingFromJson(json);
}

enum AppLauncherType {
  steam,
  local,
}

@freezed
class AppLauncherSetting with _$AppLauncherSetting {
  const factory AppLauncherSetting({
    required AppLauncherType type,
    int? localAppInstID,
    String? steamAppID,
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

@freezed
class ImportedSteamAppInst with _$ImportedSteamAppInst {
  const factory ImportedSteamAppInst({
    required int instID,
    required int appID,
    required String steamAppID,
  }) = _ImportedSteamAppInst;

  factory ImportedSteamAppInst.fromJson(Map<String, Object?> json) =>
      _$ImportedSteamAppInstFromJson(json);
}

@freezed
class LibrarySettings with _$LibrarySettings {
  const factory LibrarySettings({
    required String? query,
  }) = _LibrarySettings;

  factory LibrarySettings.fromJson(Map<String, Object?> json) =>
      _$LibrarySettingsFromJson(json);
}

@freezed
class LocalAppInstFolder with _$LocalAppInstFolder {
  const factory LocalAppInstFolder({
    required String path,
  }) = _LocalAppInstFolder;

  factory LocalAppInstFolder.fromJson(Map<String, Object?> json) =>
      _$LocalAppInstFolderFromJson(json);
}

@freezed
class LocalAppInstIndependent with _$LocalAppInstIndependent {
  const factory LocalAppInstIndependent({
    required int appInstID,
    required String path,
  }) = _LocalAppInstIndependent;

  factory LocalAppInstIndependent.fromJson(Map<String, Object?> json) =>
      _$LocalAppInstIndependentFromJson(json);
}
