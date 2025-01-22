import 'dart:convert';

import 'package:dao/dao.dart';
import 'package:hive/hive.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_io/io.dart';

import '../model/yesod_model.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

const _feedItemCacheBoxFile = 'yesod_feed_item_cache';

class YesodRepo {
  late final LazyBox<String> _feedItemCacheBox;
  final YesodDao _dao;
  final DIProvider<LibrarianService> _api;
  final KVDao _kvDao;

  static const _kvBucket = 'yesod';

  static const _kFeedItemListConfig = 'feedItemListConfig';

  YesodRepo._(this._dao, this._api, this._kvDao, this._feedItemCacheBox);

  static Future<YesodRepo> init(YesodDao dao, DIProvider<LibrarianService> api,
      KVDao kvDao, String path) async {
    final feedItemCacheBox =
        await Hive.openLazyBox<String>(_feedItemCacheBoxFile, path: path);
    return YesodRepo._(dao, api, kvDao, feedItemCacheBox);
  }

  Future<void> dispose() async {
    await _feedItemCacheBox.close();
  }

  Future<void> setFeedItemListConfig(YesodFeedItemListConfig data) {
    return _kvDao.set(
        _kvBucket, _kFeedItemListConfig, jsonEncode(data.toJson()));
  }

  Future<YesodFeedItemListConfig> getFeedItemListConfig() async {
    try {
      final data = await _kvDao.get(_kvBucket, _kFeedItemListConfig);
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
    return _dao.setAll(
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
      final data = await _dao.getAll();
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
