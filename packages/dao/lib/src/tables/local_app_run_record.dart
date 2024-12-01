import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'local_app_run_record.mapper.dart';

@MappableClass()
class LocalAppRunRecord with LocalAppRunRecordMappable {
  final String uuid;
  final String appUUID;
  final String instUUID;
  final String launcherUUID;
  final DateTime startTime;
  final DateTime? endTime;

  const LocalAppRunRecord({
    required this.uuid,
    required this.appUUID,
    required this.instUUID,
    required this.launcherUUID,
    required this.startTime,
    this.endTime,
  });

  static const fromMap = LocalAppRunRecordMapper.fromMap;
  static const fromJson = LocalAppRunRecordMapper.fromJson;
}

@UseRowClass(LocalAppRunRecord)
@TableIndex(name: 'local_app_run_record_uuid', columns: {#uuid})
@TableIndex(
    name: 'local_app_run_record_app_uuid',
    columns: {#appUUID, #instUUID, #launcherUUID})
class LocalAppRunRecordTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get appUUID => text()();
  TextColumn get instUUID => text()();
  TextColumn get launcherUUID => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
}
