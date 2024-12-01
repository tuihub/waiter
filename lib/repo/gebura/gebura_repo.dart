import 'package:dao/dao.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../../common/steam/steam.dart';
import '../../rust/api/win_icon.dart';
import '../grpc/api_helper.dart';

class GeburaRepo {
  ApiHelper get _api => GetIt.I.get<ApiHelper>();
  GeburaDao get _dao => GetIt.I.get<GeburaDao>();
  KVDao get _kvDao => GetIt.I.get<KVDao>();

  static const _kvBucket = 'gebura';

  GeburaRepo();

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
            } catch (_) {
              // pass
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
}
