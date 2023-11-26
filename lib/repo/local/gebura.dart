import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/gebura_model.dart';
import 'store/app_launcher_dao.dart';

class GeburaRepo {
  late AppLauncherDao _dao;

  GeburaRepo(Box<Object> box) {
    _dao = AppLauncherDao(box);
  }

  Future<void> saveLauncherSetting(AppLauncherSetting setting) async {
    await _dao.set(setting.appID.toString(), jsonEncode(setting.toJson()));
  }

  Future<AppLauncherSetting?> getLauncherSetting(int appID) async {
    final setting = _dao.get(appID.toString());
    if (setting != null && setting is String) {
      return AppLauncherSetting.fromJson(
          jsonDecode(setting) as Map<String, dynamic>);
    }
    return null;
  }
}
