import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'utils.dart';

part 'local_common_app_scan_result.mapper.dart';

@MappableClass()
class LocalCommonAppScanResult with LocalCommonAppScanResultMappable {
  final String uuid;
  final String scanUUID;
  final String? name;
  final String? version;
  final String installPath;
  final List<String> launcherPaths;

  const LocalCommonAppScanResult({
    required this.uuid,
    required this.scanUUID,
    this.name,
    this.version,
    required this.installPath,
    required this.launcherPaths,
  });

  static const fromMap = LocalCommonAppScanResultMapper.fromMap;
  static const fromJson = LocalCommonAppScanResultMapper.fromJson;
}

@UseRowClass(LocalCommonAppScanResult)
@TableIndex(name: 'local_common_app_scan_result_uuid', columns: {#uuid})
@TableIndex(
    name: 'local_common_app_scan_result_scan_uuid', columns: {#scanUUID})
class LocalCommonAppScanResultTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get scanUUID => text()();
  TextColumn get name => text().nullable()();
  TextColumn get version => text().nullable()();
  TextColumn get installPath => text()();
  TextColumn get launcherPaths => text().map(const StringListConverter())();
}
