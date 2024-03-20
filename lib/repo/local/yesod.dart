import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sentry_hive/sentry_hive.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_io/io.dart';

import '../../model/yesod_model.dart';

const _yesodCommonBoxFile = 'yesod_common';
const _feedItemCacheBoxFile = 'yesod_feed_item_cache';

const _defaultFeedItemListConfigKey = 'listConfig:default';

class YesodRepo {
  late Box<String> _yesodCommonBox;
  late LazyBox<String> _feedItemCacheBox;

  YesodRepo._init(
    Box<String> yesodCommonBox,
    LazyBox<String> feedItemCacheBox,
  ) {
    _yesodCommonBox = yesodCommonBox;
    _feedItemCacheBox = feedItemCacheBox;
  }

  static Future<YesodRepo> init(String? path) async {
    final feedItemListConfigBox =
        await SentryHive.openBox<String>(_yesodCommonBoxFile, path: path);
    final feedItemCacheBox =
        await SentryHive.openLazyBox<String>(_feedItemCacheBoxFile, path: path);
    return YesodRepo._init(
      feedItemListConfigBox,
      feedItemCacheBox,
    );
  }

  Future<void> dispose() async {
    await _yesodCommonBox.close();
    await _feedItemCacheBox.close();
  }

  Future<void> setFeedItemListConfig(YesodFeedItemListConfig data) {
    return _yesodCommonBox.put(
        _defaultFeedItemListConfigKey, jsonEncode(data.toJson()));
  }

  YesodFeedItemListConfig getFeedItemListConfig() {
    try {
      final data = _yesodCommonBox.get(_defaultFeedItemListConfigKey);
      if (data != null) {
        return YesodFeedItemListConfig.fromJson(
            jsonDecode(data) as Map<String, dynamic>);
      }
    } catch (e) {
      // ignore
    }
    return const YesodFeedItemListConfig();
  }

  Future<void> setFeedItem(InternalID id, FeedItem data) {
    return _feedItemCacheBox.put(id.toString(), data.writeToJson());
  }

  Future<FeedItem?> getFeedItem(InternalID id) async {
    try {
      final data = await _feedItemCacheBox.get(id.toString());
      if (data != null) {
        return FeedItem.fromJson(data);
      }
    } catch (e) {
      // ignore
    }
    return null;
  }

  bool existFeedItem(InternalID id) {
    return _feedItemCacheBox.containsKey(id.toString());
  }

  int cacheSize() {
    if (_feedItemCacheBox.path != null) {
      try {
        return File(_feedItemCacheBox.path!).lengthSync();
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  Future<void> clearCache() async {
    await _feedItemCacheBox.clear();
    await _feedItemCacheBox.compact();
  }
}
