import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:open_file/open_file.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/util/platform.dart';
import '../../../repo/gebura/gebura_repo.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import 'gebura_app_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatelessWidget {
  const GeburaLibraryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final app =
          state.purchasedApps != null && state.selectedPurchasedAppIndex != null
              ? state.purchasedApps![state.selectedPurchasedAppIndex!]
              : null;
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: app == null
            ? const Center(
                child: Text('未选择应用'),
              )
            : SingleChildScrollView(
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
                                image: CachedNetworkImageProvider(
                                  app.heroImageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            // margin: EdgeInsets.all(32),
                            height: 400,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.center,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  const Color.fromRGBO(0, 0, 0, 0),
                                  Theme.of(context).colorScheme.surfaceVariant,
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                app.name,
                                style: TextStyle(
                                  fontSize: 52,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        blurRadius: 3)
                                  ],
                                ),
                              ),
                            ),
                          )
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
                              ElevatedButton(
                                onPressed: () async {
                                  final setting = await GetIt.I<GeburaRepo>()
                                      .getLauncherSetting(app.id.id.toInt());
                                  if (setting == null || setting.path.isEmpty) {
                                    if (context.mounted) {
                                      const Toast(
                                              title: '',
                                              message: '未设置应用路径，请完成设置')
                                          .show(context);
                                    }
                                  } else {
                                    await OpenFile.open(setting.path);
                                  }
                                },
                                child: const Text('启动游戏'),
                              ),
                            const SizedBox(
                              width: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('开发商：${app.details.developer}'),
                                Text('发行商：${app.details.publisher}'),
                                Text('发行日期：${app.details.releaseDate}'),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            if (PlatformHelper.isWindowsApp())
                              ElevatedButton(
                                onPressed: () {
                                  unawaited(showDialog<void>(
                                    context: context,
                                    builder: (context) =>
                                        GeburaAppLauncherSettingDialog(
                                      appID: app.id.id.toInt(),
                                    ),
                                  ));
                                },
                                child: const Icon(Icons.settings),
                              )
                          ],
                        ),
                      ),
                    ),
                    SpacingHelper.defaultDivider,
                    // Padding(
                    //   padding: const EdgeInsets.all(8),
                    //   child: Text(data.app.shortDescription),
                    // ),
                  ],
                ),
              ),
      );
    });
  }
}
