import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_model.freezed.dart';
part 'common_model.g.dart';

@freezed
class ServerConfig with _$ServerConfig {
  const factory ServerConfig(
    String host,
    int port,
    bool tls, {
    String? serverName,
    String? username,
    String? refreshToken,
    int? deviceId,
  }) = _ServerConfig;
  const ServerConfig._();

  factory ServerConfig.fromJson(Map<String, Object?> json) =>
      _$ServerConfigFromJson(json);

  String get id => '$host#$port';
  factory ServerConfig.empty() => const ServerConfig('', 0, false);
}

@freezed
class ClientCommonData with _$ClientCommonData {
  const factory ClientCommonData({
    String? lastServerId,
    String? themeName,
    int? themeMode,
    Map<String, ServerConfig>? servers,
  }) = _ClientCommonData;

  factory ClientCommonData.fromJson(Map<String, Object?> json) =>
      _$ClientCommonDataFromJson(json);
}

@freezed
class ClientDeviceInfo with _$ClientDeviceInfo {
  const factory ClientDeviceInfo(
    String deviceName,
    String systemVersion,
  ) = _ClientDeviceInfo;

  factory ClientDeviceInfo.fromJson(Map<String, Object?> json) =>
      _$ClientDeviceInfoFromJson(json);
}
