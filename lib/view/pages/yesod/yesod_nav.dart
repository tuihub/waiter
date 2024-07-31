import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../layout/overlapping_panels.dart';

class YesodNav extends StatelessWidget {
  const YesodNav({super.key, required this.function});

  final String function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.feed),
            onTap: () {
              context.read<YesodBloc>().add(YesodFeedItemListConfigSetEvent(
                    (state.listConfig ?? const YesodFeedItemListConfig())
                        .copyWith(
                      feedIdFilter: [],
                    ),
                  ));
              const YesodRecentRoute().go(context);
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
          ListTile(
            leading: const Icon(
              Icons.auto_awesome,
            ),
            onTap: () {
              const YesodActionManageRoute().go(context);
              OverlappingPanels.of(context)?.reveal(RevealSide.main);
            },
            title: Text(S.of(context).feedActionSetManage),
            selected: function == YesodFunctions.actionManage,
          ),
          ListTile(
            leading: const Icon(
              Icons.rss_feed,
            ),
            onTap: () {
              const YesodFeedManageRoute().go(context);
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

  final String function;

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
                ListTile(
                  leading: Container(
                    decoration: feedConfig.feed.link.isEmpty
                        ? const BoxDecoration()
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: ExtendedNetworkImageProvider(
                                feedConfig.feed.link,
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
                            feedIdFilter: [feedConfig.feed.id.id.toString()],
                          ),
                        ));
                    const YesodRecentRoute().go(context);
                    OverlappingPanels.of(context)?.reveal(RevealSide.main);
                  },
                  title: Text(feedConfig.config.name.isNotEmpty
                      ? feedConfig.config.name
                      : feedConfig.feed.title),
                  selected: function == YesodFunctions.recent &&
                      state.listConfig?.feedIdFilter?.singleOrNull ==
                          feedConfig.feed.id.id.toString(),
                ),
            ],
          );
        });
      },
    );
  }
}
