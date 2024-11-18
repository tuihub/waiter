import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'local_steam_app_scan.mapper.dart';

@MappableClass()
class LocalSteamAppScan with LocalSteamAppScanMappable {
  final String uuid;
  final String libraryPath;
  final bool enableAutoScan;

  const LocalSteamAppScan({
    required this.uuid,
    required this.libraryPath,
    required this.enableAutoScan,
  });

  static const fromMap = LocalSteamAppScanMapper.fromMap;
  static const fromJson = LocalSteamAppScanMapper.fromJson;
}

@UseRowClass(LocalSteamAppScan)
@TableIndex(name: 'local_steam_app_scan_uuid', columns: {#uuid})
class LocalSteamAppScanTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get libraryPath => text().unique()();
  BoolColumn get enableAutoScan => boolean()();
}
