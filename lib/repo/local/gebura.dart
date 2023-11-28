import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/gebura_model.dart';

const _appSettingsFile = 'gebura_app_settings';

class GeburaRepo {
  late Box<String> _appSettings;

  GeburaRepo._init(Box<String> box) {
    _appSettings = box;
  }

  static Future<GeburaRepo> init(String? path) async {
    final box = await Hive.openBox<String>(_appSettingsFile, path: path);
    return GeburaRepo._init(box);
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
}
