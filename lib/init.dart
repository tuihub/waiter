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
  final netzachBloc = NetzachBloc(api);

  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  await initSystemTray();
  final mainBloc = MainBloc(
    clientSettingBloc,
    tipherethBloc,
    geburaBloc,
    yesodBloc,
    chesedBloc,
    netzachBloc,
    packageInfo,
  );

  // router
  final router = getRouter(mainBloc, api);

  return MyApp(router, mainBloc);
}

Future<void> initSystemTray() async {
  if (!PlatformHelper.isWindowsApp()) {
    return null;
  }
  const String path = 'windows/runner/resources/app_icon.ico';

  final AppWindow appWindow = AppWindow();
  final SystemTray systemTray = SystemTray();

  // We first init the systray menu
  await systemTray.initSystemTray(
    title: 'system tray',
    iconPath: path,
  );

  // create context menu
  final Menu menu = Menu();
  await menu.buildFrom([
    MenuItemLabel(label: 'Show', onClicked: (menuItem) => appWindow.show()),
    MenuItemLabel(label: 'Hide', onClicked: (menuItem) => appWindow.hide()),
    MenuItemLabel(label: 'Exit', onClicked: (menuItem) => appWindow.close()),
  ]);

  // set context menu
  await systemTray.setContextMenu(menu);

  // handle system tray event
  systemTray.registerSystemTrayEventHandler((eventName) {
    debugPrint('eventName: $eventName');
    if (eventName == kSystemTrayEventClick) {
      PlatformHelper.isWindows()
          ? appWindow.show()
          : systemTray.popUpContextMenu();
    } else if (eventName == kSystemTrayEventRightClick) {
      PlatformHelper.isWindows()
          ? systemTray.popUpContextMenu()
          : appWindow.show();
    }
  });
}
