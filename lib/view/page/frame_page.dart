import 'package:flutter/material.dart';
import 'package:waitress/view/page/home_page.dart';
import 'package:waitress/view/widget/nav_rail.dart';
import 'package:waitress/view/widget/title_bar.dart';

const mainList = ['Home', 'Gebura'];

const icons = <String, IconData>{
  'Home': Icons.home,
  'Login': Icons.face,
  'Setting': Icons.settings,
  'Gebura': Icons.casino,
};

class FramePage extends StatefulWidget {
  FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  String selectedNav = mainList.elementAt(0);

  final pageMap = <String, Widget>{
    'Home': HomePage(),
    'Gebura': HomePage(),
  };

  Widget? _getPage() {
    if (pageMap.containsKey(selectedNav)) {
      return pageMap[selectedNav];
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
                        selected: pageName == "Home",
                        onPressed: () {
                          setState(
                            () {
                              selectedNav = pageName;
                            },
                          );
                        },
                      )
                  ]),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 34, 37),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: _getPage(),
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
