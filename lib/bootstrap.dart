import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/app_setting/app_setting_bloc.dart';
import 'bloc/user_login/user_bloc.dart';
import 'common/api/api_helper.dart';
import 'common/util/rss_util.dart';
import 'consts.dart';
import 'repo/gebura/gebura_repo.dart';
import 'repo/yesod/yesod_repo.dart';
import 'route.dart';
import 'store/setting_dao.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  // dao

  // https://github.com/hivedb/hive/issues/1044
  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    await Hive.initFlutter((await getApplicationSupportDirectory()).path);
  }

  final settingBox = await Hive.openBox<Object>(settingBoxKey);
  final yesodCacheBox = await Hive.openBox<String>(yesodCacheBoxKey);
  final appLauncherSettingsBox =
      await Hive.openBox<Object>(appLauncherSettingsBoxKey);

  getIt.registerSingleton<Box<Object>>(settingBox, instanceName: settingBoxKey);
  getIt.registerSingleton<Box<String>>(yesodCacheBox,
      instanceName: yesodCacheBoxKey);
  getIt.registerSingleton<Box<Object>>(appLauncherSettingsBox,
      instanceName: appLauncherSettingsBoxKey);
  getIt.registerSingleton(SettingDao(getIt(instanceName: settingBoxKey)));

  // repo
  getIt.registerLazySingleton<YesodRepo>(
      () => YesodRepo(getIt(instanceName: yesodCacheBoxKey)));
  getIt.registerLazySingleton<GeburaRepo>(
      () => GeburaRepo(getIt(instanceName: appLauncherSettingsBoxKey)));

  // bloc
  getIt.registerSingleton<UserBloc>(UserBloc(getIt()));
  getIt.registerSingleton<AppSettingBloc>(AppSettingBloc(getIt()));

  // router
  getIt.registerSingleton<GoRouter>(getRouter());

  // util
  getIt.registerSingleton<AbstractContentFormatter>(RssContentFormatter());

  // api
  getIt.registerSingleton<ApiHelper>(ApiHelper());
}
