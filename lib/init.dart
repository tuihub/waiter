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
  final tipherethBloc = TipherethBloc(api, common);
  final clientSettingBloc = ClientSettingBloc(common);
  final geburaBloc = GeburaBloc(api, geburaRepo);
  final yesodBloc = YesodBloc(api);

  final mainBloc = MainBloc(
    clientSettingBloc,
    tipherethBloc,
    geburaBloc,
    yesodBloc,
  );

  // router
  final router = getRouter(mainBloc, api);

  return MyApp(router, mainBloc);
}
