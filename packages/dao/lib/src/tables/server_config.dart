import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

part 'server_config.mapper.dart';

@immutable
@MappableClass()
class ServerID with ServerIDMappable {
  final bool isLocal;
  final String host;
  final int port;
  final String username;

  const ServerID(String host, int port, String username, [this.isLocal = false])
      : host = isLocal ? '' : host,
        port = isLocal ? 0 : port,
        username = isLocal ? '' : username;

  const ServerID.local() : this('', 0, '', true);

  @override
  String toString() => isLocal ? 'local' : '$username@$host:$port';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is ServerID) {
      if (isLocal) {
        return other.isLocal;
      }
      return other.host == host &&
          other.port == port &&
          other.username == username;
    }
    return false;
  }

  @override
  int get hashCode => isLocal
      ? isLocal.hashCode
      : host.hashCode ^ port.hashCode ^ username.hashCode;

  static const fromMap = ServerIDMapper.fromMap;
  static const fromJson = ServerIDMapper.fromJson;
}

@MappableClass()
class ServerConfig with ServerConfigMappable {
  final int id;
  final String host;
  final int port;
  final bool enableTLS;
  final String username;
  final String? refreshToken;
  final int? deviceId;

  const ServerConfig({
    this.id = 0,
    required this.host,
    required this.port,
    required this.enableTLS,
    this.username = '',
    this.refreshToken,
    this.deviceId,
  });

  ServerID get serverID => ServerID(host, port, username);

  static const fromMap = ServerConfigMapper.fromMap;
  static const fromJson = ServerConfigMapper.fromJson;
}

@UseRowClass(ServerConfig)
@TableIndex(name: 'server', columns: {#host, #port, #username})
class ServerConfigTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get host => text()();
  IntColumn get port => integer()();
  BoolColumn get enableTLS => boolean()();
  TextColumn get username => text()();
  TextColumn get refreshToken => text().nullable()();
  IntColumn get deviceId => integer().nullable()();
}
