import 'package:freezed_annotation/freezed_annotation.dart';

part 'gebura_model.freezed.dart';
part 'gebura_model.g.dart';

@freezed
class LibrarySettings with _$LibrarySettings {
  const factory LibrarySettings({
    LibraryFilter? filter,
    LocalLibrarySettings? local,
  }) = _LibrarySettings;

  factory LibrarySettings.fromJson(Map<String, Object?> json) =>
      _$LibrarySettingsFromJson(json);
}

@freezed
class LibraryFilter with _$LibraryFilter {
  const factory LibraryFilter({
    String? query,
  }) = _LibraryFilter;

  factory LibraryFilter.fromJson(Map<String, Object?> json) =>
      _$LibraryFilterFromJson(json);
}

@freezed
class LibraryListItem with _$LibraryListItem {
  const factory LibraryListItem({
    required String uuid,
    required String name,
    required String iconImageUrl,
    required String coverImageUrl,
    required String backgroundImageUrl,
    @Default(false) bool filtered,
    int? appID,
    String? localAppUUID,
  }) = _LibraryListItem;

  factory LibraryListItem.fromJson(Map<String, Object?> json) =>
      _$LibraryListItemFromJson(json);
}

// Classes start with `Local` are used to save cross server data.

enum LocalAppInstType {
  common,
  steam,
}

@freezed
class LocalLibrarySettings with _$LocalLibrarySettings {
  const factory LocalLibrarySettings({
    required bool? autoTrackSteamApps,
  }) = _LocalLibrarySettings;

  factory LocalLibrarySettings.fromJson(Map<String, Object?> json) =>
      _$LocalLibrarySettingsFromJson(json);
}

@freezed
class LocalTrackedApp with _$LocalTrackedApp {
  const factory LocalTrackedApp({
    required String uuid,
    required String name,
    String? lastLaunchedInstUUID,
    String? shortDescription,
    String? iconImageUrl,
    String? backgroundImageUrl,
    String? coverImageUrl,
    String? description,
    String? releaseDate,
    String? developer,
    String? publisher,
    List<String>? imageUrls,
  }) = _LocalTrackedApp;

  factory LocalTrackedApp.fromJson(Map<String, Object?> json) =>
      _$LocalTrackedAppFromJson(json);
}

@freezed
class LocalTrackedAppInst with _$LocalTrackedAppInst {
  const factory LocalTrackedAppInst({
    required String uuid,
    required String appUUID,
    required LocalAppInstType type,
    String? name,
    required String path,
    @Default('') String version,

    // launcher settings
    LocalCommonAppInstLaunchSetting? commonLaunchSetting,
    LocalSteamAppInstLaunchSetting? steamLaunchSetting,

    // launch record
    List<LocalAppInstRunRecord>? runRecord,
  }) = _LocalTrackedAppInst;

  factory LocalTrackedAppInst.fromJson(Map<String, Object?> json) =>
      _$LocalTrackedAppInstFromJson(json);
}

@freezed
class LocalCommonAppInstLaunchSetting with _$LocalCommonAppInstLaunchSetting {
  const factory LocalCommonAppInstLaunchSetting({
    required String installPath,
    required String path,
    required bool advancedTracing,
    required String processName,
    required String realPath,
    required int sleepTime,
  }) = _LocalCommonAppInstLaunchSetting;

  factory LocalCommonAppInstLaunchSetting.fromJson(Map<String, Object?> json) =>
      _$LocalCommonAppInstLaunchSettingFromJson(json);
}

@freezed
class LocalSteamAppInstLaunchSetting with _$LocalSteamAppInstLaunchSetting {
  const factory LocalSteamAppInstLaunchSetting({
    required String steamAppID,
    required String launchOptions,
  }) = _LocalSteamAppInstLaunchSetting;

  factory LocalSteamAppInstLaunchSetting.fromJson(Map<String, Object?> json) =>
      _$LocalSteamAppInstLaunchSettingFromJson(json);
}

@freezed
class LocalAppInstRunRecord with _$LocalAppInstRunRecord {
  const factory LocalAppInstRunRecord({
    required String uuid,
    required DateTime? startTime,
    required DateTime? endTime,
  }) = _LocalAppInstRunRecord;

  factory LocalAppInstRunRecord.fromJson(Map<String, Object?> json) =>
      _$LocalAppInstRunRecordFromJson(json);
}
