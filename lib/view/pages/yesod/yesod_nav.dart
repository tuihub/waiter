import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../layout/overlapping_panels.dart';
import '../../universal/list.dart';
import '../../universal/spacing.dart';

class YesodNav extends StatelessWidget {
  const YesodNav({super.key, required this.function});

  final YesodFunctions function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      return Column(
        children: [
          UniversalListTile(
            leading: const Icon(Icons.feed),
            onTap: () {
              context.read<YesodBloc>().add(YesodFeedItemListConfigSetEvent(
                    (state.listConfig ?? const YesodFeedItemListConfig())
                        .copyWith(
                      feedIdFilter: [],
                    ),
                  ));
              const YesodFunctionRoute(YesodFunctions.recent).go(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).allArticles),
            selected: function == YesodFunctions.recent &&
                (state.listConfig?.feedIdFilter?.isEmpty ?? true),
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
          Expanded(
            child: _YesodFeedList(function: function),
          ),
          Material(
            child: UniversalExpansionTile(
                leading: const Icon(Icons.auto_awesome),
                title: Text(S.of(context).automation),
                children: [
                  UniversalListTile(
                    leading: const Icon(
                      Icons.featured_play_list,
                    ),
                    onTap: () {
                      const YesodFunctionRoute(
                              YesodFunctions.notifyTargetManage)
                          .go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.main);
                    },
                    title: Text(S.of(context).notifyTargetManage),
                    selected: function == YesodFunctions.notifyTargetManage,
                  ),
                  UniversalListTile(
                    leading: const Icon(
                      FontAwesomeIcons.codeFork,
                    ),
                    onTap: () {
                      const YesodFunctionRoute(YesodFunctions.notifyFlowManage)
                          .go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.main);
                    },
                    title: Text(S.of(context).notifyFlowManage),
                    selected: function == YesodFunctions.notifyFlowManage,
                  ),
                  SpacingHelper.defaultDivider,
                  UniversalListTile(
                    leading: const Icon(
                      Icons.filter_list,
                    ),
                    onTap: () {
                      const YesodFunctionRoute(YesodFunctions.actionManage)
                          .go(context);
                      OverlappingPanels.of(context)?.reveal(RevealSide.main);
                    },
                    title: Text(S.of(context).feedActionSetManage),
                    selected: function == YesodFunctions.actionManage,
                  ),
                ]),
          ),
          UniversalListTile(
            leading: const Icon(
              Icons.rss_feed,
            ),
            onTap: () {
              const YesodFunctionRoute(YesodFunctions.feedManage).go(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).feedConfigManage),
            selected: function == YesodFunctions.feedManage,
          ),
        ],
      );
    });
  }
}

class _YesodFeedList extends StatelessWidget {
  const _YesodFeedList({required this.function});

  final YesodFunctions function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(
      builder: (context, state) {
        final feedConfigs = state.feedConfigs ?? [];
        return DynMouseScroll(builder: (context, controller, physics) {
          return ListView(
            controller: controller,
            physics: physics,
            children: [
              for (final feedConfig in feedConfigs)
                UniversalListTile(
                  leading: Container(
                    decoration: feedConfig.feed.image.url.isEmpty
                        ? const BoxDecoration()
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: ExtendedNetworkImageProvider(
                                feedConfig.feed.image.url,
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                    height: 24,
                    width: 24,
                  ),
                  onTap: () {
                    context
                        .read<YesodBloc>()
                        .add(YesodFeedItemListConfigSetEvent(
                          (state.listConfig ?? const YesodFeedItemListConfig())
                              .copyWith(
                            feedIdFilter: [feedConfig.config.id.id.toString()],
                          ),
                        ));
                    const YesodFunctionRoute(YesodFunctions.recent).go(context);
                    OverlappingPanels.of(context)?.reveal(RevealSide.main);
                  },
                  title: Text(feedConfig.config.name.isNotEmpty
                      ? feedConfig.config.name
                      : feedConfig.feed.title),
                  selected: function == YesodFunctions.recent &&
                      feedConfig.config.id.id != 0 &&
                      state.listConfig?.feedIdFilter?.singleOrNull ==
                          feedConfig.config.id.id.toString(),
                ),
            ],
          );
        });
      },
    );
  }
}
