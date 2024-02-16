import 'package:flutter/material.dart';

import '../../../route.dart';
import '../../layout/overlapping_panels.dart';

class YesodNav extends StatelessWidget {
  const YesodNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              ListTile(
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
              // const Expanded(child: SizedBox()),
            ],
          ),
        ),
        ListTile(
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
      ],
    );
  }
}
