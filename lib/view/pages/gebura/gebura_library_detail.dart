import 'dart:async';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/platform.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';
import 'gebura_app_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatelessWidget {
  const GeburaLibraryDetailPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaRunAppState && state.msg != null) {
          Toast(title: '', message: state.msg!).show(context);
        }
      },
      builder: (context, state) {
        final app = state.purchasedApps![index];
        final setting =
            context.read<GeburaBloc>().getAppLauncherSetting(app.id);
        final runState =
            state.runState != null && state.runState!.containsKey(app.id)
                ? state.runState![app.id]
                : null;
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
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
                              app.backgroundImageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // margin: EdgeInsets.all(32),
                        height: 400,
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.only(top: 300),
                          decoration: BoxDecoration(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                          ),
                          child: ClipRRect(
                            borderRadius: SpacingHelper.defaultBorderRadius,
                            child: Container(
                              color: Colors.black.withOpacity(0.25),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
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
                              color: Colors.white.withOpacity(0.1),
                              shadows: [
                                Shadow(
                                    color: Colors.white.withOpacity(0.7),
                                    blurRadius: 2)
                              ],
                            ),
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
                              child: Hero(
                                tag: app.id.id.toString(),
                                child: ExtendedImage.network(
                                  app.coverImageUrl,
                                  height: 200,
                                  loadStateChanged: (ExtendedImageState state) {
                                    if (state.extendedImageLoadState ==
                                        LoadState.failed) {
                                      return const SizedBox();
                                    }
                                    return null;
                                  },
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
                      children: [
                        if (PlatformHelper.isWindowsApp())
                          if (setting != null && setting.path.isNotEmpty)
                            ElevatedButton(
                              onPressed: () async {
                                context
                                    .read<GeburaBloc>()
                                    .add(GeburaRunAppEvent(app.id));
                              },
                              child: const Text('启动'),
                            )
                          else
                            const ElevatedButton(
                              onPressed: null,
                              child: Text('启动'),
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
                        const SizedBox(
                          width: 24,
                        ),
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
                        if (PlatformHelper.isWindowsApp())
                          ElevatedButton(
                            onPressed: () {
                              unawaited(showDialog<void>(
                                context: context,
                                builder: (_) => BlocProvider.value(
                                  value: context.read<GeburaBloc>(),
                                  child: GeburaAppLauncherSettingDialog(
                                      app.id.id.toInt(), setting),
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
      },
    );
  }
}
