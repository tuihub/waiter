import 'package:drift/drift.dart';
import 'connection/shared.dart';

import 'kv.dart';

part 'database.g.dart';

// AppDatabase is the holder of the database instance in singleton pattern.
@DriftDatabase(tables: [KVTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(String dataPath) : super(openConnection(dataPath));

  @override
  int get schemaVersion => 1;
}
