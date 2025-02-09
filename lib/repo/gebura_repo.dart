import 'dart:async';

import 'package:dao/dao.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../common/app_scrape/source.dart';
import '../common/app_scrape/source_bangumi.dart';
import '../common/file_helper.dart';
import '../common/steam/steam.dart';
import '../rust/api/win_icon.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

class GeburaRepo {
  final DIProvider<LibrarianService> _api;
  final GeburaDao _dao;
  final KVDao _kvDao;
  final String _dataPath;
  static const String _imagePath = 'libraryImage';

  static const _kvBucket = 'gebura';

  GeburaRepo(this._dao, this._api, this._kvDao, this._dataPath);

  Future<LocalApp> fetchLocalAppInfo(String uuid) async {
    LocalApp app = await _dao.getLocalApp(uuid);
    final appInsts = await _dao.loadLocalAppInsts(appUUID: app.uuid);
    for (final inst in appInsts) {
      final launchers =
          await _dao.loadLocalAppInstLaunchers(appInstUUID: inst.uuid);
      for (final launcher in launchers) {
        switch (launcher.launcherType) {
          case LocalAppInstLauncherType.common:
            try {
              final tmpDir = await getTemporaryDirectory();
              final iconImagePath =
                  '${tmpDir.path}${Platform.pathSeparator}${launcher.uuid}.png';
              await getImagesFromExe(
                executablePath: launcher.common!.launcherPath,
                imagePath: iconImagePath,
              );
              app = app.copyWith(
                iconImagePath: iconImagePath,
              );
              AppScrapedInfo? scraped;
              if (!app.thirdPartyIds.containsKey('bangumi')) {
                scraped = await BangumiSource().searchAppByName(app.name);
              } else {
                scraped = await BangumiSource().searchAppById(
                  app.thirdPartyIds['bangumi']!,
                );
              }
              if (scraped != null) {
                app = app.copyWith(
                  name: scraped.name,
                  shortDescription:
                      app.shortDescription ?? scraped.shortDescription,
                  iconImageUrl: app.iconImageUrl ?? scraped.iconImageUrl,
                  backgroundImageUrl:
                      app.backgroundImageUrl ?? scraped.backgroundImageUrl,
                  coverImageUrl: app.coverImageUrl ?? scraped.coverImageUrl,
                  description: app.description ?? scraped.description,
                  releaseDate: app.releaseDate ?? scraped.releaseDate,
                  developer: app.developer ?? scraped.developer,
                  publisher: app.publisher ?? scraped.publisher,
                  thirdPartyIds: {'bangumi': scraped.id, ...app.thirdPartyIds},
                );
              }
            } catch (e) {
              debugPrint('Failed to fetch common launcher info: $e');
            }
          case LocalAppInstLauncherType.steam:
            final steamAppID = launcher.steam!.steamAppID;
            if (app.iconImagePath == null) {
              app = app.copyWith(
                iconImagePath: getAppIconFilePath(steamAppID),
              );
            }
            if (app.coverImagePath == null) {
              app = app.copyWith(
                coverImagePath: getAppCoverFilePath(steamAppID),
              );
            }
            if (app.backgroundImagePath == null) {
              app = app.copyWith(
                backgroundImagePath: getAppBackgroundFilePath(steamAppID),
              );
            }
        }
      }
    }
    return app;
  }

  Future<void> updateLocalApp(LocalApp app) async {
    await _dao.updateLocalApp(app);
  }

  Future<List<LocalApp>> loadLocalApps() async {
    return _dao.loadLocalApps();
  }

  Future<int> addLocalAppInst(
    LocalAppInst inst, {
    LocalApp? app,
    String? appUUID,
  }) async {
    if (app == null && appUUID == null) {
      throw ArgumentError('app or appUUID must be provided');
    }
    if (app == null) {
      app = await _dao.getLocalApp(appUUID!);
    } else {
      await _dao.addLocalApp(app);
    }
    if (app.uuid != inst.appUUID) {
      throw ArgumentError('appUUID must match app.UUID');
    }
    return _dao.addLocalAppInst(inst);
  }

  Future<void> updateLocalAppInst(LocalAppInst inst) async {
    await _dao.updateLocalAppInst(inst);
  }

