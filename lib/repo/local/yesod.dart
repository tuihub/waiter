import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sentry_hive/sentry_hive.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_io/io.dart';

import '../../dao/database.dart';
import '../../dao/feed_config.dart';
import '../../dao/kv.dart';
import '../../model/yesod_model.dart';

const _feedItemCacheBoxFile = 'yesod_feed_item_cache';

class YesodRepo {
  late LazyBox<String> _feedItemCacheBox;
  late AppDatabase _db;

  YesodRepo._init(
    LazyBox<String> feedItemCacheBox,
    AppDatabase db,
  ) {
    _feedItemCacheBox = feedItemCacheBox;
    _db = db;
  }

  static Future<YesodRepo> init(String path) async {
    final feedItemCacheBox =
        await SentryHive.openLazyBox<String>(_feedItemCacheBoxFile, path: path);
    return YesodRepo._init(
      feedItemCacheBox,
      AppDatabase(path),
    );
  }

  Future<void> dispose() async {
    await _feedItemCacheBox.close();
  }

  Future<void> setFeedItemListConfig(YesodFeedItemListConfig data) {
    return KVDao(_db)
        .set('feedItemListConfig', 'default', jsonEncode(data.toJson()));
  }

  Future<YesodFeedItemListConfig> getFeedItemListConfig() async {
    try {
      final data = await KVDao(_db).get('feedItemListConfig', 'default');
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

  Future<void> setFeedConfigs(
      List<ListFeedConfigsResponse_FeedWithConfig> data) {
    return FeedConfigDao(_db).setAll(
      data
          .map((e) => FeedConfigTableData(
                internalId: e.config.id.toString(),
                name: e.config.name,
                category: e.config.category,
                jsonData: e.writeToJson(),
              ))
          .toList(),
    );
  }

  Future<List<ListFeedConfigsResponse_FeedWithConfig>> getFeedConfigs() async {
    try {
      final data = await FeedConfigDao(_db).getAll();
      return data
          .map((e) =>
              ListFeedConfigsResponse_FeedWithConfig.fromJson(e.jsonData))
          .toList();
    } catch (e) {
      return [];
    }
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
