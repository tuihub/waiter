import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'route.dart';

const clientSourceCodeUrl = 'github.com/tuihub/waiter';

class App {
  final ModuleName name;
  final IconData icon;

  App(this.name, this.icon);
}

final moduleList = [
  // App('Home', Icons.home, const HomePage()),
  App(ModuleName.gebura, Icons.casino),
  App(ModuleName.yesod, Icons.rss_feed),
  App(ModuleName.chesed, Icons.photo_album),
  // App('Ffi', Icons.timelapse, const FfiTestPage()),
];

final moduleMap = Map.fromEntries(moduleList.map((e) => MapEntry(e.name, e)));

const appDefaultAccentColor = Color.fromARGB(255, 255, 145, 0);
// const AppBackgroudColor = Color.fromARGB(255, 32, 34, 37);

class AppTheme {
  const AppTheme(this.name, this.scheme, this.index);

  final String name;
  final FlexScheme scheme;
  final int index;
}

const themeData = [
  AppTheme(
    'M3',
    FlexScheme.materialBaseline,
    0,
  ),
  AppTheme(
    '樱花',
    FlexScheme.sakura,
    1,
  ),
];

class DotEnvValue {
  final String? value;

  DotEnvValue._(this.value);

  static String winClientDownloadUrl =
      dotenv.env['WIN_CLIENT_DOWNLOAD_PATH'] ?? '';
  static String andClientDownloadUrl =
      dotenv.env['AND_CLIENT_DOWNLOAD_PATH'] ?? '';
}
