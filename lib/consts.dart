import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'view/pages/chesed/chesed_home_page.dart';
import 'view/pages/ffi_test_page.dart';
import 'view/pages/home_page.dart';

class App {
  final String name;
  final IconData icon;
  final Widget page;

  App(this.name, this.icon, this.page);
}

final appList = [
  App('Home', Icons.home, const HomePage()),
  App('Gebura', Icons.casino, const SizedBox()),
  App('Yesod', Icons.rss_feed, const SizedBox()),
  App('Chesed', Icons.photo_album, ChesedHome()),
  App('Ffi', Icons.timelapse, const FfiTestPage()),
];

final appMap = Map.fromEntries(appList.map((e) => MapEntry(e.name, e)));

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