  Future<List<LocalAppInst>> loadLocalAppInsts({String? appUUID}) async {
    return _dao.loadLocalAppInsts(appUUID: appUUID);
  }

  Future<void> updateLocalAppInstLauncher(LocalAppInstLauncher launcher) async {
    await _dao.updateLocalAppInstLauncher(launcher);
  }

  Future<List<LocalAppInstLauncher>> loadLocalAppInstLaunchers(
      {String? appInstUUID}) async {
    return _dao.loadLocalAppInstLaunchers(appInstUUID: appInstUUID);
  }

  Future<void> addLocalAppInstLauncher(LocalAppInstLauncher launcher) async {
    await _dao.addLocalAppInstLauncher(launcher);
  }

  Future<void> addLocalCommonLibraryFolder(LocalCommonAppScan folder) async {
    await _dao.addLocalCommonAppScan(folder);
  }

  Future<LocalCommonAppScan> getLocalCommonLibraryFolder(String uuid) async {
    return _dao.getLocalCommonAppScan(uuid);
  }

  Future<List<LocalCommonAppScan>> loadLocalCommonLibraryFolders() async {
    return _dao.loadLocalCommonAppScans();
  }

  Future<void> saveLocalCommonLibraryScanResults(
    List<LocalCommonAppScanResult> result,
  ) async {
    await _dao.saveLocalCommonAppScanResults(result);
  }

  Future<List<LocalCommonAppScanResult>> loadLocalCommonLibraryScanResults(
      {String? uuid, String? scanUUID}) async {
    return _dao.loadLocalCommonAppScanResults(uuid: uuid, scanUUID: scanUUID);
  }

  Future<void> saveLocalSteamLibraryFolders(List<String> folders) async {
    await _dao.saveLocalSteamAppScan(
      folders
          .map((e) => LocalSteamAppScan(
                uuid: const Uuid().v1(),
                libraryPath: e,
                enableAutoScan: true,
              ))
          .toList(),
    );
  }

  Future<List<LocalSteamAppScan>> loadLocalSteamLibraryFolders() async {
    return _dao.loadLocalSteamAppScans();
  }

  Future<void> saveLocalSteamLibraryScanResults(
    List<LocalSteamAppScanResult> result,
  ) async {
    await _dao.saveLocalSteamAppScanResults(result);
  }

  Future<List<LocalSteamAppScanResult>> loadLocalSteamLibraryScanResults(
      {String? scanUUID, String? uuid}) async {
    return _dao.loadLocalSteamAppScanResults(uuid: uuid, scanUUID: scanUUID);
  }

  Future<void> addLocalAppRunRecord(LocalAppRunRecord record) async {
    await _dao.addLocalAppRunRecord(record);
  }

  Future<LocalAppRunRecord> getLocalAppRunRecord(String uuid) async {
    return _dao.getLocalAppRunRecord(uuid);
  }

  Future<Duration> sumLocalAppRunRecord(String appUUID,
      {DateTime? start, Duration? duration}) async {
    return _dao.sumLocalAppRunRecord(appUUID, start: start, duration: duration);
  }

  /// Save the image to local storage and return the path.
  Future<String?> localizeImage({
    String? url,
    String? path,
  }) async {
    // Early return
    if (path != null && path.startsWith(_dataPath)) {
      return path;
    }
    // Localize the image
    String? res;
    final targetPath = p.join(_dataPath, _imagePath);
    if (!Directory(targetPath).existsSync()) {
      await Directory(targetPath).create(recursive: true);
    }
    // If path is null, download the image from url
    if (path == null) {
      if (url == null) {
        return null;
      } else {
        final tmpDir = await getTemporaryDirectory();
        final ext = url.split('.').last;
        final fileName = '${const Uuid().v1()}.$ext';
        final tmpPath = '${tmpDir.path}${Platform.pathSeparator}$fileName';
        await FileHelper.downloadImage(url, tmpPath);
        path = tmpPath;
      }
    }
    // If file is not in the data path, copy it to the data path
    if (!path.startsWith(_dataPath)) {
      final ext = path.split('.').last;
      final fileName = '${const Uuid().v1()}.$ext';
      res = '$targetPath${Platform.pathSeparator}$fileName';
      await File(path).copy(res);
    } else {
      res = path;
    }
    return res;
  }
}
