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
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Ink(
                decoration: const BoxDecoration(
                  // color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    RailTile(
                      onTap: () {
                        GoRouter.of(context).go("/app/yesod/timeline");
                      },
                      title: const Text("Timeline"),
                      selected: function == "timeline",
                    ),
                    ExpandRailTile(
                      title: const Text(
                        "Category",
                      ),
                      childrenPadding: const EdgeInsets.only(left: 16),
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
                    Divider(
                      height: 10,
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.outline
                          : Theme.of(context).colorScheme.outlineVariant,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RailTile(
                      onTap: () {
                        GoRouter.of(context).go("/app/Yesod/config");
                      },
                      title: const Text("Feed Config"),
                      selected: function == "config",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).disabledColor,
          ),
          Expanded(child: functionPage),
        ],
      ),
    );
  }
}
