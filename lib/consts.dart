import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'model/common_model.dart';
import 'route.dart';

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

const List<ServerConfig> newServerList = [
  ServerConfig('theam-grpc.gyx.moe', 443, true, 'cf 代理'),
  ServerConfig('theam-grpc.gyx1.cn', 443, true, '直连'),
  ServerConfig('theam-grpc-rp.gyx1.cn', 443, true, 'rp1'),
  ServerConfig('theam-grpc-rp2.gyx1.cn', 443, true, 'rp2'),
];
