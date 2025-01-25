import 'package:drift/drift.dart';

import 'connection/shared.dart';
import 'kv_dao.dart';
import 'tables/cache_feed_config.dart';
import 'tables/cache_feed_item.dart';
import 'tables/local_app.dart';
import 'tables/local_app_inst.dart';
import 'tables/local_app_inst_launcher.dart';
import 'tables/local_app_run_record.dart';
import 'tables/local_common_app_scan.dart';
import 'tables/local_common_app_scan_result.dart';
import 'tables/local_steam_app_scan.dart';
import 'tables/local_steam_app_scan_result.dart';
import 'tables/server_config.dart';
import 'tables/utils.dart';

part 'database.g.dart';

// AppDatabase is the holder of the database instance in singleton pattern.
@DriftDatabase(
  tables: [
    KVTable,
    ServerConfigTable,
    CacheFeedConfigTable,
    CacheFeedItemTable,
    LocalAppTable,
    LocalAppInstTable,
    LocalAppInstLauncherTable,
    LocalAppRunRecordTable,
    LocalCommonAppScanTable,
    LocalCommonAppScanResultTable,
    LocalSteamAppScanTable,
    LocalSteamAppScanResultTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(String dataPath, {String name = 'db'})
      : super(openConnection(dataPath, name));

  @override
  int get schemaVersion => 1;
}
