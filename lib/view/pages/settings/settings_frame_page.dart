import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/expand_rail_tile.dart';
import '../../widgets/rail_tile.dart';

class SettingsFramePage extends StatelessWidget {
  const SettingsFramePage(
      {super.key, required this.function, required this.functionPage});

  final String function;
  final Widget functionPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 256,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceTint
                          .withAlpha(24),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        RailTile(
                          onTap: () {
                            GoRouter.of(context).go('/app/Settings/client');
                          },
                          title: const Text('客户端设置'),
                          selected: function == 'client',
                        ),
                        ExpandRailTile(
                          title: const Text(
                            '管理区域',
                          ),
                          childrenPadding: const EdgeInsets.only(left: 12),
                          children: [
                            RailTile(
                              title: const Text('用户管理'),
                              onTap: () {
                                GoRouter.of(context).go('/app/Settings/user');
                              },
                              selected: function == 'user',
                            ),
                            RailTile(
                              title: const Text('应用管理'),
                              onTap: () {
                                GoRouter.of(context).go('/app/Settings/app');
                              },
                              selected: function == 'app',
                            ),
                            RailTile(
                              title: const Text('应用包管理'),
                              onTap: () {
                                GoRouter.of(context)
                                    .go('/app/Settings/appPackage');
                              },
                              selected: function == 'appPackage',
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color:
                //     Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
                //     borderRadius: BorderRadius.circular(kToolbarHeight),
                //   ),
                //   margin: const EdgeInsets.all(8),
                //   child: RailTile(
                //     leading: Icon(
                //       Icons.rss_feed,
                //     ),
                //     onTap: () {
                //       GoRouter.of(context).go("/app/Yesod/config");
                //     },
                //     title: const Text("Feed Config"),
                //     selected: function == "config",
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: functionPage,
            ),
          ),
        ],
      ),
    );
  }
}
