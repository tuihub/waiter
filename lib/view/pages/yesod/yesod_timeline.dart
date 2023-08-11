import 'dart:async';

import 'package:animations/animations.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../../model/yesod_model.dart';
import '../../../common/api/api_mixins.dart';
import '../../../common/util/rss_util.dart';
import '../../../repo/yesod/yesod_repo.dart';
import '../../widgets/extentions/grid_delegated.dart';
import 'yesod_detail.dart';

class YesodTimelinePage extends StatefulWidget {
  const YesodTimelinePage({super.key});

  @override
  State<YesodTimelinePage> createState() => _YesodTimelinePageState();
}

class _YesodTimelinePageState extends State<YesodTimelinePage>
    with SingleRequestMixin<YesodTimelinePage, GroupFeedItemsResponse> {
  @override
  void initState() {
    super.initState();
    loadTimeline();
  }

  GroupFeedItemsRequest_GroupBy groupBy =
      GroupFeedItemsRequest_GroupBy.GROUP_BY_DAY;

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      debugPrint(response.getData().groups.length.toString());
      if (response.getData().groups.isEmpty) {
        return const Center(
          child: Text('空空如也'),
        );
      } else {
        final GroupFeedItemsResponse data = response.getData();
        data.groups.sort((a, b) => -a.timeRange.startTime
            .toDateTime()
            .compareTo(b.timeRange.startTime.toDateTime()));
        return FeedItemList(data: data, groupBy: groupBy);
      }
    }
    if (isError) {
      return Center(
        child: Text('加载失败: ${response.error}'),
      );
    }
    return const SizedBox();
  }

  void loadTimeline() {
    unawaited(doRequest(
      request: (client, option) {
        client.getBatchFeedItems(GetBatchFeedItemsRequest());
        return client.groupFeedItems(
          GroupFeedItemsRequest(
            groupBy: groupBy,
            groupSize: 10,
          ),
          options: option,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 32,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        groupBy = GroupFeedItemsRequest_GroupBy.GROUP_BY_DAY;
                      });
                      loadTimeline();
                    },
                    child: const Text('按天'),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        groupBy = GroupFeedItemsRequest_GroupBy.GROUP_BY_MONTH;
                      });
                      loadTimeline();
                    },
                    child: const Text('按月'),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        groupBy = GroupFeedItemsRequest_GroupBy.GROUP_BY_YEAR;
                      });
                      loadTimeline();
                    },
                    child: const Text('按年'),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: _buildStatePage()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadTimeline,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class FeedItemList extends StatelessWidget {
  const FeedItemList({
    super.key,
    required this.data,
    required this.groupBy,
  });

  static const cardWith = 384.0;
  static const cardHeight = 128.0;

  final GroupFeedItemsResponse data;
  final GroupFeedItemsRequest_GroupBy groupBy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: kToolbarHeight,
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).colorScheme.surfaceTint.withAlpha(24),
        //     borderRadius: BorderRadius.circular(kToolbarHeight),
        //   ),
        //   margin: const EdgeInsets.all(8),
        //   child: Row(
        //     children: [],
        //   ),
        // ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final group = data.groups.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: YesodFeedGroup(
                        group: group,
                        groupBy: groupBy,
                        cardHeight: cardHeight,
                        cardWith: cardWith,
                      ),
                    );
                  },
                  childCount: data.groups.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class YesodFeedGroup extends StatefulWidget {
  const YesodFeedGroup({
    super.key,
    required this.group,
    required this.groupBy,
    required this.cardHeight,
    required this.cardWith,
  });

  final GroupFeedItemsResponse_FeedItemsGroup group;
  final GroupFeedItemsRequest_GroupBy groupBy;
  final double cardHeight;
  final double cardWith;

  @override
  State<YesodFeedGroup> createState() => _YesodFeedGroupState();
}

class _YesodFeedGroupState extends State<YesodFeedGroup> {
  @override
  void initState() {
    super.initState();
    switch (widget.groupBy) {
      case GroupFeedItemsRequest_GroupBy.GROUP_BY_DAY:
        dateFormats = DateFormats.zh_y_mo_d;
      case GroupFeedItemsRequest_GroupBy.GROUP_BY_MONTH:
        dateFormats = DateFormats.zh_y_mo;
      case GroupFeedItemsRequest_GroupBy.GROUP_BY_YEAR:
        dateFormats = 'yyyy年';
      case GroupFeedItemsRequest_GroupBy.GROUP_BY_UNSPECIFIED:
        dateFormats = DateFormats.zh_y_mo_d;
    }
  }

  late String dateFormats;

  bool loading = false;

  List<FeedItem> feedItems = [];

  bool isSuccess = false;

  bool get isError => !isSuccess;

  Future<void> loadFeedList() async {
    setState(() {
      loaded = true;
    });
    try {
      final result = await GetIt.I<YesodRepo>()
          .getBatchFeedItems(widget.group.items.map((e) => e.itemId).toList());
      setState(() {
        loading = false;
        isSuccess = true;
        feedItems = result;
        loaded = true;
      });
    } catch (e) {
      setState(() {
        loading = false;
        isSuccess = false;
        loaded = true;
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      unawaited(loadFeedList());
    }
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              DateUtil.formatDate(widget.group.timeRange.startTime.toDateTime(),
                  format: dateFormats),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMinCrossAxisExtent(
            mainAxisExtent: widget.cardHeight,
            minCrossAxisExtent: widget.cardWith,
            crossAxisSpacing: 4,
          ),
          itemCount: widget.group.items.length,
          itemBuilder: (context, index) {
            if (!loaded || feedItems.isEmpty) {
              return SizedBox(
                height: widget.cardHeight,
                width: widget.cardWith,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              );
            }
            final item = feedItems.elementAt(index);

            return OpenContainer(
              openBuilder: (context, closedContainer) {
                return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: YesodDetailPage(item: item));
              },
              openColor: theme.colorScheme.primary,
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              closedElevation: 0,
              closedColor: theme.cardColor,
              closedBuilder: (context, openContainer) {
                final content = GetIt.I<AbstractContentFormatter>()
                    .format(item.description);
                return SizedBox(
                  height: widget.cardHeight,
                  width: widget.cardWith,
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          openContainer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              if (content is ImgTextContent)
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          content.imgUrl,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  width: 100,
                                  height: 100,
                                ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.link,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                          color:
                                              Theme.of(context).disabledColor),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      content.content,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 10,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
