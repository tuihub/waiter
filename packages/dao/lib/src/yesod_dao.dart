import 'package:drift/drift.dart';

import 'database.dart';
import 'tables/cache_feed_config.dart';
import 'tables/cache_feed_item.dart';

part 'yesod_dao.g.dart';

@DriftAccessor(tables: [
  CacheFeedConfigTable,
  CacheFeedItemTable,
])
class YesodDao extends DatabaseAccessor<AppDatabase> with _$YesodDaoMixin {
  YesodDao(super.db);

  Future<List<CacheFeedConfig>> loadFeedConfigs(String serverId) async {
    final query = select(cacheFeedConfigTable)
      ..where((t) => t.serverId.equals(serverId));
    return query.get();
  }

  Future<int> addFeedConfig(CacheFeedConfig data) async {
    return into(cacheFeedConfigTable).insert(CacheFeedConfigTableCompanion(
        serverId: Value(data.serverId),
        internalId: Value(data.internalId),
        name: Value(data.name),
        category: Value(data.category),
        rawJsonData: Value(data.rawJsonData)));
  }

  Future<int> updateFeedConfig(CacheFeedConfig data) async {
    return (update(cacheFeedConfigTable)
          ..where((t) => t.internalId.equals(data.internalId)))
        .write(CacheFeedConfigTableCompanion(
            serverId: Value(data.serverId),
            internalId: Value(data.internalId),
            name: Value(data.name),
            category: Value(data.category),
            rawJsonData: Value(data.rawJsonData)));
  }

  Future<void> saveFeedConfigs(List<CacheFeedConfig> data) async {
    return transaction(() async {
      await batch((batch) {
        batch.replaceAll(
            cacheFeedConfigTable,
            data.map((e) => CacheFeedConfigTableCompanion(
                serverId: Value(e.serverId),
                internalId: Value(e.internalId),
                name: Value(e.name),
                category: Value(e.category),
                rawJsonData: Value(e.rawJsonData))));
      });
      await (delete(cacheFeedConfigTable)
            ..where((t) => t.internalId.isNotIn(data.map((e) => e.internalId))))
          .go();
    });
  }

  Future<CacheFeedItem?> getFeedItem(String serverId, String internalId) async {
    final query = (select(cacheFeedItemTable)
      ..where((t) => t.serverId.equals(serverId))
      ..where((t) => t.internalId.equals(internalId)));
    return query.getSingleOrNull();
  }

  Future<int> upsertFeedItem(CacheFeedItem data) async {
    return into(cacheFeedItemTable).insert(
      CacheFeedItemTableCompanion(
          serverId: Value(data.serverId),
          internalId: Value(data.internalId),
          rawJsonData: Value(data.rawJsonData)),
      mode: InsertMode.insertOrReplace,
    );
  }
}
