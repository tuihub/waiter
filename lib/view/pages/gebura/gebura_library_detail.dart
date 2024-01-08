import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/gebura/gebura_bloc.dart';
import '../../../common/platform.dart';
import '../../../model/gebura_model.dart';
import '../../components/toast.dart';
import '../../helper/spacing.dart';
import 'gebura_app_launcher_setting_dialog.dart';

class GeburaLibraryDetailPage extends StatefulWidget {
  const GeburaLibraryDetailPage({super.key});

  @override
  State<GeburaLibraryDetailPage> createState() =>
      _GeburaLibraryDetailPageState();
}

class _GeburaLibraryDetailPageState extends State<GeburaLibraryDetailPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      lastIndex = null;
    });
    _updateState();
  }

  late int? lastIndex;
  late AppMixed? app;
  late AppLauncherSetting? setting;
  late AppRunState? runState;

  void _updateState() {
    setState(() {
      final state = context.read<GeburaBloc>().state;
      app =
          state.purchasedApps != null && state.selectedPurchasedAppIndex != null
              ? state.purchasedApps![state.selectedPurchasedAppIndex!]
              : null;

      setting = app != null
          ? context.read<GeburaBloc>().getAppLauncherSetting(app!.id)
          : null;

      runState = app != null &&
              state.runState != null &&
              state.runState!.containsKey(app!.id)
          ? state.runState![app!.id]
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state.selectedPurchasedAppIndex != lastIndex) {
          setState(() {
            lastIndex = state.selectedPurchasedAppIndex;
          });
        }
        if (state is GeburaRunAppState && state.msg != null) {
          Toast(title: '', message: state.msg!).show(context);
        }

        _updateState();
      },
      builder: (context, state) {
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
                                  image: ExtendedNetworkImageProvider(
                                    app!.heroImageUrl,
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
                                    Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  app!.name,
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
                                if (setting != null && setting!.path.isNotEmpty)
                                  ElevatedButton(
                                    onPressed: () async {
                                      context
                                          .read<GeburaBloc>()
                                          .add(GeburaRunAppEvent(app!.id));
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
                                  Text('开发商：${app!.details.developer}'),
                                  Text('发行商：${app!.details.publisher}'),
                                  Text('发行日期：${app!.details.releaseDate}'),
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
                                            app!.id.id.toInt(), setting),
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
