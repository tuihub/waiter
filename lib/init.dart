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

  // repo
  final yesodRepo =
      await YesodRepo.init((await getApplicationSupportDirectory()).path);
  final geburaRepo =
      await GeburaRepo.init((await getApplicationSupportDirectory()).path);
  final common = await ClientCommonRepo.init();

  // api
  final api = ApiHelper();
  getIt.registerSingleton<ApiHelper>(api);

  // bloc
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }
  final tipherethBloc = TipherethBloc(api, common);
  final clientSettingBloc = ClientSettingBloc(common);
  final geburaBloc = GeburaBloc(api, geburaRepo);
  final yesodBloc = YesodBloc(api, yesodRepo);

  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final mainBloc = MainBloc(
    clientSettingBloc,
    tipherethBloc,
    geburaBloc,
    yesodBloc,
    packageInfo,
  );

  // router
  final router = getRouter(mainBloc, api);

  return MyApp(router, mainBloc);
}
