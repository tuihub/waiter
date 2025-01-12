import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../route.dart';
import '../../helper/connection.dart';
import '../../layout/overlapping_panels.dart';
import 'package:universal_ui/universal_ui.dart';

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
                        if (ConnectionHelper.isNotLocal(context))
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
                        if (ConnectionHelper.isNotLocal(context))
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
                        if (ConnectionHelper.isNotLocal(context))
                          if (state.currentUser!.type ==
                              UserType.USER_TYPE_ADMIN)
                            UniversalExpansionTile(
                              title: const Text(
                                '管理区域',
                              ),
                              childrenPadding: const EdgeInsets.only(left: 12),
                              children: [
                                UniversalListTile(
                                  title: Text(S.of(context).pluginManage),
                                  onTap: () {
                                    const SettingsFunctionRoute(
                                            SettingsFunctions.porter)
                                        .go(context);
                                    OverlappingPanels.of(context)
                                        ?.reveal(RevealSide.main);
                                  },
                                  selected:
                                      function == SettingsFunctions.porter,
                                ),
                                UniversalListTile(
                                  title: const Text('用户管理'),
                                  onTap: () {
                                    const SettingsFunctionRoute(
                                            SettingsFunctions.user)
                                        .go(context);
                                    OverlappingPanels.of(context)
                                        ?.reveal(RevealSide.main);
                                  },
                                  selected: function == SettingsFunctions.user,
                                ),
                                UniversalListTile(
                                  title: const Text('应用管理'),
                                  onTap: () {
                                    const SettingsFunctionRoute(
                                            SettingsFunctions.app)
                                        .go(context);
                                    OverlappingPanels.of(context)
                                        ?.reveal(RevealSide.main);
                                  },
                                  selected: function == SettingsFunctions.app,
                                ),
                                UniversalListTile(
                                  title: const Text('应用包管理'),
                                  onTap: () {
                                    const SettingsFunctionRoute(
                                            SettingsFunctions.appPackage)
                                        .go(context);
                                    OverlappingPanels.of(context)
                                        ?.reveal(RevealSide.main);
                                  },
                                  selected:
                                      function == SettingsFunctions.appPackage,
                                ),
                              ],
                            )
                          else
                            const SizedBox(),
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
