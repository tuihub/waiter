import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dao/dao.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_io/io.dart';
import 'package:universal_ui/universal_ui.dart';
import 'package:uuid/uuid.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/platform.dart';
import '../../../route.dart';
import '../../components/input_formatters.dart';
import '../../components/pop_alert.dart';

import '../../layout/bootstrap_breakpoints.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import '../../specialized/right_panel_form.dart';
import '../frame_page.dart';
import 'gebura_common.dart';

part 'gebura_library_detail_app_inst_launcher_panel.dart';
part 'gebura_library_detail_app_inst_panel.dart';
part 'gebura_library_detail_app_panel.dart';
part 'gebura_library_detail_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatelessWidget {
  const GeburaLibraryDetailPage({super.key, required this.uuid});

  final String uuid;

  Widget digestItem(BuildContext context, IconData icon, String title,
      String? subtitle, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              if (subtitle != null)
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaLaunchLocalAppInstState && state.msg != null) {
          UniversalToast.show(context, message: state.msg!);
        }
      },
      builder: (context, state) {
        if (!state.libraryApps.containsKey(uuid)) {
          UniversalToast.show(context, message: '应用不存在');
          const GeburaLibraryRoute().go(context);
        }
        final item = state.libraryApps[uuid]!;
        LocalAppInstLauncherType? launcherType;
        String? launcherUUID;
        if (item.lastLaunchedInstUUID != null) {
          final appInst = state.localAppInsts[item.lastLaunchedInstUUID];
          if (appInst != null) {
            if (appInst.lastLaunchedLauncherUUID != null) {
              final launcher = state
                  .localAppInstLaunchers[appInst.lastLaunchedLauncherUUID!];
              if (launcher != null) {
                launcherUUID = launcher.uuid;
                launcherType = launcher.launcherType;
              }
            }
          }
        } else {
          launcherUUID = null;
          launcherType = null;
        }
        final runState = state.runningInsts[item.uuid];
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: DynMouseScroll(builder: (context, controller, physics) {
            return SingleChildScrollView(
              controller: controller,
              physics: physics,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    child: Center(
                        child: Stack(
                      fit: StackFit.expand,
                      children: [
                        GeburaAppBackgroundImage(
                          path: item.backgroundImagePath,
                          url: item.backgroundImageUrl,
                        ),
                        Positioned.fill(
                          child: Container(
                              padding: const EdgeInsets.only(top: 400 - 96),
                              decoration: BoxDecoration(
                                borderRadius:
                                    UniversalUI.of(context).defaultBorderRadius,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: UniversalUI.of(context)
                                        .defaultBorderRadius,
                                    child: const BackdropBlur(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  BootstrapContainer(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      BootstrapColumn(
                                        xxs: 9,
                                        md: 10,
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              item.name,
                                              style: backdropBlurTextStyle(
                                                  context),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        BootstrapContainer(
                          alignment: Alignment.bottomRight,
                          children: [
                            BootstrapColumn(
                              xxs: 4,
                              md: 3,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                                child: Hero(
                                  tag: item.uuid,
                                  child: GeburaAppCoverImage(
                                    path: item.coverImagePath,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                            SpacingHelper.listSpacing(width: 24, children: [
                          if (PlatformHelper.isWindowsApp())
                            UniversalFilledButton.icon(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              onPressed:
                                  (launcherUUID != null && runState == null)
                                      ? () async {
                                          context.read<GeburaBloc>().add(
                                              GeburaLaunchLocalAppEvent(null,
                                                  launcherUUID: launcherUUID));
                                        }
                                      : null,
                              icon: Icon(
                                launcherType == LocalAppInstLauncherType.steam
                                    ? FontAwesomeIcons.steam
                                    : UniversalIcon(context).play,
                                size: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize ??
                                    22,
                              ),
                              label: Text(
                                runState == null ? '启动' : '运行中',
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.fontSize ??
                                      16,
                                ),
                              ),
                            ),
                          if (PlatformHelper.isWindowsApp())
                            digestItem(
                                context, Icons.cloud_off, '云同步', '离线', null),
                          FutureBuilder(
                            future: context
                                .read<GeburaBloc>()
                                .sumLocalAppRunTime(item.uuid),
                            builder: (context, snapshot) {
                              String runTimeStr = '统计中';
                              if (snapshot.hasData) {
                                final (runTime, msg) = snapshot.data!;
                                if (runTime != null) {
                                  if (runTime.inSeconds == 0) {
                                    runTimeStr = '0 秒';
                                  } else if (runTime.inSeconds < 100) {
                                    runTimeStr = '${runTime.inSeconds} 秒';
                                  } else if (runTime.inMinutes < 100) {
                                    runTimeStr = '${runTime.inMinutes} 分钟';
                                  } else {
                                    runTimeStr =
                                        '${((runTime.inSeconds.toDouble()) / 3600).toStringAsFixed(1)} 小时';
                                  }
                                } else if (msg != null) {
                                  runTimeStr = '错误';
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    UniversalToast.show(context, message: msg);
                                  });
                                } else {
                                  runTimeStr = '错误';
                                }
                              }
                              return digestItem(
                                context,
                                UniversalIcon(context).timer,
                                '运行时间',
                                runTimeStr,
                                null,
                              );
                            },
                          ),
                          Expanded(
                              child:
                                  _GeburaLibraryDetailAppSettings(item: item)),
                        ]),
                      ),
                    ),
                  ),
                  SpacingHelper.defaultDivider,
                  _GeburaLibraryDetailInstList(item: item),
                  SpacingHelper.defaultDivider,
                  _GeburaLibraryDetailRunRecordChart(item: item),
                  SpacingHelper.defaultDivider,
                  if (item.description != null)
                    if (item.description!.contains('</p>'))
                      HtmlWidget(
                        item.description!,
                        renderMode: RenderMode.column,
                        enableCaching: true,
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(item.description!),
                      ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

class _GeburaLibraryDetailInstList extends StatefulWidget {
  const _GeburaLibraryDetailInstList({required this.item});

  final LocalApp item;

  @override
  State<_GeburaLibraryDetailInstList> createState() =>
      _GeburaLibraryDetailInstListState();
}

class _GeburaLibraryDetailInstListState
    extends State<_GeburaLibraryDetailInstList> {
  LocalApp get item => widget.item;
  bool _onlyShowFavorites = true;

  Widget _activeRadio(BuildContext context, LocalAppInstLauncher launcher,
      bool triggerActivation) {
    final selected = context
        .read<GeburaBloc>()
        .state
        .localAppInsts[launcher.appInstUUID]
        ?.lastLaunchedLauncherUUID;
    void doActivation() {
      context
          .read<GeburaBloc>()
          .add(GeburaSaveLastLaunchAppInstEvent(null, launcher.uuid));
    }

    if (triggerActivation && selected != launcher.uuid) {
      doActivation();
    }

    return UniversalRadio<String>(
      value: launcher.uuid,
      groupValue: selected,
      onChanged: (String? value) {
        doActivation();
      },
    );
  }

  Widget _steamItem(BuildContext context, LocalAppInstLauncher launcher,
      bool triggerActivation) {
    return UniversalListTile(
      leading: _activeRadio(context, launcher, triggerActivation),
      title: const Text('由Steam管理'),
      trailing: Wrap(
        spacing: 8,
        children: [
          UniversalIconButton(
            icon: Icon(launcher.favorite ?? false
                ? UniversalIcon(context).favorite
                : UniversalIcon(context).favoriteBorder),
            onPressed: () async {
              final msg = await context
                  .read<GeburaBloc>()
                  .updateLocalAppInstLauncher(launcher.copyWith(
                    favorite: !(launcher.favorite ?? false),
                  ));
              if (msg != null) {
                UniversalToast.show(context, message: msg);
              }
            },
          ),
          UniversalFilledButton.icon(
            onPressed: () async {
              await context
                  .read<GeburaBloc>()
                  .showSteamAppDetails(launcher.steam!.steamAppID);
            },
            icon: const Icon(FontAwesomeIcons.steam, size: 16),
            label: const Text('查看'),
          ),
        ],
      ),
    );
  }

  Widget _localItem(BuildContext context, LocalAppInst inst,
      LocalAppInstLauncher launcher, bool triggerActivation) {
    final settings = launcher.common;
    String? title;
    String? subtitle;
    if (settings != null) {
      final pathFields = settings.launcherPath.split(Platform.pathSeparator);
      title = pathFields.last;
      if (settings.launcherPath.startsWith(inst.path)) {
        subtitle = settings.launcherPath.substring(inst.path.length);
        subtitle = subtitle.startsWith(Platform.pathSeparator)
            ? subtitle.substring(Platform.pathSeparator.length)
            : subtitle;
        if (title == subtitle) {
          subtitle = null;
        }
      }
    }
    return UniversalListTile(
      leading: _activeRadio(context, launcher, triggerActivation),
      title: title != null
          ? AutoSizeText(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : const Text('未找到应用'),
      subtitle: subtitle != null
          ? AutoSizeText(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: Wrap(
        spacing: 8,
        children: [
          UniversalIconButton(
            icon: Icon(launcher.favorite ?? false
                ? UniversalIcon(context).favorite
                : UniversalIcon(context).favoriteBorder),
            onPressed: () async {
              final msg = await context
                  .read<GeburaBloc>()
                  .updateLocalAppInstLauncher(launcher.copyWith(
                    favorite: !(launcher.favorite ?? false),
                  ));
              if (msg != null) {
                UniversalToast.show(context, message: msg);
              }
            },
          ),
          UniversalFilledButton.icon(
            onPressed: () async {
              GeburaLibraryDetailRoute(
                widget.item.uuid,
                action: GeburaLibraryDetailActions.appInstLauncherEdit,
                $extra: launcher,
              ).go(context);
              ModuleFramePage.of(context)?.openDrawer();
            },
            icon: Icon(UniversalIcon(context).settings, size: 16),
            label: const Text('设置'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final List<Widget> favoriteTiles = [];
      final List<Widget> instTiles = [];

      final appInsts =
          state.localAppInsts.values.where((e) => e.appUUID == item.uuid);
      for (final inst in appInsts) {
        final launchers = state.localAppInstLaunchers.values
            .where((e) => e.appInstUUID == inst.uuid)
            .toList();
        final subtitle = inst.path;

        final children = <Widget>[];
        for (final launcher in launchers) {
          late Widget child;
          switch (launcher.launcherType) {
            case LocalAppInstLauncherType.steam:
              child = _steamItem(context, launcher,
                  launcher.steam != null && launchers.length == 1);
            case LocalAppInstLauncherType.common:
              child = _localItem(context, inst, launcher, false);
          }
          children.add(child);
          if (launcher.favorite ?? false) {
            favoriteTiles.add(child);
          }
        }

        final listTile = UniversalExpansionTile(
          initiallyExpanded: true,
          title: AutoSizeText(inst.name ?? inst.path),
          subtitle: Text(subtitle),
          trailing: Wrap(
            children: [
              UniversalIconButton(
                icon: Icon(UniversalIcon(context).add),
                onPressed: () {
                  GeburaLibraryDetailRoute(
                    widget.item.uuid,
                    action: GeburaLibraryDetailActions.appInstLauncherAdd,
                    $extra: inst.uuid,
                  ).go(context);
                  ModuleFramePage.of(context)?.openDrawer();
                },
              ),
              UniversalIconButton(
                icon: Icon(UniversalIcon(context).settings),
                onPressed: () {
                  GeburaLibraryDetailRoute(
                    widget.item.uuid,
                    action: GeburaLibraryDetailActions.appInstEdit,
                    $extra: inst,
                  ).go(context);
                  ModuleFramePage.of(context)?.openDrawer();
                },
              ),
            ],
          ),
          children: [
            ...children,
            // if (launchers.isEmpty)
            //   ListTile(
            //     title: ElevatedButton(
            //       onPressed: () async {
            //         unawaited(
            //           showDialog(
            //             context: context,
            //             builder: (_) {
            //               return BlocProvider.value(
            //                 value: context.read<GeburaBloc>(),
            //                 child: NewLocalAppInstDialog(
            //                   app: insts,
            //                 ),
            //               );
            //             },
            //           ),
            //         );
            //       },
            //       child: const Text('添加安装位置'),
            //     ),
            //   ),
            // if (insts[insts]!.length > localAppInsts.length)
            //   ListTile(
            //     title: Text(
            //         '${insts[insts]!.length - localAppInsts.length} 个在其他设备上'),
            //   ),
          ],
        );

        instTiles.add(listTile);
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UniversalListTile(
            title: const Text('本地文件'),
            subtitle: Text(_onlyShowFavorites
                ? '${favoriteTiles.length} 个收藏'
                : '${appInsts.length} 个安装位置'),
            leading: Icon(UniversalIcon(context).folder),
            trailing: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(_onlyShowFavorites ? '只看收藏' : '显示全部'),
                UniversalSwitch(
                  value: _onlyShowFavorites,
                  onChanged: (value) {
                    setState(() {
                      _onlyShowFavorites = value;
                    });
                  },
                ),
                UniversalIconButton(
                  icon: Icon(UniversalIcon(context).add),
                  onPressed: () {
                    GeburaLibraryDetailRoute(
                      widget.item.uuid,
                      action: GeburaLibraryDetailActions.appInstAdd,
                    ).go(context);
                    ModuleFramePage.of(context)?.openDrawer();
                  },
                ),
              ],
            ),
          ),
          if (_onlyShowFavorites)
            ...favoriteTiles
          else if (instTiles.length == 1)
            instTiles.first
          else
            BootstrapContainer(
              useWrap: true,
              alignment: Alignment.topLeft,
              fill: BootstrapSteps.xxl,
              children: [
                ...instTiles.map(
                  (e) => BootstrapColumn(
                    fill: BootstrapSteps.md,
                    xxs: 12,
                    md: 6,
                    child: e,
                  ),
                ),
              ],
            ),
        ],
      );
    });
  }
}

class _GeburaLibraryDetailAppSettings extends StatefulWidget {
  const _GeburaLibraryDetailAppSettings({
    required this.item,
  });

  final LocalApp item;

  @override
  State<_GeburaLibraryDetailAppSettings> createState() =>
      _GeburaLibraryDetailAppSettingsState();
}

class _GeburaLibraryDetailAppSettingsState
    extends State<_GeburaLibraryDetailAppSettings> {
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(listener: (context, state) {
      if (state is GeburaRefreshAppInfoState) {
        String msg = '';
        if (state.processing) {
          msg = '正在刷新应用信息';
        }
        if (state.failed) {
          msg = '刷新应用信息失败 ${state.msg}';
        }
        if (state.success) {
          msg = '刷新应用信息成功';
        }
        UniversalToast.show(context, message: msg);
      }
    }, builder: (context, state) {
      return UniversalToolBar(
        mainAxisAlignment: MainAxisAlignment.end,
        primaryItems: const [],
        secondaryItems: [
          UniversalToolBarItem(
            label: const Text('编辑应用信息'),
            icon: UniversalIcon(context).edit,
            onPressed: () {
              GeburaLibraryDetailRoute(
                widget.item.uuid,
                action: GeburaLibraryDetailActions.appEdit,
              ).go(context);
              ModuleFramePage.of(context)?.openDrawer();
            },
          ),
          UniversalToolBarItem(
            label: const Text('自动获取应用信息'),
            icon: UniversalIcon(context).automated,
            onPressed: () {
              context
                  .read<GeburaBloc>()
                  .add(GeburaRefreshAppInfoEvent(null, widget.item.uuid));
            },
          ),
        ],
      );
    });
  }
}

class _GeburaLibraryDetailRunRecordChart extends StatefulWidget {
  const _GeburaLibraryDetailRunRecordChart({required this.item});

  final LocalApp item;

  @override
  State<_GeburaLibraryDetailRunRecordChart> createState() =>
      _GeburaLibraryDetailRunRecordChartState();
}

class _GeburaLibraryDetailRunRecordChartState
    extends State<_GeburaLibraryDetailRunRecordChart> {
  _GeburaLibraryDetailRunRecordChartType current =
      _GeburaLibraryDetailRunRecordChartType.closed;
  DateTime _startDate = DateTime.now();
  final List<(DateTime, DateTime, bool)> _timeSplit = [];
  final Map<(DateTime, DateTime), Duration> _runTime = {};

  void _updateChartType(_GeburaLibraryDetailRunRecordChartType type) {
    current = type;
    // round startDate
    switch (current) {
      case _GeburaLibraryDetailRunRecordChartType.day:
        _startDate =
            DateTime(_startDate.year, _startDate.month, _startDate.day);
      case _GeburaLibraryDetailRunRecordChartType.week:
        final month = _startDate.month;
        _startDate = DateTime(_startDate.year, _startDate.month,
            _startDate.day - _startDate.weekday + 1);
        _startDate = DateTime(_startDate.year, _startDate.month,
            _startDate.day - _startDate.weekday + 1);
        if (_startDate.month != month) {
          _startDate = _startDate.add(const Duration(days: 7));
        }
      case _GeburaLibraryDetailRunRecordChartType.month:
        _startDate = DateTime(_startDate.year, _startDate.month, 1);
      default:
    }
    _updateTimeSplit();
  }

  void _nextPeriod() {
    switch (current) {
      case _GeburaLibraryDetailRunRecordChartType.day:
        setState(() {
          _startDate = _startDate.add(const Duration(days: 1));
        });
      case _GeburaLibraryDetailRunRecordChartType.week:
        setState(() {
          _startDate = _startDate.add(const Duration(days: 7));
        });
      case _GeburaLibraryDetailRunRecordChartType.month:
        setState(() {
          _startDate = DateTime(_startDate.year, _startDate.month + 1, 1);
        });
      default:
    }
    _updateTimeSplit();
  }

  void _prevPeriod() {
    switch (current) {
      case _GeburaLibraryDetailRunRecordChartType.day:
        setState(() {
          _startDate = _startDate.subtract(const Duration(days: 1));
        });
      case _GeburaLibraryDetailRunRecordChartType.week:
        setState(() {
          _startDate = _startDate.subtract(const Duration(days: 7));
        });
      case _GeburaLibraryDetailRunRecordChartType.month:
        setState(() {
          _startDate = DateTime(_startDate.year, _startDate.month - 1, 1);
        });
      default:
    }
    _updateTimeSplit();
  }

  void _updateTimeSplit() {
    _timeSplit.clear();
    switch (current) {
      case _GeburaLibraryDetailRunRecordChartType.day:
        // round startDate to the day
        final start =
            DateTime(_startDate.year, _startDate.month, _startDate.day);
        final end = start.add(const Duration(days: 1));
        // split to 24 hours
        for (var i = 0; i < 24; i++) {
          _timeSplit.add((
            start.add(Duration(hours: i)),
            start.add(Duration(hours: i + 1)),
            false,
          ));
        }
      case _GeburaLibraryDetailRunRecordChartType.week:
        // round startDate to the week
        final start = DateTime(_startDate.year, _startDate.month,
            _startDate.day - _startDate.weekday + 1);
        final end = start.add(const Duration(days: 7));
        // split to 7 days, set weekend to true
        for (var i = start;
            i.isBefore(end);
            i = i.add(const Duration(days: 1))) {
          _timeSplit.add((i, i.add(const Duration(days: 1)), i.weekday > 5));
        }
      case _GeburaLibraryDetailRunRecordChartType.month:
        // round startDate to the month
        final start = DateTime(_startDate.year, _startDate.month, 1);
        final end = DateTime(_startDate.year, _startDate.month + 1, 1);
        // split to each day, set weekend to true
        for (var i = start;
            i.isBefore(end);
            i = i.add(const Duration(days: 1))) {
          _timeSplit.add((i, i.add(const Duration(days: 1)), i.weekday > 5));
        }
      default:
    }
    unawaited(_loadRunTime());
  }

  Future<void> _loadRunTime() async {
    for (final (start, end, _) in _timeSplit) {
      final (dur, msg) = await context.read<GeburaBloc>().sumLocalAppRunTime(
            widget.item.uuid,
            start: start,
            duration: end.difference(start),
          );
      if (dur != null) {
        _runTime[(start, end)] = dur;
      } else if (msg != null) {
        // TODO
        debugPrint(msg);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UniversalListTile(
          title: const Text('运行记录'),
          leading: Icon(UniversalIcon(context).timer),
          trailing:
              UniversalToggleSwitch<_GeburaLibraryDetailRunRecordChartType>(
            current: current,
            values: _GeburaLibraryDetailRunRecordChartType.values,
            iconBuilder: (i) {
              switch (i) {
                case _GeburaLibraryDetailRunRecordChartType.closed:
                  return Icon(UniversalIcon(context).hide);
                case _GeburaLibraryDetailRunRecordChartType.day:
                  return const Text('日');
                case _GeburaLibraryDetailRunRecordChartType.week:
                  return const Text('周');
                case _GeburaLibraryDetailRunRecordChartType.month:
                  return const Text('月');
              }
            },
            onChanged: (i) {
              _updateChartType(i);
            },
          ),
        ),
        if (current != _GeburaLibraryDetailRunRecordChartType.closed)
          UniversalCard(
            child: Column(
              children: [
                UniversalToolBar(
                  primaryItems: [
                    UniversalToolBarItem(
                      label: UniversalDatePicker(
                          selectedDate: _startDate,
                          showDay: current !=
                              _GeburaLibraryDetailRunRecordChartType.month,
                          onChanged: (date) {
                            _startDate = date;
                            _updateChartType(current);
                          }),
                      onPressed: () async {
                        _prevPeriod();
                      },
                    ),
                    UniversalToolBarItem(
                      label: const Text('今天'),
                      icon: UniversalIcon(context).refresh,
                      onPressed: () async {
                        _startDate = DateTime.now();
                        _updateChartType(current);
                      },
                    ),
                    UniversalToolBarItem(
                      icon: UniversalIcon(context).arrowLeft,
                      onPressed: () async {
                        _prevPeriod();
                      },
                    ),
                    UniversalToolBarItem(
                      icon: UniversalIcon(context).arrowRight,
                      onPressed: () async {
                        _nextPeriod();
                      },
                    ),
                  ],
                  secondaryItems: [
                    UniversalToolBarItem(
                      label: const Text('清除缓存'),
                      icon: UniversalIcon(context).clear,
                      onPressed: () async {
                        setState(_runTime.clear);
                        unawaited(_loadRunTime());
                      },
                    ),
                  ],
                ),
                AspectRatio(
                  aspectRatio: 1.70,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 12,
                      top: 24,
                      bottom: 12,
                    ),
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (current) {
      case _GeburaLibraryDetailRunRecordChartType.day:
        text = Text('${value.toInt()}:00');
      case _GeburaLibraryDetailRunRecordChartType.week:
        text = Text(_weekDayName(value.toInt()));
      case _GeburaLibraryDetailRunRecordChartType.month:
        text = Text(_monthDayName(value.toInt()));
      default:
        return Container();
    }

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  // Widget leftTitleWidgets(double value, TitleMeta meta) {
  //   const style = TextStyle(
  //     fontWeight: FontWeight.bold,
  //     fontSize: 15,
  //   );
  //   String text;
  //   switch (value.toInt()) {
  //     case 1:
  //       text = '10K';
  //     case 3:
  //       text = '30k';
  //     case 5:
  //       text = '50k';
  //     default:
  //       return Container();
  //   }
  //
  //   return Text(text, style: style, textAlign: TextAlign.left);
  // }

  LineChartData mainData() {
    double maxY = 0;
    for (var i = 0; i < _timeSplit.length; i++) {
      final (start, end, _) = _timeSplit[i];
      final value = _runTime[(start, end)];
      if (value != null) {
        maxY = max(maxY, value.inMinutes.toDouble());
      }
    }
    maxY = _roundDouble((maxY + 1) / 60, 2);
    final double xAdder =
        current == _GeburaLibraryDetailRunRecordChartType.day ? 0 : 1;
    return LineChartData(
        gridData: const FlGridData(
          horizontalInterval: 1,
          verticalInterval: 1,
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            minIncluded: false,
            maxIncluded: false,
            interval: (() {
              switch (current) {
                case _GeburaLibraryDetailRunRecordChartType.day:
                  return 3.0;
                case _GeburaLibraryDetailRunRecordChartType.week:
                  return 1.0;
                case _GeburaLibraryDetailRunRecordChartType.month:
                  return 7.0;
                default:
                  return 1.0;
              }
            })(),
            getTitlesWidget: bottomTitleWidgets,
          )),
        ),
        minX: xAdder - 0.5,
        maxX: _timeSplit.length.toDouble() + xAdder - 0.5,
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            preventCurveOverShooting: true,
            spots: List.generate(_timeSplit.length, (index) {
              final runMinutes =
                  _runTime[(_timeSplit[index].$1, _timeSplit[index].$2)]
                          ?.inMinutes
                          .toDouble() ??
                      0;
              final y = _roundDouble(runMinutes / 60, 2);
              return FlSpot(index.toDouble() + xAdder, y);
            }),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: true,
            ),
          ),
        ],
        rangeAnnotations: RangeAnnotations(verticalRangeAnnotations: [
          ...List.generate(_timeSplit.length, (index) {
            final (_, __, weekend) = _timeSplit[index];
            if (weekend) {
              return VerticalRangeAnnotation(
                x1: index.toDouble() + xAdder - 0.5,
                x2: index.toDouble() + 1 + xAdder - 0.5,
                color: Colors.grey.withOpacity(0.3),
              );
            }
            return null;
          }).where((e) => e != null).cast<VerticalRangeAnnotation>(),
        ]));
  }

  double _roundDouble(double value, int places) {
    final num mod = pow(10.0, places);
    return (value * mod).round().toDouble() / mod;
  }

  String _weekDayName(int weekday) {
    switch (weekday) {
      case 1:
        return '周一';
      case 2:
        return '周二';
      case 3:
        return '周三';
      case 4:
        return '周四';
      case 5:
        return '周五';
      case 6:
        return '周六';
      case 7:
        return '周日';
      default:
        return '';
    }
  }

  String _monthDayName(int day) {
    return '$day 日';
  }
}

enum _GeburaLibraryDetailRunRecordChartType {
  closed,
  day,
  week,
  month,
}
