import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/util/platform.dart';
import '../../consts.dart';
import '../layout/overlapping_panels.dart';
import '../specialized/nav_rail.dart';
import '../specialized/theme_mode_toggle.dart';
import '../specialized/title_bar.dart';

class FramePage extends StatelessWidget {
  const FramePage({
    super.key,
    required this.selectedNav,
    required this.leftPart,
    this.rightPart,
    this.leftPartWidth,
  });

  final String selectedNav;
  final Widget leftPart;
  final Widget? rightPart;
  final double? leftPartWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.biggest.width;

        Widget content = rightPart != null
            ? Row(
                children: [
                  _Nav(selectedNav: selectedNav),
                  SizedBox(
                    width: leftPartWidth != null ? leftPartWidth! - 64 : 256,
                    child: leftPart,
                  ),
                  Expanded(child: rightPart!),
                ],
              )
            : Row(
                children: [
                  _Nav(selectedNav: selectedNav),
                  Expanded(child: leftPart),
                ],
              );

        if (PlatformHelper.isWeb()) {
          content = rightPart != null
              ? OverlappingPanels(
                  left: Row(
                    children: [
                      _Nav(selectedNav: selectedNav),
                      SizedBox(
                        width: width - 128,
                        child: leftPart,
                      ),
                    ],
                  ),
                  main: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: rightPart,
                  ),
                )
              : OverlappingPanels(
                  main: Row(
                    children: [
                      _Nav(selectedNav: selectedNav),
                      SizedBox(
                        width: width - 64,
                        child: leftPart,
                      ),
                    ],
                  ),
                );
        }

        return Scaffold(
          body: Column(
            children: [
              const TitleBar(
                actions: [ThemeModeToggle()],
              ),
              Expanded(
                child: content,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav({required this.selectedNav});

  final String selectedNav;

  @override
  Widget build(BuildContext context) {
    return NavRail(
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
    );
  }
}
