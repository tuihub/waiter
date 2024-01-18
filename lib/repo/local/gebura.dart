import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/gebura_model.dart';

const _appSettingsFile = 'gebura_app_settings';
const _importedSteamAppsFile = 'gebura_imported_steam_apps';

class GeburaRepo {
  late Box<String> _appSettings;
  late Box<String> _importedSteamApps;

  GeburaRepo._init(
    Box<String> appSettings,
    Box<String> importedSteamApps,
  ) {
    _importedSteamApps = importedSteamApps;
    _appSettings = appSettings;
  }

  static Future<GeburaRepo> init(String? path) async {
    final appSettings =
        await Hive.openBox<String>(_appSettingsFile, path: path);
    final importedSteamApps =
        await Hive.openBox<String>(_importedSteamAppsFile, path: path);
    return GeburaRepo._init(appSettings, importedSteamApps);
  }

  Future<void> setAppLauncherSetting(AppLauncherSetting setting) async {
    await _appSettings.put(
      setting.appID.toString(),
      jsonEncode(setting.toJson()),
    );
  }

  AppLauncherSetting? getAppLauncherSetting(int appID) {
    final setting = _appSettings.get(appID.toString());
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
}
