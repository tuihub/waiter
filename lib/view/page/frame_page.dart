import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/view/page/ffi_test_page.dart';
import 'package:waitress/view/page/gebura/gebura_home_page.dart';
import 'package:waitress/view/page/home_page.dart';
import 'package:waitress/view/page/tiphereth/user_manage_page.dart';
import 'package:waitress/view/page/yesod/yesode_home_page.dart';
import 'package:waitress/view/widget/nav_rail.dart';
import 'package:waitress/view/widget/title_bar.dart';

import '../widget/actions/theme_mode_toggle.dart';
import 'setting_page.dart';

const mainList = ['Home', 'Gebura', 'Tiphereth', 'Yesod', 'Ffi'];

const icons = <String, IconData>{
  'Home': Icons.home,
  'Login': Icons.face,
  'Setting': Icons.settings,
  'Gebura': Icons.casino,
  'Tiphereth': Icons.manage_accounts,
  'Yesod': Icons.rss_feed,
  'Ffi': Icons.timelapse,
};

class FramePage extends StatefulWidget {
  FramePage({super.key});

  final pageMap = <String, Widget>{
    'Home': HomePage(),
    'Gebura': GeburaHome(),
    'Tiphereth': UserManagePage(),
    'Yesod': YesodHome(),
    'Ffi': FfiTestPage(),
    'Setting': SettingPage(),
  };

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  String selectedNav = mainList.elementAt(0);

  Widget? _getPage() {
    if (widget.pageMap.containsKey(selectedNav)) {
      return widget.pageMap[selectedNav];
    }
    return HomePage();
  }

  void _showPage(String pageName) {
    setState(
      () {
        selectedNav = pageName;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleBar(
            actions: [ThemeModeToggle()],
          ),
          Expanded(
            child: Scaffold(
              body: Row(
                children: [
                  NavRail(
                    leading: [
                      IconMenuItem(
                        icon: Icons.account_circle_sharp,
                        selected: false,
                        onPressed: () => {},
                      ),
                    ],
                    body: [
                      for (var pageName in mainList)
                        IconMenuItem(
                          icon: icons[pageName]!,
                          selected: pageName == selectedNav,
                          onPressed: () {
                            _showPage(pageName);
                          },
                        )
                    ],
                    trailing: [
                      IconMenuItem(
                        icon: Icons.settings,
                        selected: false,
                        onPressed: () => {_showPage("Setting")},
                      ),
                      IconMenuItem(
                        icon: Icons.logout,
                        selected: false,
                        onPressed: () {
                          context.read<UserBloc>().add(UserLogoutEvent());
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                      child: Ink(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            scaffoldBackgroundColor:
                                Theme.of(context).colorScheme.background,
                          ),
                          child: _getPage() ?? Ink(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
