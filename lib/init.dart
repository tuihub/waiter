part of 'main.dart';

Future<MyApp> init() async {
  // dao

  // https://github.com/hivedb/hive/issues/1044
  final path = PlatformHelper.isWeb()
      ? null
      : (await getApplicationSupportDirectory()).path;
  await Hive.initFlutter(path);

  // repo
  final yesodRepo = await YesodRepo.init(path);
  final geburaRepo = await GeburaRepo.init(path);
  final common = await ClientCommonRepo.init();

  // api
  final api = ApiHelper();

  // bloc
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }
  final tipherethBloc = TipherethBloc(api, common);
  final clientSettingBloc = ClientSettingBloc(common);
  final geburaBloc = GeburaBloc(api, geburaRepo);
  final yesodBloc = YesodBloc(api, yesodRepo);
  final chesedBloc = ChesedBloc(api);

  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final mainBloc = MainBloc(
    clientSettingBloc,
    tipherethBloc,
    geburaBloc,
    yesodBloc,
    chesedBloc,
    packageInfo,
  );

  // router
  final router = getRouter(mainBloc, api);

  return MyApp(router, mainBloc);
}
