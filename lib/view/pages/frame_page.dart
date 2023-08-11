import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../consts.dart';
import '../widgets/actions/theme_mode_toggle.dart';
import '../widgets/nav_rail.dart';
import '../widgets/title_bar.dart';

class FramePage extends StatelessWidget {
  const FramePage(
      {super.key, required this.innerPage, required this.selectedNav});

  final Widget innerPage;
  final String selectedNav;

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
                        selected: 'Tiphereth' == selectedNav,
                        onPressed: () {
                          GoRouter.of(context).go('/app/Tiphereth');
                        },
                      ),
                    ],
                    body: [
                      for (final app in appList)
                        IconMenuItem(
                          icon: app.icon,
                          selected: app.name == selectedNav,
                          onPressed: () {
                            GoRouter.of(context).go(
                              '/app/${app.name}',
                            );
                          },
                        ),
                    ],
                    trailing: [
                      IconMenuItem(
                        icon: Icons.settings,
                        selected: 'Settings' == selectedNav,
                        onPressed: () {
                          GoRouter.of(context).go('/app/Settings');
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: innerPage,
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
