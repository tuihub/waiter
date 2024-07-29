import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keframe/keframe.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../common/bloc_event_status_mixin.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../helper/app_bar.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_breakpoints.dart';
import '../../layout/bootstrap_container.dart';
import '../frame_page.dart';
import 'yesod_detail_page.dart';
import 'yesod_preview_card.dart';

class YesodRecentPage extends StatefulWidget {
  const YesodRecentPage({super.key});

  @override
  State<YesodRecentPage> createState() => YesodRecentPageState();
}

class YesodRecentPageState extends State<YesodRecentPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lastPageNum = 0;
    var lastStatus = EventStatus.processing;
    int? maxPageNum;

    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (state.feedItemDigests == null) {
        context.read<YesodBloc>().add(YesodInitEvent());
      }
      if (state is YesodFeedItemDigestLoadState) {
        lastStatus = state.statusCode;
        if (state.currentPage != null) {
          lastPageNum = state.currentPage!;
        }
        maxPageNum = state.maxPage;
      }
      final items = state.feedItemDigests ?? [];

      return Scaffold(
        appBar: AppBar(
          title: const Text('最近更新'),
          shape: AppBarHelper.defaultShape,
          leading: AppBarHelper.defaultMainLeading(context),
          actions: [
            IconButton(
              onPressed: () {
                const YesodRecentRoute(action: YesodRecentActions.setting)
                    .go(context);
                FramePage.of(context)?.openDrawer();
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: DynMouseScroll(
          builder: (context, controller, physics) {
            controller.addListener(() {
              if (controller.position.pixels ==
                  controller.position.maxScrollExtent) {
                if (lastStatus == EventStatus.success &&
                    (maxPageNum == null || lastPageNum < maxPageNum!)) {
                  context
                      .read<YesodBloc>()
                      .add(YesodFeedItemDigestsLoadEvent(lastPageNum + 1));
                }
              }
            });

            return SizeCacheWidget(
              child: ListView.builder(
                controller: controller,
                physics: physics,
                itemCount: items.length + 1,
                cacheExtent: MediaQuery.sizeOf(context).height * 2,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    if ((state.listConfig?.hideRead ?? false) &&
                        items[index].readCount > 0) {
                      return const SizedBox();
                    }
                    final item = items[index];

                    return FrameSeparateWidget(
                      index: index,
                      child: BootstrapContainer(
                          fill: BootstrapSteps.xs,
                          children: [
                            BootstrapColumn(
                                fill: BootstrapSteps.xs,
                                xxs: 12,
                                md: 9,
                                lg: 7,
                                builder: (context, filled) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: OpenContainer(
                                      tappable:
                                          false, // https://github.com/flutter/flutter/issues/74111
                                      openBuilder: (_, __) {
                                        return BlocProvider.value(
                                          value: context.read<YesodBloc>(),
                                          child: YesodDetailPage(
                                            itemId: item.itemId,
                                          ),
                                        );
                                      },
                                      openColor: theme.colorScheme.primary,
                                      closedShape: RoundedRectangleBorder(
                                        borderRadius: filled
                                            ? BorderRadius.zero
                                            : SpacingHelper.defaultBorderRadius,
                                      ),
                                      closedElevation: 0,
                                      closedColor: theme.cardColor,
                                      closedBuilder: (context, openContainer) {
                                        return YesodPreviewCard(
                                          name:
                                              '${item.feedConfigName} ${DurationHelper.recentString(item.publishedParsedTime.toDateTime())}',
                                          title: item.title,
                                          callback: () {
                                            openContainer();
                                            context.read<YesodBloc>().add(
                                                YesodFeedItemReadEvent(
                                                    item.itemId));
                                          },
                                          iconUrl: item.feedAvatarUrl,
                                          images: item.imageUrls,
                                          description: item.shortDescription,
                                          listType:
                                              state.listConfig?.listType ??
                                                  FeedItemListType.card,
                                          cardBorderRadius:
                                              filled ? BorderRadius.zero : null,
                                        );
                                      },
                                    ),
                                  );
                                }),
                          ]),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: maxPageNum != null && maxPageNum == lastPageNum
                            ? const Text('没有了')
                            : const Text('加载中'),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context
              .read<YesodBloc>()
              .add(YesodFeedItemDigestsLoadEvent(1, refresh: true)),
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
