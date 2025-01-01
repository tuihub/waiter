import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'server_config.mapper.dart';

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

  String get uniqueKey => '$username@$host:$port';

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
