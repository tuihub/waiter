import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'route.dart';

const clientSourceCodeUrl = 'github.com/tuihub/waiter';

class App {
  final ModuleName name;
  final IconData icon;
  void Function(BuildContext context) go;

  App(this.name, this.icon, this.go);
}

final moduleList = [
  // App('Home', Icons.home, const HomePage()),
  App(ModuleName.gebura, Icons.casino, (context){const GeburaRootRoute().go(context);}),
  App(ModuleName.yesod, Icons.rss_feed, (context){const YesodRootRoute().go(context);}),
  // App(ModuleName.chesed, Icons.photo_album),
  // App('Ffi', Icons.timelapse, const FfiTestPage()),
];

final moduleMap = Map.fromEntries(moduleList.map((e) => MapEntry(e.name, e)));

const appDefaultAccentColor = Color.fromARGB(255, 255, 145, 0);
// const AppBackgroudColor = Color.fromARGB(255, 32, 34, 37);

class AppTheme {
  const AppTheme(this.name, this.scheme);

  final String name;
  final FlexScheme scheme;
}

const themeData = [
  AppTheme(
    'default',
    FlexScheme.materialBaseline,
  ),
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
