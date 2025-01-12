import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:universal_ui/universal_ui.dart';

import 'route.dart';

const clientSourceCodeUrl = 'github.com/tuihub/waiter';

class Module {
  final ModuleName name;
  IconData Function(BuildContext context) icon;
  void Function(BuildContext context) go;

  Module(this.name, this.icon, this.go);
}

final modules = [
  Module(ModuleName.tiphereth, (context) {
    return UniversalUI.of(context).icons.tiphereth;
  }, (context) {
    const TipherethRootRoute().go(context);
  }),
  Module(ModuleName.yesod, (context) {
    return UniversalUI.of(context).icons.yesod;
  }, (context) {
    const YesodRootRoute().go(context);
  }),
  Module(ModuleName.gebura, (context) {
    return UniversalUI.of(context).icons.gebura;
  }, (context) {
    const GeburaRootRoute().go(context);
  }),
  Module(ModuleName.chesed, (context) {
    return UniversalUI.of(context).icons.chesed;
  }, (context) {
    const ChesedRootRoute().go(context);
  }),
  Module(ModuleName.notification, (context) {
    return UniversalUI.of(context).icons.notification;
  }, (context) {
    const NotificationRootRoute().go(context);
  }),
  Module(ModuleName.settings, (context) {
    return UniversalUI.of(context).icons.settings;
  }, (context) {
    const SettingsRootRoute().go(context);
  }),
];

final moduleMap = Map.fromEntries(modules.map((e) => MapEntry(e.name, e)));

final offlineAllowedModules = [
  ModuleName.tiphereth,
  ModuleName.gebura,
  ModuleName.settings,
];

const appDefaultAccentColor = Color.fromARGB(255, 255, 145, 0);
// const AppBackgroudColor = Color.fromARGB(255, 32, 34, 37);

class AppTheme {
  const AppTheme(this.name, this.scheme);

  final String name;
  final FlexScheme scheme;

  static const defaultTheme = AppTheme('default', FlexScheme.materialBaseline);
}

const themeData = [
  AppTheme.defaultTheme,
  AppTheme(
    'verdun hemlock',
    FlexScheme.verdunHemlock,
  ),
  AppTheme(
    'dell genoa',
    FlexScheme.dellGenoa,
  ),
  AppTheme(
    'red',
    FlexScheme.redM3,
  ),
  AppTheme(
    'pink',
    FlexScheme.pinkM3,
  ),
  AppTheme(
    'purple',
    FlexScheme.purpleM3,
  ),
  AppTheme(
    'indigo',
    FlexScheme.indigoM3,
  ),
  AppTheme(
    'blue',
    FlexScheme.blueM3,
  ),
  AppTheme(
    'cyan',
    FlexScheme.cyanM3,
  ),
  AppTheme(
    'teal',
    FlexScheme.tealM3,
  ),
  AppTheme(
    'green',
    FlexScheme.greenM3,
  ),
  AppTheme(
    'lime',
    FlexScheme.limeM3,
  ),
  AppTheme(
    'yellow',
    FlexScheme.yellowM3,
  ),
  AppTheme(
    'orange',
    FlexScheme.orangeM3,
  ),
  AppTheme(
    'deep orange',
    FlexScheme.deepOrangeM3,
  ),
];

class DotEnvValue {
  final String? value;

  DotEnvValue._(this.value);

  static String winClientDownloadUrl =
      dotenv.env['WIN_CLIENT_DOWNLOAD_PATH'] ?? '';
  static String andClientDownloadUrl =
      dotenv.env['AND_CLIENT_DOWNLOAD_PATH'] ?? '';
  static String host = dotenv.env['HOST'] ?? '';
  static String port = dotenv.env['PORT'] ?? '';
  static String tls = dotenv.env['TLS'] ?? '';
  static String enableSentry = dotenv.env['ENABLE_SENTRY'] ?? '';
}

const wellKnownAccountPlatforms = ['steam'];
