import 'package:drift/drift.dart';

import 'database.dart';
import 'tables/local_app.dart';
import 'tables/local_app_inst.dart';
import 'tables/local_app_inst_launcher.dart';
import 'tables/local_common_app_scan.dart';
import 'tables/local_common_app_scan_result.dart';
import 'tables/local_steam_app_scan.dart';
import 'tables/local_steam_app_scan_result.dart';

part 'gebura_dao.g.dart';

@DriftAccessor(tables: [
  LocalAppTable,
  LocalAppInstTable,
  LocalAppInstLauncherTable,
  LocalCommonAppScanTable,
  LocalCommonAppScanResultTable,
  LocalSteamAppScanTable,
  LocalSteamAppScanResultTable,
])
class GeburaDao extends DatabaseAccessor<AppDatabase> with _$GeburaDaoMixin {
  GeburaDao(super.db);

  Future<int> addLocalApp(LocalApp data) async {
    if (data.lastLaunchedInstUUID != null) {
      final inst = await getLocalAppInst(data.lastLaunchedInstUUID!);
      if (inst.uuid != data.lastLaunchedInstUUID) {
        throw Exception('Last launched instance not found');
      }
    }
    return into(localAppTable).insert(LocalAppTableCompanion(
      uuid: Value(data.uuid),
      name: Value(data.name),
      lastLaunchedInstUUID: Value(data.lastLaunchedInstUUID),
      shortDescription: Value(data.shortDescription),
      iconImageUrl: Value(data.iconImageUrl),
      iconImagePath: Value(data.iconImagePath),
      backgroundImageUrl: Value(data.backgroundImageUrl),
      backgroundImagePath: Value(data.backgroundImagePath),
      coverImageUrl: Value(data.coverImageUrl),
      coverImagePath: Value(data.coverImagePath),
      description: Value(data.description),
      releaseDate: Value(data.releaseDate),
      developer: Value(data.developer),
      publisher: Value(data.publisher),
    ));
  }

  Future<LocalApp> getLocalApp(String uuid) async {
    final query = select(localAppTable)..where((t) => t.uuid.equals(uuid));
    return query.getSingle();
  }

  Future<List<LocalApp>> loadLocalApps() async {
    final query = select(localAppTable);
    return query.get();
  }

  Future<void> updateLocalApp(LocalApp data) async {
    if (data.lastLaunchedInstUUID != null) {
      final inst = await getLocalAppInst(data.lastLaunchedInstUUID!);
      if (inst.uuid != data.lastLaunchedInstUUID) {
        throw Exception('Last launched instance not found');
      }
    }
    await (update(localAppTable)..where((t) => t.uuid.equals(data.uuid)))
        .write(LocalAppTableCompanion(
      name: Value(data.name),
      lastLaunchedInstUUID: Value(data.lastLaunchedInstUUID),
      shortDescription: Value(data.shortDescription),
      iconImageUrl: Value(data.iconImageUrl),
      iconImagePath: Value(data.iconImagePath),
      backgroundImageUrl: Value(data.backgroundImageUrl),
      backgroundImagePath: Value(data.backgroundImagePath),
      coverImageUrl: Value(data.coverImageUrl),
      coverImagePath: Value(data.coverImagePath),
      description: Value(data.description),
      releaseDate: Value(data.releaseDate),
      developer: Value(data.developer),
      publisher: Value(data.publisher),
    ));
  }

  Future<void> deleteLocalApp(String uuid) async {
    await (delete(localAppTable)..where((t) => t.uuid.equals(uuid))).go();
  }

  Future<int> addLocalAppInst(LocalAppInst data) async {
    final app = await getLocalApp(data.appUUID);
    if (app.uuid != data.appUUID) {
      throw Exception('App not found');
    }
    if (data.lastLaunchedLauncherUUID != null) {
      final launcher =
          await getLocalAppInstLauncher(data.lastLaunchedLauncherUUID!);
      if (launcher.uuid != data.lastLaunchedLauncherUUID) {
        throw Exception('Last launched launcher not found');
      }
    }
    return into(localAppInstTable).insert(LocalAppInstTableCompanion(
      uuid: Value(data.uuid),
      appUUID: Value(data.appUUID),
      name: Value(data.name),
      path: Value(data.path),
      version: Value(data.version),
      lastLaunchedLauncherUUID: Value(data.lastLaunchedLauncherUUID),
    ));
  }

  Future<LocalAppInst> getLocalAppInst(String uuid) async {
    final query = select(localAppInstTable)..where((t) => t.uuid.equals(uuid));
    return query.getSingle();
  }

  Future<List<LocalAppInst>> loadLocalAppInsts({String? appUUID}) async {
    final query = select(localAppInstTable);
    if (appUUID != null) {
      query.where((t) => t.appUUID.equals(appUUID));
    }
    return query.get();
  }

