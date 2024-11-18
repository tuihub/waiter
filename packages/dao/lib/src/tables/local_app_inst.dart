import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'local_app_inst.mapper.dart';

@MappableClass()
class LocalAppInst with LocalAppInstMappable {
  final String uuid;
  final String appUUID;
  final String? name;
  final String path;
  final String version;
  final String? lastLaunchedLauncherUUID;

  const LocalAppInst({
    required this.uuid,
    required this.appUUID,
    this.name,
    required this.path,
    this.version = '',
    this.lastLaunchedLauncherUUID,
  });

  static const fromMap = LocalAppInstMapper.fromMap;
  static const fromJson = LocalAppInstMapper.fromJson;
}

@UseRowClass(LocalAppInst)
@TableIndex(name: 'local_app_inst_uuid', columns: {#uuid})
@TableIndex(name: 'local_app_inst_app_uuid', columns: {#appUUID})
class LocalAppInstTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get appUUID => text()();
  TextColumn get name => text().nullable()();
  TextColumn get path => text()();
  TextColumn get version => text()();
  TextColumn get lastLaunchedLauncherUUID => text().nullable()();
}
