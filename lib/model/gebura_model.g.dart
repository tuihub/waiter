// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gebura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppLauncherSettingImpl _$$AppLauncherSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$AppLauncherSettingImpl(
      appID: json['appID'] as int,
      path: json['path'] as String,
      advancedTracing: json['advancedTracing'] as bool,
      processName: json['processName'] as String,
      realPath: json['realPath'] as String,
      sleepTime: json['sleepTime'] as int,
    );

Map<String, dynamic> _$$AppLauncherSettingImplToJson(
        _$AppLauncherSettingImpl instance) =>
    <String, dynamic>{
      'appID': instance.appID,
      'path': instance.path,
      'advancedTracing': instance.advancedTracing,
      'processName': instance.processName,
      'realPath': instance.realPath,
      'sleepTime': instance.sleepTime,
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

_$ImportedSteamAppImpl _$$ImportedSteamAppImplFromJson(
        Map<String, dynamic> json) =>
    _$ImportedSteamAppImpl(
      internalID: json['internalID'] as int,
      steamAppID: json['steamAppID'] as String,
    );

Map<String, dynamic> _$$ImportedSteamAppImplToJson(
        _$ImportedSteamAppImpl instance) =>
    <String, dynamic>{
      'internalID': instance.internalID,
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
