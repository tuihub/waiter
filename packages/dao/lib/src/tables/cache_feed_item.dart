import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'cache_feed_item.mapper.dart';

@MappableClass()
class CacheFeedItem with CacheFeedItemMappable {
  final String serverId;
  final String internalId;

  final String rawJsonData;

  const CacheFeedItem({
    required this.serverId,
    required this.internalId,
    required this.rawJsonData,
  });

  static const fromMap = CacheFeedItemMapper.fromMap;
  static const fromJson = CacheFeedItemMapper.fromJson;
}

@UseRowClass(CacheFeedItem)
@TableIndex(
    name: 'cache_feed_item_server_id_internal_id',
    columns: {#serverId, #internalId},
    unique: true)
class CacheFeedItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serverId => text()();
  TextColumn get internalId => text()();

  TextColumn get rawJsonData => text()();
}
