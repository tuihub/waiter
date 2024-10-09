import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_hero/local_hero.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../bloc/main_bloc.dart';
import '../../../common/platform.dart';
import '../../../common/steam/local_library.dart';
import '../../../model/gebura_model.dart';
import '../../../repo/grpc/l10n.dart';
import '../../../route.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import '../../helper/url.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import 'gebura_app_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatelessWidget {
  const GeburaLibraryDetailPage({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaLaunchLocalAppInstState && state.msg != null) {
          Toast(title: '', message: state.msg!).show(context);
        }
      },
      builder: (context, state) {
        if (state.libraryListItems == null ||
            !state.libraryListItems!.any(
              (e) => e.uuid == uuid,
            )) {
          const Toast(title: '', message: '应用不存在').show(context);
          const GeburaLibraryRoute().go(context);
        }
        final item = state.libraryListItems!.firstWhere(
          (e) => e.uuid == uuid,
        );
        late LocalAppInstType? appInstType;
        late String? launchAppInstUUID;
        if (item.localAppUUID != null) {
          final app = state.localTrackedApps?[item.localAppUUID];
          if (app != null) {
            if (app.lastLaunchedInstUUID != null) {
              final appInst =
                  state.localTrackedAppInsts?[app.lastLaunchedInstUUID];
              appInstType = appInst?.type;
              launchAppInstUUID = app.lastLaunchedInstUUID;
            } else {
              state.localTrackedAppInsts?.values.forEach((element) {
                if (element.appUUID == item.localAppUUID) {
                  appInstType = element.type;
                  launchAppInstUUID = element.uuid;
                }
              });
            }
          }
        } else {
          appInstType = null;
        }
        final runTime = state.getRunTime(Int64(item.appID ?? 0));
        late String runTimeStr;
        if (runTime != null) {
          if (runTime.inSeconds == 0) {
            runTimeStr = '';
          } else if (runTime.inSeconds < 100) {
            runTimeStr = '${runTime.inSeconds} 秒';
          } else if (runTime.inMinutes < 100) {
            runTimeStr = '${runTime.inMinutes} 分钟';
          } else {
            runTimeStr =
                '${((runTime.inSeconds.toDouble()) / 3600).toStringAsFixed(1)} 小时';
          }
        } else {
          runTimeStr = '错误';
        }
        final runState = state.runningInsts?[item.uuid];
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                            image: DecorationImage(
                              image: ExtendedNetworkImageProvider(
                                item.backgroundImageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // margin: EdgeInsets.all(32),
                          height: 400,
                        ),
                        Positioned.fill(
                          child: Container(
                              padding: const EdgeInsets.only(top: 400 - 96),
                              decoration: BoxDecoration(
                                borderRadius: SpacingHelper.defaultBorderRadius,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        SpacingHelper.defaultBorderRadius,
                                    child: const BackdropBlur(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  BootstrapContainer(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      BootstrapColumn(
                                        xxs: 10,
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              item.name,
                                              style: backdropBlurTextStyle(
                                                  context),
                                              maxLines: 2,
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
                              xxs: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: LocalHero(
                                  key: ValueKey(item.uuid),
                                  tag: item.uuid,
                                  child:
                                      UrlHelper.isValidUrl(item.coverImageUrl)
                                          ? ExtendedImage.network(
                                              item.coverImageUrl,
                                              height: 200,
                                              loadStateChanged:
                                                  (ExtendedImageState state) {
                                                if (state
                                                        .extendedImageLoadState ==
                                                    LoadState.failed) {
                                                  return const SizedBox();
                                                }
                                                return null;
                                              },
                                            )
                                          : ExtendedImage.asset(
                                              'assets/images/gebura_library_cover_placeholder.png',
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
                        children: [
                          if (PlatformHelper.isWindowsApp())
                            ElevatedButton.icon(
                              onPressed: (launchAppInstUUID == null)
                                  ? null
                                  : () async {
                                      context.read<GeburaBloc>().add(
                                          GeburaLaunchLocalAppEvent(
                                              launchAppInstUUID!));
                                    },
                              icon: Icon(
                                appInstType == LocalAppInstType.steam
                                    ? FontAwesomeIcons.steam
                                    : Icons.play_arrow,
                              ),
                              label: const Text('启动'),
                            ),
                          const SizedBox(
                            width: 24,
                          ),
                          if (runTimeStr.isNotEmpty)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('总运行时间',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Text(runTimeStr),
                              ],
                            ),
                          const Expanded(child: SizedBox()),
                          _GeburaLibraryDetailAppSettings(item: item),
                        ],
                      ),
                    ),
                  ),
                  SpacingHelper.defaultDivider,
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

  final LibraryListItem item;

  Widget _activeRadio(
      BuildContext context, LocalTrackedAppInst inst, bool triggerActivation) {
    final selected = context
        .read<GeburaBloc>()
        .state
        .localTrackedApps?[inst.appUUID]
        ?.lastLaunchedInstUUID;
    void doActivation() {
      context
          .read<GeburaBloc>()
          .add(GeburaSaveLastLaunchAppInstEvent(inst.uuid));
    }

    if (triggerActivation && selected != inst.uuid) {
      doActivation();
    }

    return Radio<String>(
      value: inst.uuid,
      groupValue: selected,
      onChanged: (String? value) {
        doActivation();
      },
    );
  }

  Widget _steamItem(
      BuildContext context, LocalTrackedAppInst inst, bool triggerActivation) {
    late InstalledSteamApps? steamApp;
    if (inst.steamLaunchSetting != null) {
      context
          .read<GeburaBloc>()
          .state
          .localInstalledSteamAppInsts
          ?.forEach((_, v) {
        if (v.appId == inst.steamLaunchSetting!.steamAppID) {
          steamApp = v;
        }
      });
    }
    return ListTile(
      leading: _activeRadio(context, inst, triggerActivation),
      title: const Text('由Steam管理'),
      subtitle: steamApp != null
          ? AutoSizeText(steamApp!.installPath, maxLines: 1)
          : const Text('未找到Steam应用'),
      trailing: steamApp != null
          ? ElevatedButton.icon(
              onPressed: () async {
                await context
                    .read<GeburaBloc>()
                    .showSteamAppDetails(steamApp!.appId);
              },
              icon: const Icon(FontAwesomeIcons.steam, size: 16),
              label: const Text('查看'),
            )
          : null,
    );
  }

  Widget _localItem(
      BuildContext context, LocalTrackedAppInst inst, bool triggerActivation) {
    final settings = inst.commonLaunchSetting;
    return ListTile(
      leading: _activeRadio(context, inst, triggerActivation),
      title: Text(inst.name ?? '未知应用'),
      subtitle: settings != null
          ? AutoSizeText(settings.installPath, maxLines: 1)
          : const Text('未找到应用'),
      trailing: ElevatedButton.icon(
        onPressed: () async {
          unawaited(showDialog<void>(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<GeburaBloc>(),
              child: GeburaAppLauncherSettingDialog(inst),
            ),
          ));
        },
        icon: const Icon(Icons.settings, size: 16),
        label: const Text('设置'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      // final deviceID = context.read<MainBloc>().state.currentDeviceId;
      // final app = state.localTrackedApps?[item.localAppUUID];
      final appInsts = state.localTrackedAppInsts?.values
              .where((e) => e.appUUID == item.localAppUUID) ??
          [];
      final appInstsMap = <String, List<LocalTrackedAppInst>>{};
      for (final inst in appInsts) {
        if (appInstsMap[inst.version] == null) {
          appInstsMap[inst.version] = [];
        }
        appInstsMap[inst.version]!.add(inst);
      }
      final List<Widget> listTiles = [];
      for (final version in appInstsMap.keys) {
        final insts = appInstsMap[version]!;
        final msg = insts.length == 1 ? '已安装' : '已安装 ${insts.length} 个在当前设备';

        final listTile = ExpansionTile(
          initiallyExpanded: true,
          title: Text(msg),
          children: [
            for (final inst in insts)
              switch (inst.type) {
                LocalAppInstType.steam => _steamItem(
                    context,
                    inst,
                    inst.steamLaunchSetting != null && insts.length == 1,
                  ),
                LocalAppInstType.common => _localItem(
                    context,
                    inst,
                    inst.commonLaunchSetting != null && insts.length == 1,
                  ),
              },
            // if (localAppInsts.isEmpty)
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

  final LibraryListItem item;

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
      return PopupMenuButton<int>(
        initialValue: selectedItem,
        onSelected: (int item) {
          setState(() {
            selectedItem = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
          // TODO
          // PopupMenuItem<int>(
          //   value: 1,
          //   enabled: (state.ownedApps ?? [])
          //       .any((element) => element.id.id == widget.item.id.id),
          //   child: const Text('设置应用信息'),
          //   onTap: () {
          //     GeburaLibraryDetailRoute(
          //       action: GeburaLibraryDetailActions.assignApp,
          //       uuid: widget.item.uuid,
          //     ).go(context);
          //   },
          // ),
          // PopupMenuItem<int>(
          //   value: 2,
          //   enabled: (state.appInfoMap ?? <Int64, List<AppInfo>>{})
          //       .values
          //       .expand((element) => element)
          //       .any((element) => element.id.id == widget.item.id.id),
          //   child: const Text('刷新应用信息'),
          //   onTap: () {
          //     final appInfos = state.appInfoMap!.values.firstWhere(
          //       (element) => element.any((e) => e.id.id == widget.item.id.id),
          //     );
          //     final appInfoIDs = appInfos
          //         .map((e) => AppInfoID(
          //               internal: e.internal,
          //               source: e.source,
          //               sourceAppId: e.sourceAppId,
          //             ))
          //         .toList();
          //     context
          //         .read<GeburaBloc>()
          //         .add(GeburaRefreshAppInfoEvent(appInfoIDs));
          //   },
          // ),
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
    return AlertDialog(
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
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('取消'),
        ),
      ],
    );
  }
}
