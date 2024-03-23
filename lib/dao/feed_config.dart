import 'package:drift/drift.dart';

import 'database.dart';

part 'feed_config.g.dart';

// FeedConfigTable is used to store feed config data.
class FeedConfigTable extends Table {
  TextColumn get internalId => text().unique()();
  TextColumn get name => text()();
  TextColumn get feedUrl => text()();
  TextColumn get category => text()();

  TextColumn get jsonData => text()();

  @override
  Set<Column> get primaryKey => {internalId};
}

@DriftAccessor(tables: [FeedConfigTable])
class FeedConfigDao extends DatabaseAccessor<AppDatabase>
    with _$FeedConfigDaoMixin {
  FeedConfigDao(super.db);

  Future<List<FeedConfigTableData>> getAll() async {
    final query = select(feedConfigTable);
    return query.get();
  }

  Future<int> addOne(FeedConfigTableData data) async {
    return into(feedConfigTable).insert(data);
  }

  Future<int> updateOne(FeedConfigTableData data) async {
    return (update(feedConfigTable)
          ..where((t) => t.internalId.equals(data.internalId)))
        .write(data);
  }

  Future<void> setAll(List<FeedConfigTableData> data) async {
    return transaction(() async {
      await batch((batch) {
        batch.replaceAll(feedConfigTable, data);
      });
      await (delete(feedConfigTable)
            ..where((t) => t.internalId.isNotIn(data.map((e) => e.internalId))))
          .go();
    });
  }
}
