import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'local_steam_app_scan_result.mapper.dart';

@MappableClass()
class LocalSteamAppScanResult with LocalSteamAppScanResultMappable {
  final String uuid;
  final String scanUUID;
  final String steamAppID;
  final String name;
  final String installPath;
  final String launcherPath;
  final String? sizeOnDisk;

  const LocalSteamAppScanResult({
    required this.uuid,
    required this.scanUUID,
    required this.steamAppID,
    required this.name,
    required this.installPath,
    required this.launcherPath,
    this.sizeOnDisk,
  });

  static const fromMap = LocalSteamAppScanResultMapper.fromMap;
  static const fromJson = LocalSteamAppScanResultMapper.fromJson;
}

@UseRowClass(LocalSteamAppScanResult)
@TableIndex(name: 'local_steam_app_scan_result_scan_uuid', columns: {#scanUUID})
class LocalSteamAppScanResultTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get scanUUID => text()();
  TextColumn get steamAppID => text()();
  TextColumn get name => text()();
  TextColumn get installPath => text()();
  TextColumn get launcherPath => text()();
  TextColumn get sizeOnDisk => text().nullable()();
}
