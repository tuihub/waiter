import 'package:flutter/material.dart';

import '../../../route.dart';
import '../../components/rail_tile.dart';
import '../../layout/overlapping_panels.dart';

class YesodNav extends StatelessWidget {
  const YesodNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
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
                      AppRoutes.yesodRecent.go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.main);
                    },
                    title: const Text('Recent'),
                    selected: function == 'recent',
                  ),
                  // RailTile(
                  //   leading: const Icon(
                  //     Icons.timeline,
                  //   ),
                  //   onTap: () {
                  //     GoRouter.of(context).go('/app/Yesod/timeline');
                  //     OverlappingPanels.of(context)?.reveal(RevealSide.main);
                  //   },
                  //   title: const Text('Timeline'),
                  //   selected: function == 'timeline',
                  // ),
                  // const YesodCategoryListPage(selectedAppID: ''),
                  const Expanded(child: SizedBox()),
                  RailTile(
                    leading: const Icon(
                      Icons.timeline,
                    ),
                    onTap: (){
                      AppRoutes.yesodTimeline.go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.main);
                    },
                    title: const Text('Timeline'),
                    selected: function == 'timeline',
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
              borderRadius: BorderRadius.circular(kToolbarHeight),
            ),
            margin: const EdgeInsets.all(8),
            child: RailTile(
              leading: const Icon(
                Icons.rss_feed,
              ),
              onTap: () {
                AppRoutes.yesodConfig.go(context);
                OverlappingPanels.of(context)?.reveal(RevealSide.main);
              },
              title: const Text('Feed Config'),
              selected: function == 'config',
            ),
          ),
        ],
      ),
    );
  }
}
