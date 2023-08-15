import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../common/api/api_helper.dart';
import '../../../repo/yesod/yesod_repo.dart';
import 'yesod_detail_page.dart';
import 'yesod_preview_card.dart';

class YesodRecentPage extends StatefulWidget {
  const YesodRecentPage({super.key});

  @override
  State<StatefulWidget> createState() => _YesodRecentPageState();
}

class _YesodRecentPageState extends State<YesodRecentPage> {
  FeedItem? selectedItem;
  final ScrollController _detailScrollController = ScrollController();

  Future<void> setSelectedItem(InternalID id) async {
    await _detailScrollController.animateTo(0,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
    final result = await GetIt.I<YesodRepo>().getFeedItem(id);
    setState(() {
      selectedItem = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 450,
            child: YesodRecentList(
              selectCallback: setSelectedItem,
            ),
          ),
          if (selectedItem != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: YesodDetailPage(
                    item: selectedItem!,
                    controller: _detailScrollController,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class YesodRecentList extends StatefulWidget {
  const YesodRecentList({super.key, required this.selectCallback});

  final Future<void> Function(InternalID) selectCallback;

  @override
  State<YesodRecentList> createState() => _YesodRecentListState();
}

class _YesodRecentListState extends State<YesodRecentList> {
  final ScrollController _scrollController = ScrollController();
  Map<int, List<FeedItemDigest>> items = {};
  List<FeedItemDigest> flattenedItems = [];
  int lastPageNum = 0;
  bool pageEnd = false;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    unawaited(loadData(lastPageNum));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (items[lastPageNum] != null && items[lastPageNum]!.isNotEmpty) {
          setState(() {
            lastPageNum++;
          });
        }
        if (items[lastPageNum] == null) {
          unawaited(loadData(lastPageNum));
        } else {
          setState(() {
            pageEnd = true;
          });
        }
      }
    });
  }

  Future<void> loadData(int pageNum) async {
    try {
      final response = await GetIt.I<ApiHelper>().doRequest(
        (client, option) {
          return client.listFeedItems(
            ListFeedItemsRequest(
              paging: PagingRequest(
                pageSize: pageSize,
                pageNum: pageNum + 1,
              ),
            ),
            options: option,
          );
        },
      );
      items[pageNum] = response.getData().items;
      debugPrint(items[pageNum]!.length.toString());
      List<FeedItemDigest> newItemList = [];
      for (var i = 0; i <= pageNum; i++) {
        if (items[i] != null) {
          newItemList += items[i]!;
        }
      }
      debugPrint(newItemList.length.toString());
      setState(() {
        flattenedItems = newItemList;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget _build() {
    if (lastPageNum >= 0) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: flattenedItems.length + 1,
        itemBuilder: (context, index) {
          if (index < flattenedItems.length) {
            final item = flattenedItems[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: YesodPreviewCard(
                name: item.feedConfigName,
                title: item.title,
                callback: () async => {widget.selectCallback(item.itemId)},
                iconUrl: item.feedAvatarUrl,
                images: item.imageUrls,
                description: item.shortDescription,
              ),
            );
          } else {
            return const Text('加载中');
          }
        },
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _build());
  }
}
