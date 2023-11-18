import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

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

const settingBoxKey = 'setting';
const yesodCacheBoxKey = 'yesodCache';
const appLauncherSettingsBoxKey = 'appLauncherSettings';

const List<ServerConfig> newServerList = [
  ServerConfig('theam-grpc.gyx.moe', 443, true, name: 'cf 代理'),
  ServerConfig('theam-grpc.gyx1.cn', 443, true, name: '直连'),
  ServerConfig('theam-grpc-rp.gyx1.cn', 443, true, name: 'rp1'),
  ServerConfig('theam-grpc-rp2.gyx1.cn', 443, true, name: 'rp2'),
];

class ServerConfig {
  final String host;
  final int port;
  final bool tls;
  final String name;

  const ServerConfig(this.host, this.port, this.tls, {this.name = ''});
}
