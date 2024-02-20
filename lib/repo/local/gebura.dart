import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/gebura_model.dart';

const _appSettingsFile = 'gebura_app_settings';
const _importedSteamAppInstsFile = 'gebura_imported_steam_app_insts';
const _localAppInstFoldersFile = 'gebura_local_app_inst_folders';
const _localAppInstIndependentsFile = 'gebura_local_app_inst_independents';

class GeburaRepo {
  late Box<String> _appSettings;
  late Box<String> _importedSteamAppInsts;
  late Box<String> _localAppInstFolders;
  late Box<String> _localAppInstIndependents;

  GeburaRepo._init(
    Box<String> appSettings,
    Box<String> importedSteamAppInsts,
    Box<String> localAppInstFolders,
    Box<String> localAppInstIndependents,
  ) {
    _importedSteamAppInsts = importedSteamAppInsts;
    _appSettings = appSettings;
    _localAppInstFolders = localAppInstFolders;
    _localAppInstIndependents = localAppInstIndependents;
  }

  static Future<GeburaRepo> init(String? path) async {
    final appSettings =
        await Hive.openBox<String>(_appSettingsFile, path: path);
    final importedSteamAppInsts =
        await Hive.openBox<String>(_importedSteamAppInstsFile, path: path);
    final localAppInstFolders =
        await Hive.openBox<String>(_localAppInstFoldersFile, path: path);
    final localAppInstIndependents =
        await Hive.openBox<String>(_localAppInstIndependentsFile, path: path);
    return GeburaRepo._init(appSettings, importedSteamAppInsts,
        localAppInstFolders, localAppInstIndependents);
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

  Future<void> setImportedSteamAppInsts(List<ImportedSteamAppInst> apps) async {
    await _importedSteamAppInsts.clear();
    for (final app in apps) {
      await _importedSteamAppInsts.put(
        app.instID.toString(),
        jsonEncode(app.toJson()),
      );
    }
  }

  List<ImportedSteamAppInst> getImportedSteamAppInsts() {
    final apps = <ImportedSteamAppInst>[];
    for (final key in _importedSteamAppInsts.keys) {
      final app = _importedSteamAppInsts.get(key);
      if (app != null) {
        apps.add(ImportedSteamAppInst.fromJson(
            jsonDecode(app) as Map<String, dynamic>));
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
