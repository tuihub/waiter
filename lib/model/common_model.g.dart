// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerConfigImpl _$$ServerConfigImplFromJson(Map<String, dynamic> json) =>
    _$ServerConfigImpl(
      json['host'] as String,
      json['port'] as int,
      json['tls'] as bool,
      json['name'] as String,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$ServerConfigImplToJson(_$ServerConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'tls': instance.tls,
      'name': instance.name,
      'refreshToken': instance.refreshToken,
    };

_$ClientCommonDataImpl _$$ClientCommonDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientCommonDataImpl(
      server: json['server'] == null
          ? null
          : ServerConfig.fromJson(json['server'] as Map<String, dynamic>),
      theme: json['theme'] as int?,
      themeMode: json['themeMode'] as int?,
      deviceIDs: (json['deviceIDs'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
    );

Map<String, dynamic> _$$ClientCommonDataImplToJson(
        _$ClientCommonDataImpl instance) =>
    <String, dynamic>{
      'server': instance.server,
      'theme': instance.theme,
      'themeMode': instance.themeMode,
      'deviceIDs': instance.deviceIDs,
    };

_$ClientDeviceInfoImpl _$$ClientDeviceInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientDeviceInfoImpl(
      json['deviceModel'] as String,
      json['systemVersion'] as String,
    );

Map<String, dynamic> _$$ClientDeviceInfoImplToJson(
        _$ClientDeviceInfoImpl instance) =>
    <String, dynamic>{
      'deviceModel': instance.deviceModel,
      'systemVersion': instance.systemVersion,
    };
