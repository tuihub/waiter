import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/view/page/yesod/yesode_config.dart';
import 'package:waitress/view/page/yesod/yesode_timeline.dart';

import '../../widget/expand_rail_tile.dart';
import '../../widget/rail_tile.dart';

class YesodHome extends StatefulWidget {
  const YesodHome({super.key});

  @override
  State<YesodHome> createState() => _YesodHomeState();
}

class _YesodHomeState extends State<YesodHome> {
  String selectedIndex = "timeline";

  Map<String, Widget> yesodPages = {
    "timeline": YesodeTimelinePage(),
    "config": YesodConfigPage()
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiRequestBloc, ApiRequestState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! YesodState) {
          // context.read<ApiRequestBloc>().add(
          //       LoadFeedConfig(
          //         ListFeedsRequest(
          //           paging: PagingRequest.getDefault(),
          //         ),
          //       ),
          //     );
        }

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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        RailTile(
                          onTap: () {
                            setState(() {
                              selectedIndex = "timeline";
                            });
                          },
                          title: Text("Timeline"),
                          selected: selectedIndex == "timeline",
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
                            setState(() {
                              selectedIndex = "config";
                            });
                          },
                          title: Text("Feed Config"),
                          selected: selectedIndex == "config",
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
              Expanded(child: yesodPages[selectedIndex] ?? SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
