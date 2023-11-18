import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/api/api_helper.dart';
import '../../store/cache_dao.dart';

part 'yesod_local_source.dart';
part 'yesod_remote_source.dart';

abstract class YesodSource {
  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids);

  Future<List<String>> getFeedCategories();
}

class YesodRepo {
  late final YesodLocalSource _localSource;
  final YesodRemoteSource _remoteSource = YesodRemoteSource();

  YesodRepo(Box<String> cacheBox) {
    _localSource = YesodLocalSource(cacheBox);
  }

  Future<FeedItem> getFeedItem(InternalID id) async {
    final item = await getBatchFeedItems([id].reversed);
    return item[0];
  }

  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids) async {
    final cachedIds = _localSource.checkCached(ids);
    final cachedItems = await _localSource.getBatchFeedItems(cachedIds);
    final remoteIds = ids!.where((id) => !cachedIds.contains(id));
    final remoteItems = await _remoteSource.getBatchFeedItems(remoteIds);
    _localSource.cacheFeedItems(remoteItems);
    return [...cachedItems, ...remoteItems];
  }

  Future<List<String>> getFeedCategories() async {
    return _remoteSource.getFeedCategories();
  }
}
