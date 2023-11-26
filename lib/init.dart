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

  getIt.registerSingleton<Box<Object>>(settingBox, instanceName: settingBoxKey);
  getIt.registerSingleton<Box<String>>(yesodCacheBox,
      instanceName: yesodCacheBoxKey);

  // repo
  getIt.registerLazySingleton<YesodRepo>(
      () => YesodRepo(getIt(instanceName: yesodCacheBoxKey)));
  final geburaRepo =
      await GeburaRepo.init((await getApplicationSupportDirectory()).path);
  final common = await ClientCommonRepo.init();

  // api
  final api = ApiHelper();
  getIt.registerSingleton<ApiHelper>(api);

  // bloc
  final userBloc = UserBloc(common);
  getIt.registerSingleton<UserBloc>(userBloc);
  final appSettingBloc = AppSettingBloc(common);
  getIt.registerSingleton<AppSettingBloc>(appSettingBloc);
  final geburaBloc = GeburaBloc(api, geburaRepo);

  // router
  final router = getRouter(userBloc, geburaBloc, api);

  return MyApp(router, userBloc, appSettingBloc);
}