  Future<void> updateLocalAppInst(LocalAppInst data) async {
    final app = await getLocalApp(data.appUUID);
    if (app.uuid != data.appUUID) {
      throw Exception('App not found');
    }
    if (data.lastLaunchedLauncherUUID != null) {
      final launcher =
          await getLocalAppInstLauncher(data.lastLaunchedLauncherUUID!);
      if (launcher.uuid != data.lastLaunchedLauncherUUID) {
        throw Exception('Last launched launcher not found');
      }
    }
    await (update(localAppInstTable)..where((t) => t.uuid.equals(data.uuid)))
        .write(LocalAppInstTableCompanion(
      uuid: Value(data.uuid),
      appUUID: Value(data.appUUID),
      name: Value(data.name),
      path: Value(data.path),
      version: Value(data.version),
      lastLaunchedLauncherUUID: Value(data.lastLaunchedLauncherUUID),
    ));
  }

  Future<void> deleteLocalAppInst(String uuid) async {
    await (delete(localAppInstTable)..where((t) => t.uuid.equals(uuid))).go();
  }

  Future<int> addLocalAppInstLauncher(LocalAppInstLauncher data) async {
    final inst = await getLocalAppInst(data.appInstUUID);
    if (inst.uuid != data.appInstUUID) {
      throw Exception('App instance not found');
    }
    return into(localAppInstLauncherTable)
        .insert(LocalAppInstLauncherTableCompanion(
      uuid: Value(data.uuid),
      appInstUUID: Value(data.appInstUUID),
      launcherType: Value(data.launcherType),
      favorite: Value(data.favorite),
      common: Value(data.common),
      steam: Value(data.steam),
    ));
  }

  Future<LocalAppInstLauncher> getLocalAppInstLauncher(String uuid) async {
    final query = select(localAppInstLauncherTable)
      ..where((t) => t.uuid.equals(uuid));
    return query.getSingle();
  }

  Future<List<LocalAppInstLauncher>> loadLocalAppInstLaunchers(
      {String? appInstUUID}) async {
    final query = select(localAppInstLauncherTable);
    if (appInstUUID != null) {
      query.where((t) => t.appInstUUID.equals(appInstUUID));
    }
    return query.get();
  }

  Future<void> updateLocalAppInstLauncher(LocalAppInstLauncher data) async {
    final inst = await getLocalAppInst(data.appInstUUID);
    if (inst.uuid != data.appInstUUID) {
      throw Exception('App instance not found');
    }
    await (update(localAppInstLauncherTable)
          ..where((t) => t.uuid.equals(data.uuid)))
        .write(LocalAppInstLauncherTableCompanion(
      uuid: Value(data.uuid),
      appInstUUID: Value(data.appInstUUID),
      launcherType: Value(data.launcherType),
      favorite: Value(data.favorite),
      common: Value(data.common),
      steam: Value(data.steam),
    ));
  }

  Future<void> deleteLocalAppInstLauncher(String uuid) async {
    await (delete(localAppInstLauncherTable)..where((t) => t.uuid.equals(uuid)))
        .go();
  }

  Future<int> addLocalCommonAppScan(LocalCommonAppScan data) async {
    return into(localCommonAppScanTable)
        .insert(LocalCommonAppScanTableCompanion(
      uuid: Value(data.uuid),
      basePath: Value(data.basePath),
      enableAutoScan: Value(data.enableAutoScan),
      excludeDirectoryMatchers: Value(data.excludeDirectoryMatchers),
      minInstallDirDepth: Value(data.minInstallDirDepth),
      maxInstallDirDepth: Value(data.maxInstallDirDepth),
      pathFieldMatcher: Value(data.pathFieldMatcher),
      pathFieldMatcherAlignment: Value(data.pathFieldMatcherAlignment),
      includeExecutableMatchers: Value(data.includeExecutableMatchers),
      excludeExecutableMatchers: Value(data.excludeExecutableMatchers),
      minExecutableDepth: Value(data.minExecutableDepth),
      maxExecutableDepth: Value(data.maxExecutableDepth),
    ));
  }

  Future<LocalCommonAppScan> getLocalCommonAppScan(String uuid) async {
    final query = select(localCommonAppScanTable)
      ..where((t) => t.uuid.equals(uuid));
    return query.getSingle();
  }

  Future<List<LocalCommonAppScan>> loadLocalCommonAppScans() async {
    final query = select(localCommonAppScanTable);
    return query.get();
  }

  Future<void> updateLocalCommonAppScan(LocalCommonAppScan data) async {
    await (update(localCommonAppScanTable)
          ..where((t) => t.uuid.equals(data.uuid)))
        .write(LocalCommonAppScanTableCompanion(
      uuid: Value(data.uuid),
      basePath: Value(data.basePath),
      excludeDirectoryMatchers: Value(data.excludeDirectoryMatchers),
      minInstallDirDepth: Value(data.minInstallDirDepth),
      maxInstallDirDepth: Value(data.maxInstallDirDepth),
      pathFieldMatcher: Value(data.pathFieldMatcher),
      pathFieldMatcherAlignment: Value(data.pathFieldMatcherAlignment),
      includeExecutableMatchers: Value(data.includeExecutableMatchers),
      excludeExecutableMatchers: Value(data.excludeExecutableMatchers),
      minExecutableDepth: Value(data.minExecutableDepth),
      maxExecutableDepth: Value(data.maxExecutableDepth),
    ));
  }

