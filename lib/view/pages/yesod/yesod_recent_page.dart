import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:keframe/keframe.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/yesod/yesod_bloc.dart';
import '../../../repo/yesod/yesod_repo.dart';
import '../../helper/duration_format.dart';
import '../../layout/bootstrap_container.dart';
import 'yesod_detail_page.dart';
import 'yesod_preview_card.dart';

class YesodRecentPage extends StatefulWidget {
  const YesodRecentPage({super.key});

  @override
  State<StatefulWidget> createState() => _YesodRecentPageState();
}

class _YesodRecentPageState extends State<YesodRecentPage> {
  FeedItem? selectedItem;
  int listKey = 0;

  Future<void> setSelectedItem(InternalID id) async {
    final result = await GetIt.I<YesodRepo>().getFeedItem(id);
    setState(() {
      selectedItem = result;
    });
  }

  void _reloadList() {
    setState(() {
      listKey++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: YesodRecentList(
          key: ValueKey(listKey),
          selectCallback: setSelectedItem,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _reloadList,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class YesodRecentList extends StatelessWidget {
  const YesodRecentList({super.key, required this.selectCallback});

  final Future<void> Function(InternalID) selectCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lastPageNum = 0;
    var lastStatus = YesodRequestStatusCode.processing;

    return BlocBuilder<YesodBloc, YesodState>(builder: (context, state) {
      if (state.feedItemDigests == null) {
        context.read<YesodBloc>().add(YesodFeedItemDigestsLoadEvent(1));
      }
      if (state is YesodFeedItemDigestLoadState) {
        lastStatus = state.statusCode;
        if (state.currentPage != null) {
          lastPageNum = state.currentPage!;
        }
      }
      final flattenedItems = state.feedItemDigests ?? [];

      return DynMouseScroll(
        builder: (context, controller, physics) {
          controller.addListener(() {
            if (controller.position.pixels ==
                controller.position.maxScrollExtent) {
              if (lastStatus == YesodRequestStatusCode.success) {
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
              itemCount: flattenedItems.length + 1,
              cacheExtent: MediaQuery.sizeOf(context).height * 2,
              itemBuilder: (context, index) {
                if (index < flattenedItems.length) {
                  final item = flattenedItems[index];

                  return FrameSeparateWidget(
                    index: index,
                    child: BootstrapContainer(children: [
                      BootstrapColumn(
                        xxs: 12,
                        md: 9,
                        lg: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: OpenContainer(
                            openBuilder: (context, closedContainer) {
                              return YesodDetailPage(
                                itemId: item.itemId,
                              );
                            },
                            openColor: theme.colorScheme.primary,
                            closedShape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            closedElevation: 0,
                            closedColor: theme.cardColor,
                            closedBuilder: (context, openContainer) {
                              return YesodPreviewCard(
                                name:
                                    '${item.feedConfigName} ${DurationHelper.recentString(item.publishedParsedTime.toDateTime())}',
                                title: item.title,
                                callback: openContainer,
                                iconUrl: item.feedAvatarUrl,
                                images: item.imageUrls,
                                description: item.shortDescription,
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text('加载中'),
                    ),
                  );
                }
              },
            ),
          );
        },
      );
    });
  }
}
