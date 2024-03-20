import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

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
    bool? useSystemProxy,
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

@collection
class KVCollection {
  String? id;

  Id get isarId => _fastHash(id!);

  String? value;

  KVCollection(this.id, this.value);

  KVCollection.fromInternalID(InternalID id, this.value) : id = id.toString();

  static int idFromString(String id) => _fastHash(id);
  static int idFromInternalID(InternalID id) => _fastHash(id.toString());
}

int _fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