  Future<void> deleteLocalCommonAppScan(String uuid) async {
    await (delete(localCommonAppScanTable)..where((t) => t.uuid.equals(uuid)))
        .go();
  }

  Future<void> saveLocalCommonAppScanResults(
      List<LocalCommonAppScanResult> data) async {
    if (data.isEmpty) {
      return;
    }
    final scanUUID = data.first.scanUUID;
    for (final item in data) {
      if (item.scanUUID != scanUUID) {
        throw Exception('All results must have the same scanUUID');
      }
    }
    return transaction(() async {
      await (delete(localCommonAppScanResultTable)
            ..where((t) => t.scanUUID.equals(scanUUID)))
          .go();
      await batch((batch) {
        for (final item in data) {
          batch.insert(
              localCommonAppScanResultTable,
              LocalCommonAppScanResultTableCompanion(
                uuid: Value(item.uuid),
                scanUUID: Value(item.scanUUID),
                name: Value(item.name),
                version: Value(item.version),
                installPath: Value(item.installPath),
                launcherPaths: Value(item.launcherPaths),
              ));
        }
      });
    });
  }

  Future<List<LocalCommonAppScanResult>> loadLocalCommonAppScanResults(
      {String? uuid, String? scanUUID}) async {
    final query = select(localCommonAppScanResultTable);
    if (uuid != null) {
      query.where((t) => t.uuid.equals(uuid));
    }
    if (scanUUID != null) {
      query.where((t) => t.scanUUID.equals(scanUUID));
    }
    return query.get();
  }

  Future<void> saveLocalSteamAppScan(List<LocalSteamAppScan> data) async {
    if (data.isEmpty) {
      return;
    }
    return transaction(() async {
      await delete(localSteamAppScanTable).go();
      await batch((batch) {
        for (final item in data) {
          batch.insert(
              localSteamAppScanTable,
              LocalSteamAppScanTableCompanion(
                uuid: Value(item.uuid),
                libraryPath: Value(item.libraryPath),
                enableAutoScan: Value(item.enableAutoScan),
              ));
        }
      });
    });
  }

  Future<int> addLocalSteamAppScan(LocalSteamAppScan data) async {
    final exist = await (select(localSteamAppScanTable)
          ..where((t) => t.libraryPath.equals(data.libraryPath)))
        .get();
    if (exist.isNotEmpty) {
      throw Exception('Library path already exists');
    }
    return into(localSteamAppScanTable).insert(LocalSteamAppScanTableCompanion(
      uuid: Value(data.uuid),
      libraryPath: Value(data.libraryPath),
      enableAutoScan: Value(data.enableAutoScan),
    ));
  }

  Future<LocalSteamAppScan> getLocalSteamAppScan(String uuid) async {
    final query = select(localSteamAppScanTable)
      ..where((t) => t.uuid.equals(uuid));
    return query.getSingle();
  }

  Future<List<LocalSteamAppScan>> loadLocalSteamAppScans() async {
    final query = select(localSteamAppScanTable);
    return query.get();
  }

  Future<void> updateLocalSteamAppScan(LocalSteamAppScan data) async {
    await (update(localSteamAppScanTable)
          ..where((t) => t.uuid.equals(data.uuid)))
        .write(LocalSteamAppScanTableCompanion(
      uuid: Value(data.uuid),
      libraryPath: Value(data.libraryPath),
      enableAutoScan: Value(data.enableAutoScan),
    ));
  }

  Future<void> deleteLocalSteamAppScan(String uuid) async {
    await (delete(localSteamAppScanTable)..where((t) => t.uuid.equals(uuid)))
        .go();
  }

  Future<void> saveLocalSteamAppScanResults(
      List<LocalSteamAppScanResult> data) async {
    if (data.isEmpty) {
      return;
    }
    final scanUUID = data.first.scanUUID;
    for (final item in data) {
      if (item.scanUUID != scanUUID) {
        throw Exception('All results must have the same scanUUID');
      }
    }
    return transaction(() async {
      await (delete(localSteamAppScanResultTable)
            ..where((t) => t.scanUUID.equals(scanUUID)))
          .go();
      await batch((batch) {
        for (final item in data) {
          batch.insert(
              localSteamAppScanResultTable,
              LocalSteamAppScanResultTableCompanion(
                uuid: Value(item.uuid),
                scanUUID: Value(item.scanUUID),
                steamAppID: Value(item.steamAppID),
                name: Value(item.name),
                installPath: Value(item.installPath),
                launcherPath: Value(item.launcherPath),
                sizeOnDisk: Value(item.sizeOnDisk),
              ));
        }
      });
    });
  }

  Future<List<LocalSteamAppScanResult>> loadLocalSteamAppScanResults(
      {String? uuid, String? scanUUID}) async {
    final query = select(localSteamAppScanResultTable);
    if (uuid != null) {
      query.where((t) => t.uuid.equals(uuid));
    }
    if (scanUUID != null) {
      query.where((t) => t.scanUUID.equals(scanUUID));
    }
    return query.get();
  }
}
