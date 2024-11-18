import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dao/dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_hero/local_hero.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_io/io.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../bloc/main_bloc.dart';
import '../../../common/platform.dart';
import '../../../repo/grpc/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import '../../universal/universal.dart';
import 'gebura_app_launcher_setting_dialog.dart';
import 'gebura_common.dart';

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
          Toast(title: '', message: state.msg!).show(context);
        }
      },
      builder: (context, state) {
        if (!state.libraryApps.containsKey(uuid)) {
          const Toast(title: '', message: '应用不存在').show(context);
          const GeburaLibraryRoute().go(context);
        }
        final item = state.libraryApps[uuid]!;
        late LocalAppInstLauncherType? launcherType;
        late String? launcherUUID;
        if (item.lastLaunchedInstUUID != null) {
          final appInst = state.libraryAppInsts[item.lastLaunchedInstUUID];
          if (appInst != null) {
            if (appInst.lastLaunchedLauncherUUID != null) {
              final launcher = state
                  .libraryAppInstLaunchers[appInst.lastLaunchedLauncherUUID!];
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
        // final runTime = state.getRunTime(Int64(item.appID ?? 0));
        late String runTimeStr;
        // if (runTime != null) {
        //   if (runTime.inSeconds == 0) {
        //     runTimeStr = '';
        //   } else if (runTime.inSeconds < 100) {
        //     runTimeStr = '${runTime.inSeconds} 秒';
        //   } else if (runTime.inMinutes < 100) {
        //     runTimeStr = '${runTime.inMinutes} 分钟';
        //   } else {
        //     runTimeStr =
        //         '${((runTime.inSeconds.toDouble()) / 3600).toStringAsFixed(1)} 小时';
        //   }
        // } else {
        //   runTimeStr = '错误';
        // }
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
                                child: LocalHero(
                                  key: ValueKey(item.uuid),
                                  tag: item.uuid,
                                  child: GeburaAppCoverImage(
                                    path: item.coverImagePath,
                                    url: item.coverImageUrl,
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
                            UniversalElevatedButton.icon(
                              onPressed: (launcherUUID == null)
                                  ? null
                                  : () async {
                                      context.read<GeburaBloc>().add(
                                          GeburaLaunchLocalAppEvent(
                                              launcherUUID: launcherUUID));
                                    },
                              icon: Icon(
                                launcherType == LocalAppInstLauncherType.steam
                                    ? FontAwesomeIcons.steam
                                    : UniversalUI.of(context).icons.play,
                              ),
                              label: const Text('启动'),
                            ),
                          if (PlatformHelper.isWindowsApp())
                            digestItem(
                                context, Icons.cloud_off, '云同步', '已离线', null),
                          // if (runTimeStr.isNotEmpty)
                          //   digestItem(
                          //       context, Icons.timer, '运行时间', runTimeStr, null),
                          Expanded(
                              child:
                                  _GeburaLibraryDetailAppSettings(item: item)),
                        ]),
                      ),
                    ),
                  ),
                  _GeburaLibraryDetailInstList(item: item),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

class _GeburaLibraryDetailInstList extends StatelessWidget {
  const _GeburaLibraryDetailInstList({required this.item});

  final LocalApp item;

  Widget _activeRadio(BuildContext context, LocalAppInstLauncher launcher,
      bool triggerActivation) {
    final selected = context
        .read<GeburaBloc>()
        .state
        .libraryAppInsts[launcher.appInstUUID]
        ?.lastLaunchedLauncherUUID;
    void doActivation() {
      context
          .read<GeburaBloc>()
          .add(GeburaSaveLastLaunchAppInstEvent(launcher.uuid));
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
      trailing: launcher.steam != null
          ? UniversalElevatedButton.icon(
              onPressed: () async {
                await context
                    .read<GeburaBloc>()
                    .showSteamAppDetails(launcher.steam!.steamAppID);
              },
              icon: const Icon(FontAwesomeIcons.steam, size: 16),
              label: const Text('查看'),
            )
          : null,
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
      trailing: UniversalElevatedButton.icon(
        onPressed: () async {
          unawaited(showDialog<void>(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<GeburaBloc>(),
              child: GeburaAppLauncherSettingDialog(
                  launcher, Navigator.of(context)),
            ),
          ));
        },
        icon: Icon(UniversalUI.of(context).icons.settings, size: 16),
        label: const Text('设置'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final List<Widget> listTiles = [];

      final appInsts =
          state.libraryAppInsts.values.where((e) => e.appUUID == item.uuid);
      for (final inst in appInsts) {
        final launchers = state.libraryAppInstLaunchers.values
            .where((e) => e.appInstUUID == inst.uuid)
            .toList();
        final msg = '${launchers.length} 个启动项';

        final listTile = UniversalExpansionTile(
          initiallyExpanded: true,
          title: Text(msg),
          children: [
            for (final launcher in launchers)
              switch (launcher.launcherType) {
                LocalAppInstLauncherType.steam => _steamItem(
                    context,
                    launcher,
                    launcher.steam != null && launchers.length == 1,
                  ),
                LocalAppInstLauncherType.common => _localItem(
                    context,
                    inst,
                    launcher,
                    launcher.common != null && launchers.length == 1,
                  ),
              },
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

        listTiles.add(listTile);
      }

      // if (state.ownedApps!
      //     .any((element) => element.assignedAppInfoId.id == item.id.id)) {
      //   listTiles.add(
      //     ListTile(
      //       title: ElevatedButton(
      //         onPressed: () async {
      //           unawaited(
      //             showDialog(
      //               context: context,
      //               builder: (_) {
      //                 return BlocProvider.value(
      //                   value: context.read<GeburaBloc>(),
      //                   child: NewLocalAppInstDialog(
      //                     app: state.ownedApps!.firstWhere(
      //                       (element) =>
      //                           element.assignedAppInfoId.id == item.id.id,
      //                     ),
      //                     newAppWithSameInfo: true,
      //                   ),
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //         child: const Text('添加应用版本'),
      //       ),
      //     ),
      //   );
      // } else if (state.purchasedAppInfos!
      //     .any((element) => element.id.id == item.id.id)) {
      //   listTiles.add(
      //     ListTile(
      //       title: ElevatedButton(
      //         onPressed: () async {
      //           unawaited(
      //             showDialog(
      //               context: context,
      //               builder: (_) {
      //                 return BlocProvider.value(
      //                   value: context.read<GeburaBloc>(),
      //                   child: NewLocalAppInstDialog(
      //                     app: App(
      //                       name: item.name,
      //                       assignedAppInfoId: item.id,
      //                     ),
      //                     newAppWithSameInfo: true,
      //                   ),
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //         child: const Text('添加应用版本'),
      //       ),
      //     ),
      //   );
      // }

      return ListView(
        shrinkWrap: true,
        children: listTiles,
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
        Toast(title: '', message: msg).show(context);
      }
    }, builder: (context, state) {
      return UniversalToolBar(
        mainAxisAlignment: MainAxisAlignment.end,
        primaryItems: const [],
        secondaryItems: [
          // UniversalToolBarItem(
          //   label: const Text('编辑应用信息'),
          //   icon: UniversalUI.of(context).icons.settings,
          //   onPressed: () {
          //     // GeburaLibraryDetailRoute(
          //     //   action: GeburaLibraryDetailActions.assignApp,
          //     //   uuid: widget.item.uuid,
          //     // ).go(context);
          //   },
          // ),
          UniversalToolBarItem(
            label: const Text('自动获取应用信息'),
            icon: UniversalUI.of(context).icons.automated,
            onPressed: () {
              context
                  .read<GeburaBloc>()
                  .add(GeburaRefreshAppInfoEvent(widget.item.uuid));
            },
          ),
        ],
      );
    });
  }
}

class _GeburaLibraryDetailChangeAppInfoDialog extends StatefulWidget {
  const _GeburaLibraryDetailChangeAppInfoDialog({
    required this.item,
  });

  final App item;

  @override
  State<_GeburaLibraryDetailChangeAppInfoDialog> createState() =>
      _GeburaLibraryDetailChangeAppInfoDialogState();
}

class _GeburaLibraryDetailChangeAppInfoDialogState
    extends State<_GeburaLibraryDetailChangeAppInfoDialog> {
  String? source;
  String? sourceAppID;

  @override
  Widget build(BuildContext context) {
    final sources =
        context.read<MainBloc>().state.serverFeatureSummary?.appInfoSources ??
            [];
    return UniversalDialog(
      title: const Text('设置应用信息'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            if (sources.isEmpty)
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: const Text('服务端没有可用的应用信息来源'),
              ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: '应用信息来源',
                ),
                items: [
                  for (final s in sources)
                    DropdownMenuItem(
                        value: s, child: Text(appSourceString(s.id)))
                ],
                onChanged: (FeatureFlag? value) {
                  setState(() {
                    source = value?.id;
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '应用ID',
              ),
              onSaved: (String? value) {
                setState(() {
                  sourceAppID = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        UniversalDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('取消'),
        ),
      ],
    );
  }
}
