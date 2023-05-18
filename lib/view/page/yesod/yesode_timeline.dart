import 'package:animations/animations.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:waitress/common/base/base_rest_mixins.dart';
import 'package:waitress/view/page/yesod/yesod_detail.dart';

import '../../widget/extentions/grid_delegated.dart';

class YesodeTimelinePage extends StatefulWidget {
  const YesodeTimelinePage({super.key});

  @override
  State<YesodeTimelinePage> createState() => _YesodeTimelinePageState();
}

class _YesodeTimelinePageState extends State<YesodeTimelinePage>
    with SingleRequestMixin<YesodeTimelinePage, GroupFeedItemsResponse> {
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
      body: Row(
        children: [
          Expanded(
            child: _buildStatePage(),
          ),
          // SizedBox(
          //   width: 100,
          //   child: TimelineSlider(),
          // ),
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
  });

  final cardWith = 384.0;
  final cardHeight = 128.0;

  final GroupFeedItemsResponse data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final group = data.groups.elementAt(index);
              return Padding(
                padding: const EdgeInsets.only(right: 8),
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

class _YesodFeedGroupState extends State<YesodFeedGroup>
    with SingleRequestMixin<YesodFeedGroup, GetBatchFeedItemsResponse> {
  void loadFeedList() {
    doRequest(
      request: (client, option) {
        return client.getBatchFeedItems(
          GetBatchFeedItemsRequest(
            ids: widget.group.items.map((e) => e.itemId).toList(),
          ),
          options: option,
        );
      },
    ).then((value) {
      setState(() {
        loaded = true;
      });
    });
  }

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      loadFeedList();
    }
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
        isSuccess
            ? GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMinCrossAxisExtent(
                  mainAxisExtent: widget.cardHeight,
                  minCrossAxisExtent: widget.cardWith,
                ),
                itemCount: response.getData().items.length,
                itemBuilder: (context, index) {
                  final item = response.getData().items.elementAt(index);
                  final theme = Theme.of(context);
                  return OpenContainer(
                    openBuilder: (context, closedContainer) {
                      return YesodeDetailPage(item: item);
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
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
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
                                            child:
                                                Image.network(item.image.url),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.link,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 10,
                                                color: Theme.of(context)
                                                    .disabledColor),
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
                                                color: Theme.of(context)
                                                    .disabledColor),
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
                        ),
                      );
                    },
                  );
                },
              )
            : Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
                height: 200,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ],
    );
  }
}
