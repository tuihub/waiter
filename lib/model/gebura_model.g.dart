// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gebura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LibrarySettingsImpl _$$LibrarySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$LibrarySettingsImpl(
      filter: json['filter'] == null
          ? null
          : LibraryFilter.fromJson(json['filter'] as Map<String, dynamic>),
      local: json['local'] == null
          ? null
          : LocalLibrarySettings.fromJson(
              json['local'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LibrarySettingsImplToJson(
        _$LibrarySettingsImpl instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'local': instance.local,
    };

_$LibraryFilterImpl _$$LibraryFilterImplFromJson(Map<String, dynamic> json) =>
    _$LibraryFilterImpl(
      query: json['query'] as String?,
    );

Map<String, dynamic> _$$LibraryFilterImplToJson(_$LibraryFilterImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

_$LibraryListItemImpl _$$LibraryListItemImplFromJson(
        Map<String, dynamic> json) =>
    _$LibraryListItemImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      iconImageUrl: json['iconImageUrl'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      backgroundImageUrl: json['backgroundImageUrl'] as String,
      filtered: json['filtered'] as bool? ?? false,
      appID: (json['appID'] as num?)?.toInt(),
      localAppUUID: json['localAppUUID'] as String?,
    );

Map<String, dynamic> _$$LibraryListItemImplToJson(
        _$LibraryListItemImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'iconImageUrl': instance.iconImageUrl,
      'coverImageUrl': instance.coverImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'filtered': instance.filtered,
      'appID': instance.appID,
      'localAppUUID': instance.localAppUUID,
    };

_$LocalLibrarySettingsImpl _$$LocalLibrarySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalLibrarySettingsImpl(
      autoTrackSteamApps: json['autoTrackSteamApps'] as bool?,
    );

Map<String, dynamic> _$$LocalLibrarySettingsImplToJson(
        _$LocalLibrarySettingsImpl instance) =>
    <String, dynamic>{
      'autoTrackSteamApps': instance.autoTrackSteamApps,
    };

_$LocalTrackedAppImpl _$$LocalTrackedAppImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalTrackedAppImpl(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      lastLaunchedInstUUID: json['lastLaunchedInstUUID'] as String?,
      shortDescription: json['shortDescription'] as String?,
      iconImageUrl: json['iconImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      description: json['description'] as String?,
      releaseDate: json['releaseDate'] as String?,
      developer: json['developer'] as String?,
      publisher: json['publisher'] as String?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LocalTrackedAppImplToJson(
        _$LocalTrackedAppImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'lastLaunchedInstUUID': instance.lastLaunchedInstUUID,
      'shortDescription': instance.shortDescription,
      'iconImageUrl': instance.iconImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'coverImageUrl': instance.coverImageUrl,
      'description': instance.description,
      'releaseDate': instance.releaseDate,
      'developer': instance.developer,
      'publisher': instance.publisher,
      'imageUrls': instance.imageUrls,
    };

_$LocalTrackedAppInstImpl _$$LocalTrackedAppInstImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalTrackedAppInstImpl(
      uuid: json['uuid'] as String,
      appUUID: json['appUUID'] as String,
      type: $enumDecode(_$LocalAppInstTypeEnumMap, json['type']),
      name: json['name'] as String?,
      path: json['path'] as String,
      version: json['version'] as String? ?? '',
      commonLaunchSetting: json['commonLaunchSetting'] == null
          ? null
          : LocalCommonAppInstLaunchSetting.fromJson(
              json['commonLaunchSetting'] as Map<String, dynamic>),
      steamLaunchSetting: json['steamLaunchSetting'] == null
          ? null
          : LocalSteamAppInstLaunchSetting.fromJson(
              json['steamLaunchSetting'] as Map<String, dynamic>),
      runRecord: (json['runRecord'] as List<dynamic>?)
          ?.map(
              (e) => LocalAppInstRunRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LocalTrackedAppInstImplToJson(
        _$LocalTrackedAppInstImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'appUUID': instance.appUUID,
      'type': _$LocalAppInstTypeEnumMap[instance.type]!,
      'name': instance.name,
      'path': instance.path,
      'version': instance.version,
      'commonLaunchSetting': instance.commonLaunchSetting,
      'steamLaunchSetting': instance.steamLaunchSetting,
      'runRecord': instance.runRecord,
    };

const _$LocalAppInstTypeEnumMap = {
  LocalAppInstType.common: 'common',
  LocalAppInstType.steam: 'steam',
};

_$LocalCommonAppInstLaunchSettingImpl
    _$$LocalCommonAppInstLaunchSettingImplFromJson(Map<String, dynamic> json) =>
        _$LocalCommonAppInstLaunchSettingImpl(
          installPath: json['installPath'] as String,
          path: json['path'] as String,
          advancedTracing: json['advancedTracing'] as bool,
          processName: json['processName'] as String,
          realPath: json['realPath'] as String,
          sleepTime: (json['sleepTime'] as num).toInt(),
        );

Map<String, dynamic> _$$LocalCommonAppInstLaunchSettingImplToJson(
        _$LocalCommonAppInstLaunchSettingImpl instance) =>
    <String, dynamic>{
      'installPath': instance.installPath,
      'path': instance.path,
      'advancedTracing': instance.advancedTracing,
      'processName': instance.processName,
      'realPath': instance.realPath,
      'sleepTime': instance.sleepTime,
    };

_$LocalSteamAppInstLaunchSettingImpl
    _$$LocalSteamAppInstLaunchSettingImplFromJson(Map<String, dynamic> json) =>
        _$LocalSteamAppInstLaunchSettingImpl(
          steamAppID: json['steamAppID'] as String,
          launchOptions: json['launchOptions'] as String,
        );

Map<String, dynamic> _$$LocalSteamAppInstLaunchSettingImplToJson(
        _$LocalSteamAppInstLaunchSettingImpl instance) =>
    <String, dynamic>{
      'steamAppID': instance.steamAppID,
      'launchOptions': instance.launchOptions,
    };

_$LocalAppInstRunRecordImpl _$$LocalAppInstRunRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalAppInstRunRecordImpl(
      uuid: json['uuid'] as String,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$LocalAppInstRunRecordImplToJson(
        _$LocalAppInstRunRecordImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
