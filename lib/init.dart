part of 'main.dart';

Future<MyApp> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();

  // https://github.com/hivedb/hive/issues/1044
  late String? dataPath;
  if (PlatformHelper.isWeb()) {
    dataPath = null;
  } else if (PlatformHelper.isWindowsApp() && !kDebugMode) {
    dataPath = path.join(path.dirname(Platform.resolvedExecutable), 'data');
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
    registerProtocol('tuihub');
  }
  Uri? initialUri;
  try {
    initialUri = await getInitialUri();
  } on FormatException {
    // TODO: warn user
  }

  // bloc
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: dataPath == null ? Directory('') : Directory(dataPath),
  );
  final deviceInfo = await _genClientDeviceInfo();
  final clientSettingBloc = ClientSettingBloc(common);
  final deepLinkBloc = DeepLinkBloc(initialUri);
  final mainBloc = MainBloc(api, common, clientSettingBloc, deepLinkBloc,
      packageInfo, deviceInfo, dataPath);

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

Future<ClientDeviceInfo> _genClientDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  if (PlatformHelper.isAndroidApp()) {
    final androidInfo = await deviceInfo.androidInfo;
    return ClientDeviceInfo(androidInfo.model, androidInfo.version.release);
  } else if (PlatformHelper.isWindowsApp()) {
    final windowsInfo = await deviceInfo.windowsInfo;
    return ClientDeviceInfo(
      windowsInfo.computerName,
      '${windowsInfo.productName} ${windowsInfo.displayVersion}',
    );
  } else if (PlatformHelper.isWeb()) {
    final webInfo = await deviceInfo.webBrowserInfo;
    return ClientDeviceInfo(
      webInfo.browserName.toString(),
      webInfo.appVersion.toString(),
    );
  } else {
    return const ClientDeviceInfo('unknown', 'unknown');
  }
}
