import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../consts.dart';
import '../widgets/actions/theme_mode_toggle.dart';
import '../widgets/bootstrap/layout.dart';
import '../widgets/nav_rail.dart';
import '../widgets/title_bar.dart';

class FramePage extends StatelessWidget {
  const FramePage({
    super.key,
    required this.selectedNav,
    required this.leftPart,
    this.rightPart,
    this.onRight = false,
    this.leftPartWidth,
  });

  final String selectedNav;
  final Widget leftPart;
  final Widget? rightPart;
  final bool onRight;
  final double? leftPartWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TitleBar(
            actions: [ThemeModeToggle()],
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.biggest.width;

                final stackView =
                    rightPart != null && width < BootstrapBreakpoints.md;

                final scrollController = ScrollController();

                return WillPopScope(
                  child: Scaffold(
                    body: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (notification is ScrollEndNotification) {
                          if (scrollController.offset * 2 >
                              scrollController.position.maxScrollExtent) {
                            scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          } else {
                            scrollController.animateTo(0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          }
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        // physics: const NeverScrollableScrollPhysics(),
                        controller: scrollController,
                        child: SizedBox(
                          width: stackView ? width * 2 - 64 : width,
                          child: Row(
                            children: [
                              _Nav(selectedNav: selectedNav),
                              SizedBox(
                                width: stackView
                                    ? width - 128
                                    : leftPartWidth != null
                                        ? min(leftPartWidth!, (width - 64) / 2)
                                        : (width - 64) / 2,
                                child: leftPart,
                              ),
                              if (rightPart != null)
                                Expanded(
                                  child: rightPart!,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onWillPop: () async {
                    scrollController.jumpTo(0);
                    return false;
                  },
                );
              },
            ),
          ),
        ],
      ),
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
