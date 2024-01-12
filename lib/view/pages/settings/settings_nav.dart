import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../route.dart';
import '../../components/expand_rail_tile.dart';
import '../../components/rail_tile.dart';
import '../../layout/overlapping_panels.dart';

class SettingsNav extends StatelessWidget {
  const SettingsNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      RailTile(
                        onTap: () {
                          AppRoutes.settingsClient.go(context);
                          OverlappingPanels.of(context)
                              ?.reveal(RevealSide.main);
                        },
                        title: const Text('客户端设置'),
                        selected: function == 'client',
                      ),
                      RailTile(
                        onTap: () {
                          AppRoutes.settingsSession.go(context);
                          OverlappingPanels.of(context)
                              ?.reveal(RevealSide.main);
                        },
                        title: const Text('登录设备管理'),
                        selected: function == 'session',
                      ),
                      ExpandRailTile(
                        title: const Text(
                          '通知设置',
                        ),
                        childrenPadding: const EdgeInsets.only(left: 12),
                        children: [
                          RailTile(
                            title: const Text('Token管理'),
                            onTap: () {
                              AppRoutes.notifyTarget.go(context);
                              OverlappingPanels.of(context)
                                  ?.reveal(RevealSide.main);
                            },
                            selected: function == 'notifyTarget',
                          ),
                          RailTile(
                            title: const Text('规则管理'),
                            onTap: () {
                              AppRoutes.notifyFlow.go(context);
                              OverlappingPanels.of(context)
                                  ?.reveal(RevealSide.main);
                            },
                            selected: function == 'notifyFlow',
                          ),
                        ],
                      ),
                      if (state.currentUser!.type == UserType.USER_TYPE_ADMIN)
                        ExpandRailTile(
                          title: const Text(
                            '管理区域',
                          ),
                          childrenPadding: const EdgeInsets.only(left: 12),
                          children: [
                            RailTile(
                              title: const Text('插件管理'),
                              onTap: () {
                                AppRoutes.settingsPorter.go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'porter',
                            ),
                            RailTile(
                              title: const Text('用户管理'),
                              onTap: () {
                                AppRoutes.settingsUser.go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'user',
                            ),
                            RailTile(
                              title: const Text('应用管理'),
                              onTap: () {
                                AppRoutes.settingsApp.go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'app',
                            ),
                            RailTile(
                              title: const Text('应用包管理'),
                              onTap: () {
                                AppRoutes.settingsAppPackage.go(context);
                                OverlappingPanels.of(context)
                                    ?.reveal(RevealSide.main);
                              },
                              selected: function == 'appPackage',
                            ),
                          ],
                        )
                      else
                        const SizedBox(),
                      const Expanded(child: SizedBox()),
                      RailTile(
                        onTap: () {
                          AppRoutes.settingsAbout.go(context);
                          OverlappingPanels.of(context)
                              ?.reveal(RevealSide.main);
                        },
                        title: const Text('关于'),
                        selected: function == 'about',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
