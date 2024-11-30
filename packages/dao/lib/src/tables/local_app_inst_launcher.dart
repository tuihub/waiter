import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'local_app_inst_launcher.mapper.dart';

@MappableClass()
class LocalAppInstLauncher with LocalAppInstLauncherMappable {
  final String uuid;
  final String appInstUUID;
  final LocalAppInstLauncherType launcherType;
  final bool? favorite;
  final LocalAppInstLaunchCommon? common;
  final LocalAppInstLaunchSteam? steam;

  const LocalAppInstLauncher({
    required this.uuid,
    required this.appInstUUID,
    required this.launcherType,
    this.favorite,
    this.common,
    this.steam,
  });

  static const fromMap = LocalAppInstLauncherMapper.fromMap;
  static const fromJson = LocalAppInstLauncherMapper.fromJson;
}

enum LocalAppInstLauncherType {
  common,
  steam,
}

@MappableClass()
class LocalAppInstLaunchCommon with LocalAppInstLaunchCommonMappable {
  final String launcherPath;
  final String? workingDir;
  final bool advancedTracing;
  final String? processName;
  final String? processPath;
  final int? sleepCount;
  final int? sleepDuration;

  const LocalAppInstLaunchCommon({
    required this.launcherPath,
    this.workingDir,
    this.advancedTracing = false,
    this.processName,
    this.processPath,
    this.sleepCount,
    this.sleepDuration,
  });

  static const fromMap = LocalAppInstLaunchCommonMapper.fromMap;
  static const fromJson = LocalAppInstLaunchCommonMapper.fromJson;
}

@MappableClass()
class LocalAppInstLaunchSteam with LocalAppInstLaunchSteamMappable {
  final String steamAppID;
  final String? launchOptions;

  const LocalAppInstLaunchSteam({
    required this.steamAppID,
    this.launchOptions,
  });

  static const fromMap = LocalAppInstLaunchSteamMapper.fromMap;
  static const fromJson = LocalAppInstLaunchSteamMapper.fromJson;
}

class LocalAppInstLaunchCommonConverter
    extends TypeConverter<LocalAppInstLaunchCommon, String>
    with JsonTypeConverter<LocalAppInstLaunchCommon, String> {
  const LocalAppInstLaunchCommonConverter();

  @override
  LocalAppInstLaunchCommon fromSql(String fromDb) {
    return LocalAppInstLaunchCommon.fromJson(fromDb);
  }

  @override
  String toSql(LocalAppInstLaunchCommon value) {
    return value.toJson();
  }
}

class LocalAppInstLaunchSteamConverter
    extends TypeConverter<LocalAppInstLaunchSteam, String>
    with JsonTypeConverter<LocalAppInstLaunchSteam, String> {
  const LocalAppInstLaunchSteamConverter();

  @override
  LocalAppInstLaunchSteam fromSql(String fromDb) {
    return LocalAppInstLaunchSteam.fromJson(fromDb);
  }

  @override
  String toSql(LocalAppInstLaunchSteam value) {
    return value.toJson();
  }
}

@UseRowClass(LocalAppInstLauncher)
@TableIndex(name: 'local_app_inst_launcher_uuid', columns: {#uuid})
@TableIndex(
    name: 'local_app_inst_launcher_app_inst_uuid', columns: {#appInstUUID})
class LocalAppInstLauncherTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get appInstUUID => text()();
  IntColumn get launcherType => intEnum<LocalAppInstLauncherType>()();
  BoolColumn get favorite => boolean().nullable()();
  TextColumn get common =>
      text().nullable().map(const LocalAppInstLaunchCommonConverter())();
  TextColumn get steam =>
      text().nullable().map(const LocalAppInstLaunchSteamConverter())();
}
