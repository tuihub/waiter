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
      serverName: json['serverName'] as String?,
      username: json['username'] as String?,
      refreshToken: json['refreshToken'] as String?,
      deviceId: json['deviceId'] as int?,
    );

Map<String, dynamic> _$$ServerConfigImplToJson(_$ServerConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'tls': instance.tls,
      'serverName': instance.serverName,
      'username': instance.username,
      'refreshToken': instance.refreshToken,
      'deviceId': instance.deviceId,
    };

_$ClientCommonDataImpl _$$ClientCommonDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientCommonDataImpl(
      lastServerId: json['lastServerId'] as String?,
      themeName: json['themeName'] as String?,
      themeMode: json['themeMode'] as int?,
      servers: (json['servers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ServerConfig.fromJson(e as Map<String, dynamic>)),
      ),
      useSystemProxy: json['useSystemProxy'] as bool?,
    );

Map<String, dynamic> _$$ClientCommonDataImplToJson(
        _$ClientCommonDataImpl instance) =>
    <String, dynamic>{
      'lastServerId': instance.lastServerId,
      'themeName': instance.themeName,
      'themeMode': instance.themeMode,
      'servers': instance.servers,
      'useSystemProxy': instance.useSystemProxy,
    };

_$ClientDeviceInfoImpl _$$ClientDeviceInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientDeviceInfoImpl(
      json['deviceName'] as String,
      json['systemVersion'] as String,
    );

Map<String, dynamic> _$$ClientDeviceInfoImplToJson(
        _$ClientDeviceInfoImpl instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'systemVersion': instance.systemVersion,
    };
