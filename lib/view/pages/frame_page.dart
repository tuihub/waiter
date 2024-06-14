import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../route.dart';
import '../layout/bootstrap_breakpoints.dart';
import '../layout/overlapping_panels.dart';
import '../specialized/nav_rail.dart';
import 'server_select_overlay.dart';

class FramePage extends StatefulWidget {
  const FramePage({
    super.key,
    required this.selectedNav,
    required this.leftPart,
    this.leftPartWidth,
    this.middlePart,
    this.rightPart,
    this.rightPartWidth,
    this.gestureRight = true,
  });

  final ModuleName selectedNav;
  final Widget leftPart;
  final double? leftPartWidth;
  final Widget? middlePart;
  final Widget? rightPart;
  final double? rightPartWidth;
  final bool gestureRight;

  static FramePageState? of(BuildContext context) {
    return context.findAncestorStateOfType<FramePageState>();
  }

  @override
  State<StatefulWidget> createState() => FramePageState();
}

class FramePageState extends State<FramePage> {
  void openDrawer() {
    _frameScaffold.currentState?.openEndDrawer();
    _overlappingPanelsKey.currentState?.reveal(RevealSide.right);
  }

  void closeDrawer() {
    _frameScaffold.currentState?.closeEndDrawer();
    _overlappingPanelsKey.currentState?.reveal(RevealSide.main);
  }

  final GlobalKey<ScaffoldState> _frameScaffold = GlobalKey();
  final GlobalKey<OverlappingPanelsState> _overlappingPanelsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const double restWidth = 40;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.biggest.width;

        Widget content = widget.middlePart != null
            ? Row(
                children: [
                  _Nav(selectedNav: widget.selectedNav),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Material(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: widget.leftPartWidth != null
                            ? widget.leftPartWidth! - 64
                            : 256,
                        child: widget.leftPart,
                      ),
                    ),
                  ),
                  Expanded(child: widget.middlePart!),
                ],
              )
            : Row(
                children: [
                  _Nav(selectedNav: widget.selectedNav),
                  Expanded(child: widget.leftPart),
                ],
              );

        if (width <= BootstrapBreakpoints.md) {
          content = widget.middlePart != null
              ? OverlappingPanels(
                  key: _overlappingPanelsKey,
                  restWidth: restWidth,
                  gestureRight: widget.gestureRight,
                  left: Row(
                    children: [
                      _Nav(selectedNav: widget.selectedNav),
                      Material(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: width - 64 - restWidth,
                          child: widget.leftPart,
                        ),
                      ),
                    ],
                  ),
                  main: DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: widget.middlePart,
                  ),
                  right: widget.rightPart != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: width - 8 - restWidth,
                            child: widget.rightPart,
                          ),
                        )
                      : null,
                )
              : OverlappingPanels(
                  key: _overlappingPanelsKey,
                  gestureRight: widget.gestureRight,
                  main: Row(
                    children: [
                      _Nav(selectedNav: widget.selectedNav),
                      SizedBox(
                        width: width - 64,
                        child: widget.leftPart,
                      ),
                    ],
                  ),
                  right: widget.rightPart != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: width - 8 - restWidth,
                            child: widget.rightPart,
                          ),
                        )
                      : null,
                );
        }

        return Scaffold(
          key: _frameScaffold,
          body: content,
          endDrawer: width > BootstrapBreakpoints.md && widget.rightPart != null
              ? Drawer(
                  width: widget.rightPartWidth ?? 512,
                  child: SafeArea(
                    maintainBottomViewPadding: true,
                    child: widget.rightPart!,
                  ),
                )
              : null,
        );
      },
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav({required this.selectedNav});

  final ModuleName selectedNav;

  @override
  Widget build(BuildContext context) {
    return NavRail(
      leading: [
        IconMenuItem(
          icon: Icons.account_circle_sharp,
          selected: ModuleName.tiphereth == selectedNav,
          onPressed: () {
            ServerSelectOverlay.of(context)?.minimize();
            const TipherethRootRoute().go(context);
          },
        ),
      ],
      body: [
        for (final module in moduleList)
          IconMenuItem(
            icon: module.icon,
            selected: module.name == selectedNav,
            onPressed: () {
              ServerSelectOverlay.of(context)?.hide();
              module.go(context);
            },
          ),
      ],
      trailing: [
        IconMenuItem(
          icon: Icons.notifications,
          selected: ModuleName.notification == selectedNav,
          onPressed: () {
            ServerSelectOverlay.of(context)?.hide();
            const NotificationRootRoute().go(context);
          },
        ),
        IconMenuItem(
          icon: Icons.settings,
          selected: ModuleName.settings == selectedNav,
          onPressed: () {
            ServerSelectOverlay.of(context)?.hide();
            const SettingsRootRoute().go(context);
          },
        ),
      ],
    );
  }
}
