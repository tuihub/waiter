// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gebura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalAppInstLauncherSettingImpl _$$LocalAppInstLauncherSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalAppInstLauncherSettingImpl(
      appInstID: (json['appInstID'] as num).toInt(),
      installPath: json['installPath'] as String,
      path: json['path'] as String,
      advancedTracing: json['advancedTracing'] as bool,
      processName: json['processName'] as String,
      realPath: json['realPath'] as String,
      sleepTime: (json['sleepTime'] as num).toInt(),
    );

Map<String, dynamic> _$$LocalAppInstLauncherSettingImplToJson(
        _$LocalAppInstLauncherSettingImpl instance) =>
    <String, dynamic>{
      'appInstID': instance.appInstID,
      'installPath': instance.installPath,
      'path': instance.path,
      'advancedTracing': instance.advancedTracing,
      'processName': instance.processName,
      'realPath': instance.realPath,
      'sleepTime': instance.sleepTime,
    };

_$AppLauncherSettingImpl _$$AppLauncherSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$AppLauncherSettingImpl(
      type: $enumDecode(_$AppLauncherTypeEnumMap, json['type']),
      localAppInstID: (json['localAppInstID'] as num?)?.toInt(),
      steamAppID: json['steamAppID'] as String?,
    );

Map<String, dynamic> _$$AppLauncherSettingImplToJson(
        _$AppLauncherSettingImpl instance) =>
    <String, dynamic>{
      'type': _$AppLauncherTypeEnumMap[instance.type]!,
      'localAppInstID': instance.localAppInstID,
      'steamAppID': instance.steamAppID,
    };

const _$AppLauncherTypeEnumMap = {
  AppLauncherType.steam: 'steam',
  AppLauncherType.local: 'local',
};

_$AppRunStateImpl _$$AppRunStateImplFromJson(Map<String, dynamic> json) =>
    _$AppRunStateImpl(
      running: json['running'] as bool,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$$AppRunStateImplToJson(_$AppRunStateImpl instance) =>
    <String, dynamic>{
      'running': instance.running,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };

_$ImportedSteamAppInstImpl _$$ImportedSteamAppInstImplFromJson(
        Map<String, dynamic> json) =>
    _$ImportedSteamAppInstImpl(
      instID: (json['instID'] as num).toInt(),
      appID: (json['appID'] as num).toInt(),
      steamAppID: json['steamAppID'] as String,
    );

Map<String, dynamic> _$$ImportedSteamAppInstImplToJson(
        _$ImportedSteamAppInstImpl instance) =>
    <String, dynamic>{
      'instID': instance.instID,
      'appID': instance.appID,
      'steamAppID': instance.steamAppID,
    };

_$LibrarySettingsImpl _$$LibrarySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$LibrarySettingsImpl(
      query: json['query'] as String?,
    );

Map<String, dynamic> _$$LibrarySettingsImplToJson(
        _$LibrarySettingsImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

_$LocalAppInstFolderImpl _$$LocalAppInstFolderImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalAppInstFolderImpl(
      path: json['path'] as String,
    );

Map<String, dynamic> _$$LocalAppInstFolderImplToJson(
        _$LocalAppInstFolderImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
    };

_$LocalAppInstIndependentImpl _$$LocalAppInstIndependentImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalAppInstIndependentImpl(
      appInstID: (json['appInstID'] as num).toInt(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$$LocalAppInstIndependentImplToJson(
        _$LocalAppInstIndependentImpl instance) =>
    <String, dynamic>{
      'appInstID': instance.appInstID,
      'path': instance.path,
    };
