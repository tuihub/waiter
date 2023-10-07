import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/rail_tile.dart';
import 'yesod_category_list.dart';

class YesodFramePage extends StatelessWidget {
  const YesodFramePage(
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
                          leading: const Icon(
                            Icons.timelapse,
                          ),
                          onTap: () {
                            GoRouter.of(context).go('/app/Yesod/recent');
                          },
                          title: const Text('Recent'),
                          selected: function == 'recent',
                        ),
                        RailTile(
                          leading: const Icon(
                            Icons.timeline,
                          ),
                          onTap: () {
                            GoRouter.of(context).go('/app/Yesod/timeline');
                          },
                          title: const Text('Timeline'),
                          selected: function == 'timeline',
                        ),
                        const YesodCategoryListPage(selectedAppID: ''),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
                    borderRadius: BorderRadius.circular(kToolbarHeight),
                  ),
                  margin: const EdgeInsets.all(8),
                  child: RailTile(
                    leading: const Icon(
                      Icons.rss_feed,
                    ),
                    onTap: () {
                      GoRouter.of(context).go('/app/Yesod/config');
                    },
                    title: const Text('Feed Config'),
                    selected: function == 'config',
                  ),
                ),
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
