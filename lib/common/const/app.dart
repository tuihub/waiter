import 'package:flutter/material.dart';
import 'package:waitress/view/page/ffi_test_page.dart';
import 'package:waitress/view/page/gebura/gebura_home_page.dart';
import 'package:waitress/view/page/home_page.dart';
import 'package:waitress/view/page/setting_page.dart';
import 'package:waitress/view/page/tiphereth/user_manage_page.dart';
import 'package:waitress/view/page/yesod/yesode_home_page.dart';

class App {
  final String name;
  final IconData icon;
  final Widget page;

  App(this.name, this.icon, this.page);
}

final appList = [
  App('Home', Icons.home, HomePage()),
  App('Gebura', Icons.casino, GeburaHome()),
  App('Tiphereth', Icons.manage_accounts, UserManagePage()),
  App('Yesod', Icons.rss_feed, SizedBox()),
  App('Ffi', Icons.timelapse, FfiTestPage()),
];

final appMap = Map.fromEntries(appList.map((e) => MapEntry(e.name, e)));
