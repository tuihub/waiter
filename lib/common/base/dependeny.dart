import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import '../repo/yesod/yesod_repo.dart';
import '../store/setting_dao.dart';

class AppDependency {
  late SettingDao settingDao;
  late YesodRepo yesodRepo;
  late Box yesodCacheBox;

  AppDependency._();

  /// the one and only instance of this singleton
  static final instance = AppDependency._();

  static void init(
      SettingDao settingDao, YesodRepo yesodRepo, Box yesodCacheBox) {
    instance.settingDao = settingDao;
    instance.yesodRepo = yesodRepo;
    instance.yesodCacheBox = yesodCacheBox;
  }
}
