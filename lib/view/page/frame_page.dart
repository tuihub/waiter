import 'package:flutter/material.dart';
import 'package:waitress/view/page/gebura/gebura_home_page.dart';
import 'package:waitress/view/page/home_page.dart';
import 'package:waitress/view/page/tiphereth/user_manage_page.dart';
import 'package:waitress/view/page/yesod/yesode_home_page.dart';
import 'package:waitress/view/widget/nav_rail.dart';
import 'package:waitress/view/widget/title_bar.dart';

const mainList = ['Home', 'Gebura', 'Tiphereth', 'Yesod'];

const icons = <String, IconData>{
  'Home': Icons.home,
  'Login': Icons.face,
  'Setting': Icons.settings,
  'Gebura': Icons.casino,
  'Tiphereth': Icons.manage_accounts,
  'Yesod': Icons.rss_feed,
};

class FramePage extends StatefulWidget {
  FramePage({super.key});

  final pageMap = <String, Widget>{
    'Home': HomePage(),
    'Gebura': GeburaHome(),
    'Tiphereth': UserManagePage(),
    'Yesod': YesodHome(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(),
          Expanded(
            child: Scaffold(
              body: Row(
                children: [
                  NavRail(children: [
                    for (var pageName in mainList)
                      IconMenuItem(
                        icon: icons[pageName]!,
                        selected: pageName == selectedNav,
                        onPressed: () {
                          setState(
                            () {
                              selectedNav = pageName;
                            },
                          );
                        },
                      )
                  ]),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(),
                        padding: EdgeInsets.only(left: 8, top: 8),
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
