import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../route.dart';
import '../../layout/overlapping_panels.dart';

class SettingsNav extends StatelessWidget {
  const SettingsNav({super.key, required this.function});

  final String function;

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
                        ListTile(
                          onTap: () {
                            const SettingsFunctionRoute(
                                    SettingsFunctions.client)
                                .go(context);
                            OverlappingPanels.of(context)
                                ?.reveal(RevealSide.main);
                          },
                          title: const Text('客户端设置'),
                          selected: function == 'client',
                        ),
                        ListTile(
                          onTap: () {
                            const SettingsFunctionRoute(
                                    SettingsFunctions.session)
                                .go(context);
                            OverlappingPanels.of(context)
                                ?.reveal(RevealSide.main);
                          },
                          title: const Text('登录设备管理'),
                          selected: function == 'session',
                        ),
                        ExpansionTile(
                          title: const Text(
                            '通知设置',
                          ),
                          childrenPadding: const EdgeInsets.only(left: 12),
                          children: [
                            ListTile(
                              title: const Text('Token管理'),
                              onTap: () {
                                const SettingsFunctionRoute(
                                        SettingsFunctions.notifyTarget)
                                    .go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'notifyTarget',
                            ),
                            ListTile(
                              title: const Text('规则管理'),
                              onTap: () {
                                const SettingsFunctionRoute(
                                        SettingsFunctions.notifyFlow)
                                    .go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'notifyFlow',
                            ),
                          ],
                        ),
                        if (state.currentUser!.type == UserType.USER_TYPE_ADMIN)
                          ExpansionTile(
                            title: const Text(
                              '管理区域',
                            ),
                            childrenPadding: const EdgeInsets.only(left: 12),
                            children: [
                              ListTile(
                                title: const Text('插件管理'),
                                onTap: () {
                                  const SettingsFunctionRoute(
                                          SettingsFunctions.porter)
                                      .go(context);
                                  OverlappingPanels.of(context)
                                      ?.reveal(RevealSide.main);
                                },
                                selected: function == 'porter',
                              ),
                              ListTile(
                                title: const Text('用户管理'),
                                onTap: () {
                                  const SettingsFunctionRoute(
                                          SettingsFunctions.user)
                                      .go(context);
                                  OverlappingPanels.of(context)
                                      ?.reveal(RevealSide.main);
                                },
                                selected: function == 'user',
                              ),
                              ListTile(
                                title: const Text('应用管理'),
                                onTap: () {
                                  const SettingsFunctionRoute(
                                          SettingsFunctions.app)
                                      .go(context);
                                  OverlappingPanels.of(context)
                                      ?.reveal(RevealSide.main);
                                },
                                selected: function == 'app',
                              ),
                              ListTile(
                                title: const Text('应用包管理'),
                                onTap: () {
                                  const SettingsFunctionRoute(
                                          SettingsFunctions.appPackage)
                                      .go(context);
                                  OverlappingPanels.of(context)
                                      ?.reveal(RevealSide.main);
                                },
                                selected: function == 'appPackage',
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
            ListTile(
              onTap: () {
                const SettingsFunctionRoute(SettingsFunctions.about)
                    .go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: const Text('关于'),
              selected: function == 'about',
            ),
          ],
        );
      },
    );
  }
}
