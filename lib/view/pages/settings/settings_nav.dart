import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/main_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../layout/overlapping_panels.dart';

class SettingsNav extends StatelessWidget {
  const SettingsNav({super.key, required this.function});

  final SettingsFunctions function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: DynMouseScroll(
                builder: (context, controller, physics) {
                  return SingleChildScrollView(
                    controller: controller,
                    physics: physics,
                    child: Column(
                      children: [
                        UniversalListTile(
                          onTap: () {
                            const SettingsFunctionRoute(
                                    SettingsFunctions.client)
                                .go(context);
                            OverlappingPanels.of(context)
                                ?.reveal(RevealSide.main);
                          },
                          title: const Text('客户端设置'),
                          selected: function == SettingsFunctions.client,
                        ),
                        UniversalListTile(
                          onTap: () {
                            const SettingsFunctionRoute(
                                    SettingsFunctions.server)
                                .go(context);
                            OverlappingPanels.of(context)
                                ?.reveal(RevealSide.main);
                          },
                          title: const Text('服务端选择'),
                          selected: function == SettingsFunctions.server,
                        ),
                        if (state.isNotLocal)
                          UniversalListTile(
                            onTap: () {
                              const SettingsFunctionRoute(
                                      SettingsFunctions.session)
                                  .go(context);
                              OverlappingPanels.of(context)
                                  ?.reveal(RevealSide.main);
                            },
                            title: const Text('登录设备管理'),
                            selected: function == SettingsFunctions.session,
                          ),
                        if (state.isNotLocal)
                          UniversalListTile(
                            onTap: () {
                              const SettingsFunctionRoute(
                                      SettingsFunctions.porterContext)
                                  .go(context);
                              OverlappingPanels.of(context)
                                  ?.reveal(RevealSide.main);
                            },
                            title: Text(S.of(context).pluginContextManage),
                            selected:
                                function == SettingsFunctions.porterContext,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            UniversalListTile(
              onTap: () {
                const SettingsFunctionRoute(SettingsFunctions.about)
                    .go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: const Text('关于'),
              selected: function == SettingsFunctions.about,
            ),
          ],
        );
      },
    );
  }
}
