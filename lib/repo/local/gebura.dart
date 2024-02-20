import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/gebura_model.dart';

const _appSettingsFile = 'gebura_app_settings';
const _importedSteamAppsFile = 'gebura_imported_steam_apps';
const _localAppInstFoldersFile = 'gebura_local_app_inst_folders';
const _localAppInstIndependentsFile = 'gebura_local_app_inst_independents';

class GeburaRepo {
  late Box<String> _appSettings;
  late Box<String> _importedSteamApps;
  late Box<String> _localAppInstFolders;
  late Box<String> _localAppInstIndependents;

  GeburaRepo._init(
    Box<String> appSettings,
    Box<String> importedSteamApps,
    Box<String> localAppInstFolders,
    Box<String> localAppInstIndependents,
  ) {
    _importedSteamApps = importedSteamApps;
    _appSettings = appSettings;
    _localAppInstFolders = localAppInstFolders;
    _localAppInstIndependents = localAppInstIndependents;
  }

  static Future<GeburaRepo> init(String? path) async {
    final appSettings =
        await Hive.openBox<String>(_appSettingsFile, path: path);
    final importedSteamApps =
        await Hive.openBox<String>(_importedSteamAppsFile, path: path);
    final localAppInstFolders =
        await Hive.openBox<String>(_localAppInstFoldersFile, path: path);
    final localAppInstIndependents =
        await Hive.openBox<String>(_localAppInstIndependentsFile, path: path);
    return GeburaRepo._init(appSettings, importedSteamApps, localAppInstFolders,
        localAppInstIndependents);
  }

  Future<void> setAppLauncherSetting(AppLauncherSetting setting) async {
    await _appSettings.put(
      setting.appInstID.toString(),
      jsonEncode(setting.toJson()),
    );
  }

  AppLauncherSetting? getAppLauncherSetting(int appInstID) {
    final setting = _appSettings.get(appInstID.toString());
    if (setting != null) {
      return AppLauncherSetting.fromJson(
          jsonDecode(setting) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> setImportedSteamApps(List<ImportedSteamApp> apps) async {
    await _importedSteamApps.clear();
    for (final app in apps) {
      await _importedSteamApps.put(
        app.internalID.toString(),
        jsonEncode(app.toJson()),
      );
    }
  }

  List<ImportedSteamApp> getImportedSteamApps() {
    final apps = <ImportedSteamApp>[];
    for (final key in _importedSteamApps.keys) {
      final app = _importedSteamApps.get(key);
      if (app != null) {
        apps.add(
            ImportedSteamApp.fromJson(jsonDecode(app) as Map<String, dynamic>));
      }
    }
    return apps;
  }

  Future<void> setLocalAppInstFolder(LocalAppInstFolder folder) async {
    await _localAppInstFolders.put(folder.path, jsonEncode(folder.toJson()));
  }

  Future<void> removeLocalAppInstFolder(String path) async {
    await _localAppInstFolders.delete(path);
  }

  List<LocalAppInstFolder> getLocalAppInstFolders() {
    final folders = <LocalAppInstFolder>[];
    for (final key in _localAppInstFolders.keys) {
      final folder = _localAppInstFolders.get(key);
      if (folder != null) {
        folders.add(LocalAppInstFolder.fromJson(
            jsonDecode(folder) as Map<String, dynamic>));
      }
    }
    return folders;
  }

  Future<void> setLocalAppInstIndependent(
      LocalAppInstIndependent independent) async {
    await _localAppInstIndependents.put(
        independent.appInstID.toString(), jsonEncode(independent.toJson()));
  }

  Future<void> removeLocalAppInstIndependent(int appInstID) async {
    await _localAppInstIndependents.delete(appInstID.toString());
  }

  List<LocalAppInstIndependent> getLocalAppInstIndependents() {
    final independents = <LocalAppInstIndependent>[];
    for (final key in _localAppInstIndependents.keys) {
      final independent = _localAppInstIndependents.get(key);
      if (independent != null) {
        independents.add(LocalAppInstIndependent.fromJson(
            jsonDecode(independent) as Map<String, dynamic>));
      }
    }
    return independents;
  }
}
