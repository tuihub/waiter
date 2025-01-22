import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'cache_feed_config.mapper.dart';

@MappableClass()
class CacheFeedConfig with CacheFeedConfigMappable {
  final String serverId;
  final String internalId;
  final String name;
  final String category;

  final String rawJsonData;

  const CacheFeedConfig({
    required this.serverId,
    required this.internalId,
    required this.name,
    required this.category,
    required this.rawJsonData,
  });

  static const fromMap = CacheFeedConfigMapper.fromMap;
  static const fromJson = CacheFeedConfigMapper.fromJson;
}

@UseRowClass(CacheFeedConfig)
@TableIndex(
    name: 'cache_feed_config_server_id_internal_id',
    columns: {#serverId, #internalId},
    unique: true)
class CacheFeedConfigTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serverId => text()();
  TextColumn get internalId => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();

  TextColumn get rawJsonData => text()();
}
