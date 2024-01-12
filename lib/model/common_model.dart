import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_model.freezed.dart';
part 'common_model.g.dart';

@freezed
class ServerConfig with _$ServerConfig {
  const factory ServerConfig(
    String host,
    int port,
    bool tls,
    String name, {
    String? refreshToken,
  }) = _ServerConfig;

  factory ServerConfig.fromJson(Map<String, Object?> json) =>
      _$ServerConfigFromJson(json);
}

@freezed
class ClientCommonData with _$ClientCommonData {
  const factory ClientCommonData({
    ServerConfig? server,
    int? theme,
    int? themeMode,
    Map<String, int>? deviceIDs,
  }) = _ClientCommonData;

  factory ClientCommonData.fromJson(Map<String, Object?> json) =>
      _$ClientCommonDataFromJson(json);
}

@freezed
class ClientDeviceInfo with _$ClientDeviceInfo {
  const factory ClientDeviceInfo(
    String deviceModel,
    String systemVersion,
  ) = _ClientDeviceInfo;

  factory ClientDeviceInfo.fromJson(Map<String, Object?> json) =>
      _$ClientDeviceInfoFromJson(json);
}
