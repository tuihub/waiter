import 'package:drift/drift.dart';

import 'connection/shared.dart';
import 'feed_config.dart';
import 'kv.dart';
import 'tables/local_app.dart';
import 'tables/local_app_inst.dart';
import 'tables/local_app_inst_launcher.dart';
import 'tables/local_common_app_scan.dart';
import 'tables/local_common_app_scan_result.dart';
import 'tables/local_steam_app_scan.dart';
import 'tables/local_steam_app_scan_result.dart';
import 'tables/utils.dart';

part 'database.g.dart';

// AppDatabase is the holder of the database instance in singleton pattern.
@DriftDatabase(
  tables: [
    KVTable,
    FeedConfigTable,
    LocalAppTable,
    LocalAppInstTable,
    LocalAppInstLauncherTable,
    LocalCommonAppScanTable,
    LocalCommonAppScanResultTable,
    LocalSteamAppScanTable,
    LocalSteamAppScanResultTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(String dataPath) : super(openConnection(dataPath));

  @override
  int get schemaVersion => 1;
}
