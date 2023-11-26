part of 'main.dart';

final GetIt getIt = GetIt.instance;

Future<MyApp> init() async {
  // dao

  // https://github.com/hivedb/hive/issues/1044
  if (PlatformHelper.isWeb()) {
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

  // repo
  getIt.registerLazySingleton<YesodRepo>(
      () => YesodRepo(getIt(instanceName: yesodCacheBoxKey)));
  getIt.registerLazySingleton<GeburaRepo>(
      () => GeburaRepo(getIt(instanceName: appLauncherSettingsBoxKey)));
  final common = await ClientCommonRepo.init();

  // bloc
  final userBloc = UserBloc(common);
  getIt.registerSingleton<UserBloc>(userBloc);
  final appSettingBloc = AppSettingBloc(common);
  getIt.registerSingleton<AppSettingBloc>(appSettingBloc);

  // api
  final api = ApiHelper();
  getIt.registerSingleton<ApiHelper>(api);

  // router
  final router = getRouter(userBloc, api);

  return MyApp(router, userBloc, appSettingBloc);
}
