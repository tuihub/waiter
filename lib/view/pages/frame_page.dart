import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/client_setting/client_setting_bloc.dart';
import '../../consts.dart';
import '../../route.dart';
import '../helper/connection.dart';
import '../layout/bootstrap_breakpoints.dart';
import '../layout/overlapping_panels.dart';
import '../specialized/title_bar.dart';
import '../universal/universal.dart';
import 'server_select_overlay.dart';

const double restWidth = 36;
const double gapWidth = 8;
const double navWidth = 0;
const double defaultLeftPartWidth = 256;

class AppFramePage extends StatefulWidget {
  const AppFramePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppFramePage> createState() => AppFramePageState();
}

class AppFramePageState extends State<AppFramePage> {
  @override
  void initState() {
    super.initState();
    final offlineAllowedModules = <ModuleName>{
      ModuleName.tiphereth,
      ModuleName.gebura,
      ModuleName.settings,
    };
    if (ConnectionHelper.isLocal(context)) {
      _allowedModules = moduleList
          .where((e) => offlineAllowedModules.contains(e.name))
          .toList();
    } else {
      _allowedModules = moduleList;
    }
    _selectedNavIndex = 0;
  }

  late List<App> _allowedModules;
  late int _selectedNavIndex;

  void _onSelectedNav(int index) {
    ServerSelectOverlay.of(context)?.hide();
    _allowedModules[index].go(context);
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSettingBloc, ClientSettingState>(
      buildWhen: (previous, current) =>
          previous.useFluentUI != current.useFluentUI,
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.biggest.width;
            final compact = width <= BootstrapBreakpoints.md;
            final design = UniversalUI.of(context).design;
            final title =
                Text('TuiHub', style: Theme.of(context).textTheme.titleMedium);

            switch (design) {
              case UIDesign.material:
                if (compact) {
                  return Scaffold(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: TitleBar.height,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: title,
                        ),
                        Expanded(child: widget.child),
                      ],
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: _selectedNavIndex,
                      onTap: _onSelectedNav,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        for (final module in _allowedModules)
                          BottomNavigationBarItem(
                            icon: Icon(module.icon),
                            label: module.name.toString().split('.').last,
                          ),
                      ],
                    ),
                  );
                }
                return Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: TitleBar.height,
                          alignment: Alignment.bottomCenter,
                          child: title,
                        ),
                        Expanded(
                          child: NavigationRail(
                            selectedIndex: _selectedNavIndex,
                            onDestinationSelected: _onSelectedNav,
                            groupAlignment: 0,
                            labelType: NavigationRailLabelType.selected,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            destinations: [
                              for (final module in _allowedModules)
                                NavigationRailDestination(
                                  icon: Icon(module.icon),
                                  label: Text(
                                      module.name.toString().split('.').last),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: TitleBar.height),
                        child: widget.child,
                      ),
                    ),
                  ],
                );
              case UIDesign.fluent:
                return fluent.NavigationView(
                  appBar: fluent.NavigationAppBar(
                    title: title,
                    automaticallyImplyLeading: false,
                  ),
                  pane: fluent.NavigationPane(
                    selected: _selectedNavIndex,
                    onItemPressed: _onSelectedNav,
                    displayMode: compact
                        ? fluent.PaneDisplayMode.top
                        : fluent.PaneDisplayMode.compact,
                    toggleable: false,
                    items: [
                      for (final module in _allowedModules)
                        fluent.PaneItem(
                          icon: Icon(module.icon),
                          title: Text(module.name.toString().split('.').last),
                          onTap: () {
                            ServerSelectOverlay.of(context)?.hide();
                            module.go(context);
                          },
                          body: Container(),
                        ),
                    ],
                  ),
                  paneBodyBuilder: (context, child) => widget.child,
                );
            }
          },
        );
      },
    );
  }
}

class ModuleFramePage extends StatefulWidget {
  const ModuleFramePage({
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

  static ModuleFramePageState? of(BuildContext context) {
    return context.findAncestorStateOfType<ModuleFramePageState>();
  }

  @override
  State<StatefulWidget> createState() => ModuleFramePageState();
}

class ModuleFramePageState extends State<ModuleFramePage> {
  final GlobalKey<ScaffoldState> _frameScaffold = GlobalKey();
  final GlobalKey<OverlappingPanelsState> _overlappingPanelsKey = GlobalKey();

  void openDrawer() {
    _frameScaffold.currentState?.openEndDrawer();
    _overlappingPanelsKey.currentState?.reveal(RevealSide.right);
  }

  void closeDrawer() {
    _frameScaffold.currentState?.closeEndDrawer();
    _overlappingPanelsKey.currentState?.reveal(RevealSide.main);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.biggest.width;

        Widget content = widget.middlePart != null
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: gapWidth),
                    child: Material(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: widget.leftPartWidth != null
                            ? widget.leftPartWidth! - navWidth
                            : defaultLeftPartWidth,
                        child: widget.leftPart,
                      ),
                    ),
                  ),
                  Expanded(child: widget.middlePart!),
                ],
              )
            : widget.leftPart;

        if (width <= BootstrapBreakpoints.md) {
          content = widget.middlePart != null
              ? OverlappingPanels(
                  key: _overlappingPanelsKey,
                  restWidth: restWidth,
                  gestureRight: widget.gestureRight,
                  left: Material(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: width - navWidth - gapWidth - restWidth,
                      child: widget.leftPart,
                    ),
                  ),
                  main: DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: UniversalUI.of(context).defaultBorderRadius,
                    ),
                    child: widget.middlePart,
                  ),
                  right: widget.rightPart != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: width - gapWidth - restWidth,
                            child: widget.rightPart,
                          ),
                        )
                      : null,
                )
              : OverlappingPanels(
                  key: _overlappingPanelsKey,
                  gestureRight: widget.gestureRight,
                  main: SizedBox(
                    width: width - navWidth,
                    child: widget.leftPart,
                  ),
                  right: widget.rightPart != null
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: width - gapWidth - restWidth,
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
