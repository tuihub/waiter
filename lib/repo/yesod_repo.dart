import 'dart:convert';

import 'package:dao/dao.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../model/common_model.dart';
import '../model/yesod_model.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

class YesodRepo {
  final YesodDao _dao;
  final DIProvider<LibrarianService> _api;
  final KVDao _kvDao;

  static const _kvBucket = 'yesod';

  static const _kFeedItemListConfig = 'feedItemListConfig';

  YesodRepo(this._dao, this._api, this._kvDao);

  Future<void> setFeedItemListConfig(YesodFeedItemListConfig data) {
    return _kvDao.set(_kvBucket, _kFeedItemListConfig, data.toJson());
  }

  Future<YesodFeedItemListConfig> getFeedItemListConfig() async {
    try {
      final data = await _kvDao.get(_kvBucket, _kFeedItemListConfig);
      if (data != null) {
        return YesodFeedItemListConfig.fromJson(data);
      }
    } catch (e) {
      // ignore
    }
    return const YesodFeedItemListConfig();
  }

  Future<void> setFeedItem(EventContext context, InternalID id, FeedItem data) {
    return _dao.addFeedItem(CacheFeedItem(
      serverId: context.serverID.toString(),
      internalId: id.toString(),
      rawJsonData: jsonEncode(data.writeToJson()),
    ));
  }

  Future<FeedItem?> getFeedItem(EventContext context, InternalID id) async {
    final data =
        await _dao.getFeedItem(context.serverID.toString(), id.toString());
    if (data != null) {
      return FeedItem.fromJson(data.rawJsonData);
    }
    return null;
  }

  Future<bool> existFeedItem(EventContext context, InternalID id) async {
    return await getFeedItem(context, id) != null;
  }

  Future<void> setFeedConfigs(
      EventContext context, List<ListFeedConfigsResponse_FeedWithConfig> data) {
    return _dao.saveFeedConfigs(
      data
          .map((e) => CacheFeedConfig(
                serverId: context.serverID.toString(),
                internalId: e.config.id.toString(),
                name: e.config.name,
                category: e.config.category,
                rawJsonData: e.writeToJson(),
              ))
          .toList(),
    );
  }

  Future<List<ListFeedConfigsResponse_FeedWithConfig>> getFeedConfigs(
      EventContext context) async {
    try {
      final data = await _dao.loadFeedConfigs(context.serverID.toString());
      return data
          .map((e) =>
              ListFeedConfigsResponse_FeedWithConfig.fromJson(e.rawJsonData))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
