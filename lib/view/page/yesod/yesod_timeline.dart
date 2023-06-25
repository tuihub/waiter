import 'package:animations/animations.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/common/base/dependeny.dart';
import 'package:waitress/view/page/yesod/yesod_detail.dart';

import '../../widget/extentions/grid_delegated.dart';

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

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      print(response.getData().groups.length);
      return response.getData().groups.isEmpty
          ? const Center(
              child: Text("空空如也"),
            )
          : FeedItemList(data: response.getData());
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  void loadTimeline() {
    doRequest(
      request: (client, option) {
        client.getBatchFeedItems(GetBatchFeedItemsRequest());
        return client.groupFeedItems(
          GroupFeedItemsRequest(
            groupBy: GroupFeedItemsRequest_GroupBy.GROUP_BY_DAY,
            groupSize: 10,
          ),
          options: option,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: _buildStatePage()),
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
  });

  final cardWith = 384.0;
  final cardHeight = 128.0;

  final GroupFeedItemsResponse data;

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
    required this.cardHeight,
    required this.cardWith,
  });

  final GroupFeedItemsResponse_FeedItemsGroup group;
  final double cardHeight;
  final double cardWith;

  @override
  State<YesodFeedGroup> createState() => _YesodFeedGroupState();
}

class _YesodFeedGroupState extends State<YesodFeedGroup> {
  bool loading = false;

  List<FeedItem> feedItems = [];

  bool isSuccess = false;

  bool get isError => !isSuccess;

  Future<void> loadFeedList() async {
    setState(() {
      loaded = true;
    });
    try {
      final result = await AppDependency.instance.yesodRepo
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
      loadFeedList();
    }
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              DateUtil.formatDate(widget.group.timeRange.startTime.toDateTime(),
                  format: DateFormats.zh_y_mo_d),
              style: const TextStyle(
                fontSize: 20,
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Center(
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
                return YesodDetailPage(item: item);
              },
              openColor: theme.colorScheme.primary,
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              closedElevation: 0,
              closedColor: theme.cardColor,
              closedBuilder: (context, openContainer) {
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
                          child: Row(children: [
                            item.hasImage()
                                ? SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(item.image.url),
                                  )
                                : Image.network(
                                    width: 64,
                                    height: 64,
                                    "https://docs.rsshub.app/logo.png",
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
                                        color: Theme.of(context).disabledColor),
                                    maxLines: 2,
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
                                  Text(
                                    item.image.title,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 10,
                                        color: Theme.of(context).disabledColor),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ]),
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
