import 'package:dart_mappable/dart_mappable.dart';

part 'common_model.mapper.dart';

enum ConnectionStatus {
  connecting, // connecting to server, wait for connection established
  unauthenticated, // connected but not authenticated, login required
  authenticating, // authenticating with server, logging
  connected, // connected and authenticated
  disconnected, // disconnected from server, can't establish connection
  local,
}

@MappableClass()
class ClientDeviceInfo with ClientDeviceInfoMappable {
  final String deviceName;
  final String systemVersion;

  const ClientDeviceInfo(
    this.deviceName,
    this.systemVersion,
  );

  static const fromMap = ClientDeviceInfoMapper.fromMap;
  static const fromJson = ClientDeviceInfoMapper.fromJson;
}
