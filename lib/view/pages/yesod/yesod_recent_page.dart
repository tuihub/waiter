import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keframe/keframe.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../common/bloc_event_status_mixin.dart';
import '../../../model/yesod_model.dart';
import '../../../route.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_breakpoints.dart';
import '../../layout/bootstrap_container.dart';
import 'yesod_detail_page.dart';
import 'yesod_preview_card.dart';

class YesodRecentPage extends StatelessWidget {
  const YesodRecentPage({super.key});

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

      return DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            title: const Text('最近更新'),
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            actions: [
              IconButton(
                onPressed: () {
                  AppRoutes.yesodRecentFilter().go(context);
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
                      if ((state.feedItemFilter?.hideRead ?? false) &&
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
                                              : SpacingHelper
                                                  .defaultBorderRadius,
                                        ),
                                        closedElevation: 0,
                                        closedColor: theme.cardColor,
                                        closedBuilder:
                                            (context, openContainer) {
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
                                            listType: state.feedListType ??
                                                FeedListType.card,
                                            cardBorderRadius: filled
                                                ? BorderRadius.zero
                                                : null,
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
        ),
      );
    });
  }
}
