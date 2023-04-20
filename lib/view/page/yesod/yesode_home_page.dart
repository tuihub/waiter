import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waitress/view/page/yesod/yesode_config.dart';
import 'package:waitress/view/page/yesod/yesode_timeline.dart';

import '../../widget/expand_rail_tile.dart';
import '../../widget/rail_tile.dart';

class YesodHome extends StatelessWidget {
  YesodHome({super.key, required this.function, required this.functionPage});

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
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    RailTile(
                      onTap: () {
                        GoRouter.of(context).go("/app/yesod/timeline");
                      },
                      title: Text("Timeline"),
                      selected: function == "timeline",
                    ),
                    ExpandRailTile(
                      title: Text(
                        "Category",
                      ),
                      childrenPadding: EdgeInsets.only(left: 16),
                      children: [
                        RailTile(
                          title: Text("Anime"),
                          onTap: () {},
                        ),
                        RailTile(
                          title: Text("Anime"),
                        ),
                        RailTile(
                          title: Text("Tech"),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Divider(
                      height: 10,
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.outline
                          : Theme.of(context).colorScheme.outlineVariant,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RailTile(
                      onTap: () {
                        GoRouter.of(context).go("/app/Yesod/config");
                      },
                      title: Text("Feed Config"),
                      selected: function == "config",
                    ),
                    SizedBox(
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
