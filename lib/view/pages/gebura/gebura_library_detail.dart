import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_hero/local_hero.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../bloc/main_bloc.dart';
import '../../../common/platform.dart';
import '../../../model/gebura_model.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import '../../helper/url.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import 'gebura_app_launcher_setting_dialog.dart';
import 'gebura_new_local_dialog.dart';

class GeburaLibraryDetailPage extends StatelessWidget {
  const GeburaLibraryDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var firstBuild = true;
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaRunAppState && state.msg != null) {
          Toast(title: '', message: state.msg!).show(context);
        }
      },
      builder: (context, state) {
        final item = state.libraryItems!.firstWhere(
          (element) => element.id.id == Int64(id),
        );
        final setting = state.appLauncherSettings != null
            ? state.appLauncherSettings![item.id.id]
            : null;
        if (firstBuild) {
          firstBuild = false;
          if (state.appInfoMap == null ||
              state.appInfoMap![item.id.id] == null) {
            context
                .read<GeburaBloc>()
                .add(GeburaFetchBoundAppInfosEvent(item.id));
          }
          if (setting == null) {
            context
                .read<GeburaBloc>()
                .add(GeburaFetchAppLauncherSettingEvent(item.id));
          }
        }

        final runState =
            state.runState != null && state.runState!.containsKey(item.id)
                ? state.runState![item.id]
                : null;
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
                            child: ClipRRect(
                              borderRadius: SpacingHelper.defaultBorderRadius,
                              child: const BackdropBlur(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              item.name,
                              style: backdropBlurTextStyle(context),
                            ),
                          ),
                        ),
                        BootstrapContainer(
                          alignment: Alignment.bottomRight,
                          children: [
                            BootstrapColumn(
                              xxs: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: LocalHero(
                                  key: ValueKey(item.id.id),
                                  tag: item.id.id.toString(),
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
                                          : Container(),
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
                        children: [
                          if (PlatformHelper.isWindowsApp())
                            if (setting != null)
                              ElevatedButton.icon(
                                onPressed: () async {
                                  context
                                      .read<GeburaBloc>()
                                      .add(GeburaRunAppEvent(item.id));
                                },
                                icon: Icon(
                                  setting.type == AppLauncherType.steam
                                      ? FontAwesomeIcons.steam
                                      : Icons.play_arrow,
                                ),
                                label: const Text('启动'),
                              )
                            else
                              ElevatedButton.icon(
                                onPressed: null,
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('启动'),
                              ),
                          const SizedBox(
                            width: 24,
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text('开发商：${item.details.developer}'),
                          //     Text('发行商：${item.details.publisher}'),
                          //     Text('发行日期：${item.details.releaseDate}'),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   width: 24,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '运行状态：${runState?.running ?? false ? '运行中' : '未运行'}'),
                              Text('启动时间：${runState?.startTime ?? ''}'),
                              Text('停止时间：${runState?.endTime ?? ''}'),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          // if (PlatformHelper.isWindowsApp())
                          //   ElevatedButton(
                          //     onPressed: () {
                          //     },
                          //     child: const Icon(Icons.arrow_drop_down),
                          //   )
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

  final AppInfoMixed item;

  String? _launcherID(AppLauncherSetting? setting) {
    switch (setting?.type) {
      case AppLauncherType.steam:
        return setting?.steamAppID;
      case AppLauncherType.local:
        return setting?.localAppInstID.toString();
      case null:
        return null;
    }
  }

  Widget _activeRadio(BuildContext context, AppLauncherSetting setting,
      bool triggerActivation) {
    final launcherSettings =
        context.read<GeburaBloc>().state.appLauncherSettings?[item.id.id];
    void doActivation() {
      context.read<GeburaBloc>().add(GeburaSetAppLauncherSettingEvent(
            item.id,
            setting,
          ));
    }

    if (triggerActivation) {
      doActivation();
    }

    return Radio<String>(
      value: _launcherID(setting) ?? '',
      groupValue: _launcherID(launcherSettings),
      onChanged: (String? value) {
        doActivation();
      },
    );
  }

  Widget _steamItem(
      BuildContext context, String steamAppID, bool triggerActivation) {
    final steamApp = context
        .read<GeburaBloc>()
        .state
        .localSteamAppInsts
        ?.firstWhere((element) => element.appId == steamAppID);
    return ListTile(
      leading: _activeRadio(
        context,
        AppLauncherSetting(
          type: AppLauncherType.steam,
          steamAppID: steamAppID,
        ),
        triggerActivation,
      ),
      title: const Text('由Steam管理'),
      subtitle: Text(steamApp?.installPath ?? ''),
      trailing: steamApp != null
          ? ElevatedButton.icon(
              onPressed: () async {
                await context
                    .read<GeburaBloc>()
                    .showSteamAppDetails(steamApp.appId);
              },
              icon: const Icon(FontAwesomeIcons.steam, size: 16),
              label: const Text('查看'),
            )
          : null,
    );
  }

  Widget _localItem(BuildContext context, LocalAppInstLauncherSetting settings,
      bool triggerActivation) {
    return ListTile(
      leading: _activeRadio(
        context,
        AppLauncherSetting(
          type: AppLauncherType.local,
          localAppInstID: settings.appInstID,
        ),
        triggerActivation,
      ),
      title: Text(settings.installPath),
      trailing: ElevatedButton.icon(
        onPressed: () async {
          unawaited(showDialog<void>(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<GeburaBloc>(),
              child: GeburaAppLauncherSettingDialog(
                item.id.id.toInt(),
                settings,
              ),
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
      final Map<App, List<AppInst>> appInsts = state.getAppInsts(item.id.id);
      final deviceID = context.read<MainBloc>().state.currentDeviceId;
      final List<Widget> listTiles = [];
      for (final app in appInsts.keys) {
        final insts = appInsts[app]!;
        final List<AppInst> localAppInsts = deviceID != null
            ? List.from(insts.where(
                (inst) => inst.deviceId.id == deviceID.id,
              ))
            : [];
        var msg = localAppInsts.isEmpty
            ? '未安装'
            : localAppInsts.length == 1
                ? '已安装'
                : '已安装 ${localAppInsts.length} 个在当前设备';
        if (appInsts.length > 1) {
          msg = '${app.name} $msg';
        }
        final instCount = appInsts.values.fold(
          0,
          (previousValue, element) => previousValue + element.length,
        );

        final listTile = ExpansionTile(
          initiallyExpanded: true,
          title: Text(msg),
          children: [
            for (final inst in localAppInsts)
              if (state.importedSteamAppInsts?.any(
                    (e) => e.instID == inst.id.id.toInt(),
                  ) ??
                  false)
                _steamItem(
                  context,
                  state.importedSteamAppInsts!
                      .firstWhere(
                        (e) => e.instID == inst.id.id.toInt(),
                      )
                      .steamAppID,
                  instCount == 1,
                )
              else if (context
                      .read<GeburaBloc>()
                      .getAppLauncherSetting(inst.id) !=
                  null)
                _localItem(
                  context,
                  context.read<GeburaBloc>().getAppLauncherSetting(inst.id)!,
                  instCount == 1,
                ),
            if (localAppInsts.isEmpty)
              ListTile(
                title: ElevatedButton(
                  onPressed: () async {
                    unawaited(
                      showDialog(
                        context: context,
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<GeburaBloc>(),
                            child: NewLocalAppInstDialog(
                              app: app,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('添加安装位置'),
                ),
              ),
            if (appInsts[app]!.length > localAppInsts.length)
              ListTile(
                title: Text(
                    '${appInsts[app]!.length - localAppInsts.length} 个在其他设备上'),
              ),
          ],
        );

        listTiles.add(listTile);
      }

      if (state.ownedApps!
          .any((element) => element.assignedAppInfoId.id == item.id.id)) {
        listTiles.add(
          ListTile(
            title: ElevatedButton(
              onPressed: () async {
                unawaited(
                  showDialog(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<GeburaBloc>(),
                        child: NewLocalAppInstDialog(
                          app: state.ownedApps!.firstWhere(
                            (element) =>
                                element.assignedAppInfoId.id == item.id.id,
                          ),
                          newAppWithSameInfo: true,
                        ),
                      );
                    },
                  ),
                );
              },
              child: const Text('添加应用版本'),
            ),
          ),
        );
      }

      return ListView(
        shrinkWrap: true,
        children: listTiles,
      );
    });
  }
}
