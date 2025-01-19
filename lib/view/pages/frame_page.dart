import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../bloc/main_bloc.dart';
import '../../consts.dart';
import '../../route.dart';
import '../layout/bootstrap_breakpoints.dart';
import '../layout/overlapping_panels.dart';
import '../specialized/title_bar.dart';

const double restWidth = 36;
const double gapWidth = 8;
const double navWidth = 0;
const double defaultLeftPartWidth = 256;

class AppFramePage extends StatefulWidget {
  const AppFramePage({
    super.key,
    required this.child,
    required this.navigationShell,
  });

  final Widget child;
  final StatefulNavigationShell navigationShell;

  @override
  State<AppFramePage> createState() => AppFramePageState();
}

class AppFramePageState extends State<AppFramePage> {
  @override
  void initState() {
    super.initState();
    updateModules(context);
  }

  void updateModules(BuildContext context) {
    if (context.read<MainBloc>().state.isLocal) {
      _allowedModules = modules
          .where((e) => offlineAllowedModules.contains(e.name))
          .map((e) => e.name)
          .toList();
    } else {
      _allowedModules = modules.map((e) => e.name).toList();
    }
    _moduleIndexMap = Map.fromEntries(
      modules
          .map((e) => MapEntry(e.name.index, _allowedModules.indexOf(e.name))),
    );
    _navIndexMap = Map.fromEntries(
      _moduleIndexMap.entries.map((e) => MapEntry(e.value, e.key)),
    );
  }

  late List<ModuleName> _allowedModules;
  late Map<int, int> _moduleIndexMap;
  late Map<int, int> _navIndexMap;

  int _convNavIndex(int index) {
    if (_moduleIndexMap[index] != null) {
      if (_moduleIndexMap[index]! >= 0) {
        return _moduleIndexMap[index]!;
      }
    }
    return 0;
  }

  int _deConvNavIndex(int index) {
    if (_navIndexMap[index] != null) {
      if (_navIndexMap[index]! >= 0) {
        return _navIndexMap[index]!;
      }
    }
    return 0;
  }

  void _onSelectedNav(int index) {
    final moduleIndex = _deConvNavIndex(index);
    widget.navigationShell.goBranch(
      moduleIndex,
      initialLocation: moduleIndex == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        updateModules(context);
      },
      buildWhen: (previous, current) => previous.uiDesign != current.uiDesign,
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.biggest.width;
            final compact = width <= BootstrapBreakpoints.lg;
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
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                            child: Container(
                              key:
                                  ValueKey(widget.navigationShell.currentIndex),
                              child: widget.child,
                            ),
                          ),
                        ),
                      ],
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex:
                          _convNavIndex(widget.navigationShell.currentIndex),
                      onTap: _onSelectedNav,
                      type: BottomNavigationBarType.fixed,
                      items: [
                        for (final module in modules)
                          if (_allowedModules.contains(module.name))
                            BottomNavigationBarItem(
                              icon: Icon(module.icon(context)),
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
                            selectedIndex: _convNavIndex(
                                widget.navigationShell.currentIndex),
                            onDestinationSelected: _onSelectedNav,
                            groupAlignment: 0,
                            labelType: NavigationRailLabelType.selected,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            destinations: [
                              for (final module in modules)
                                if (_allowedModules.contains(module.name))
                                  NavigationRailDestination(
                                    icon: Icon(module.icon(context)),
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
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: Container(
                            key: ValueKey(widget.navigationShell.currentIndex),
                            child: widget.child,
                          ),
                        ),
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
                    selected:
                        _convNavIndex(widget.navigationShell.currentIndex),
                    onItemPressed: _onSelectedNav,
                    displayMode: compact
                        ? fluent.PaneDisplayMode.top
                        : fluent.PaneDisplayMode.compact,
                    toggleable: false,
                    size: const fluent.NavigationPaneSize(
                      openWidth: 220,
                    ),
                    items: [
                      for (final module in modules)
                        if (_allowedModules.contains(module.name))
                          if (module.name != ModuleName.settings)
                            fluent.PaneItem(
                              icon: Icon(module.icon(context), size: 18),
                              title:
                                  Text(module.name.toString().split('.').last),
                              body: Container(),
                            ),
                    ],
                    footerItems: [
                      for (final module in modules)
                        if (_allowedModules.contains(module.name))
                          if (module.name == ModuleName.settings)
                            fluent.PaneItem(
                              icon: Icon(module.icon(context), size: 18),
                              title:
                                  Text(module.name.toString().split('.').last),
                              body: Container(),
                            ),
                    ],
                  ),
                  paneBodyBuilder: (item, child) => Container(
                    key: ValueKey(widget.navigationShell.currentIndex),
                    child: widget.child,
                  ),
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
    required this.leftPart,
    this.leftPartWidth,
    this.middlePart,
    this.rightPart,
    this.rightPartWidth,
    this.gestureRight = true,
  });

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
