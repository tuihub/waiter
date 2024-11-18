import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'utils.dart';

part 'local_common_app_scan.mapper.dart';

@MappableClass()
class LocalCommonAppScan with LocalCommonAppScanMappable {
  final String uuid;
  // base
  final String basePath;
  final bool enableAutoScan;
  // install dir matcher
  final List<String> excludeDirectoryMatchers; // walk
  final int minInstallDirDepth; // build
  final int maxInstallDirDepth; // build
  final List<LocalCommonAppScanPathFieldMatcher> pathFieldMatcher; // build
  final LocalCommonAppScanPathFieldMatcherAlignment
      pathFieldMatcherAlignment; // build
  final List<String> includeExecutableMatchers; // walk
  final List<String> excludeExecutableMatchers; // walk
  // extra executable file matcher
  final int minExecutableDepth; // build
  final int maxExecutableDepth; // build

  const LocalCommonAppScan({
    required this.uuid,
    required this.basePath,
    required this.enableAutoScan,
    required this.excludeDirectoryMatchers,
    required this.minInstallDirDepth,
    required this.maxInstallDirDepth,
    required this.pathFieldMatcher,
    required this.pathFieldMatcherAlignment,
    required this.includeExecutableMatchers,
    required this.excludeExecutableMatchers,
    required this.minExecutableDepth,
    required this.maxExecutableDepth,
  });

  static const fromMap = LocalCommonAppScanMapper.fromMap;
  static const fromJson = LocalCommonAppScanMapper.fromJson;
}

enum LocalCommonAppScanPathFieldMatcher {
  ignore,
  name,
  version,
}

enum LocalCommonAppScanPathFieldMatcherAlignment {
  left,
  right,
}

class LocalCommonAppScanConverter
    extends TypeConverter<LocalCommonAppScan, String>
    with JsonTypeConverter<LocalCommonAppScan, String> {
  const LocalCommonAppScanConverter();

  @override
  LocalCommonAppScan fromSql(String fromDb) {
    return LocalCommonAppScan.fromJson(fromDb);
  }

  @override
  String toSql(LocalCommonAppScan value) {
    return value.toJson();
  }
}

// LocalCommonAppScanTable is used to store common app folder scan settings
@UseRowClass(LocalCommonAppScan)
@TableIndex(name: 'local_common_app_scan_uuid', columns: {#uuid})
@TableIndex(name: 'local_common_app_scan_base_path', columns: {#basePath})
class LocalCommonAppScanTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get basePath => text()();
  BoolColumn get enableAutoScan => boolean()();
  TextColumn get excludeDirectoryMatchers =>
      text().map(const StringListConverter())();
  IntColumn get minInstallDirDepth => integer()();
  IntColumn get maxInstallDirDepth => integer()();
  TextColumn get pathFieldMatcher => text().map(
      EnumListConverter(() => LocalCommonAppScanPathFieldMatcher.values))();
  TextColumn get pathFieldMatcherAlignment =>
      textEnum<LocalCommonAppScanPathFieldMatcherAlignment>()();
  TextColumn get includeExecutableMatchers =>
      text().map(const StringListConverter())();
  TextColumn get excludeExecutableMatchers =>
      text().map(const StringListConverter())();
  IntColumn get minExecutableDepth => integer()();
  IntColumn get maxExecutableDepth => integer()();
}
