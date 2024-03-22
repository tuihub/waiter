import 'package:drift/drift.dart';

import 'database.dart';

part 'kv.g.dart';

// KVTable is used to store a small amount of config data.
class KVTable extends Table {
  TextColumn get bucket => text()();
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {bucket, key};
}

@DriftAccessor(tables: [KVTable])
class KVDao extends DatabaseAccessor<AppDatabase> with _$KVDaoMixin {
  KVDao(super.db);

  Future<String?> get(String bucket, String key) async {
    final query = select(kVTable)
      ..where((t) => t.bucket.equals(bucket) & t.key.equals(key));
    final result = await query.get();
    if (result.isEmpty) {
      return null;
    }
    return result.first.value;
  }

  Future<void> set(String bucket, String key, String value) async {
    await into(kVTable).insertOnConflictUpdate(
      KVTableCompanion(
        bucket: Value(bucket),
        key: Value(key),
        value: Value(value),
      ),
    );
  }
}
