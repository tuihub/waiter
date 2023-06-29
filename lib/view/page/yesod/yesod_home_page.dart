import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/expand_rail_tile.dart';
import '../../widget/rail_tile.dart';

class YesodHome extends StatelessWidget {
  const YesodHome(
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
                          leading: Icon(
                            Icons.timeline,
                          ),
                          onTap: () {
                            GoRouter.of(context).go("/app/Yesod/timeline");
                          },
                          title: const Text("Timeline"),
                          selected: function == "timeline",
                        ),
                        ExpandRailTile(
                          title: const Text(
                            "Category",
                          ),
                          childrenPadding: const EdgeInsets.only(left: 12),
                          children: [
                            RailTile(
                              title: const Text("Anime"),
                              onTap: () {},
                            ),
                            RailTile(
                              title: const Text("Anime"),
                            ),
                            RailTile(
                              title: const Text("Tech"),
                            ),
                          ],
                        ),
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
                    leading: Icon(
                      Icons.rss_feed,
                    ),
                    onTap: () {
                      GoRouter.of(context).go("/app/Yesod/config");
                    },
                    title: const Text("Feed Config"),
                    selected: function == "config",
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
