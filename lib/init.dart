part of 'main.dart';

Future<MyApp> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RustLib.init();
  final packageInfo = await PackageInfo.fromPlatform();

  // https://github.com/hivedb/hive/issues/1044
  late String? dataPath;
  if (PlatformHelper.isWeb()) {
    dataPath = null;
  } else if (PlatformHelper.isWindowsApp() && !kDebugMode) {
    dataPath =
        path.join(path.dirname(Platform.resolvedExecutable), 'data', 'run');
  } else {
    dataPath = (await getApplicationSupportDirectory()).path;
  }

  // dotenv
  var enableSentry = false;
  if ((!PlatformHelper.isWeb()) &&
      File(path.join(dataPath ?? '', '.enable_sentry')).existsSync()) {
    enableSentry = true;
  }
  if (packageInfo.version.contains('dev') ||
      packageInfo.version.contains('alpha')) {
    enableSentry = true;
  }
  if (enableSentry) {
    await dotenv.load(mergeWith: {
      'ENABLE_SENTRY': enableSentry.toString(),
    });
  } else {
    await dotenv.load();
  }

  // proxy
  await applySystemProxy();

  // dao
  await SentryHive.initFlutter(dataPath);

  // repo
  final common = await ClientCommonRepo.init();

  // api
  final api = ApiHelper();

  // system tray
  await _initSystemTray();

  // deep link
  if (PlatformHelper.isWindowsApp()) {
    await registerProtocol('tuihub');
  }

  // bloc
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }
  final clientSettingBloc = ClientSettingBloc(common);
  final deepLinkBloc = DeepLinkBloc(null);
  final mainBloc = MainBloc(
      api, common, clientSettingBloc, deepLinkBloc, packageInfo, dataPath);

  // router
  final router = getRouter(mainBloc, api);

  return MyApp(router, mainBloc);
}

Future<void> _initSystemTray() async {
  if (!PlatformHelper.isWindowsApp()) {
    return;
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
