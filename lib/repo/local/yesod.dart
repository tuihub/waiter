import 'package:isar/isar.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_io/io.dart';

import '../../model/common_model.dart';
import '../../model/yesod_model.dart';

class YesodRepo {
  late Isar _isar;
  late Isar _feedItemIsar;

  YesodRepo._init(
    Isar isar,
    Isar feedItemIsar,
  ) {
    _isar = isar;
    _feedItemIsar = feedItemIsar;
  }

  static Future<YesodRepo> init(String path) async {
    final isar = await Isar.open(
      [
        YesodFeedItemListConfigSchema,
      ],
      directory: path,
      name: 'yesod',
    );
    final feedItemIsar = await Isar.open(
      [KVCollectionSchema],
      directory: path,
      name: 'yesod_feed_item',
    );
    return YesodRepo._init(
      isar,
      feedItemIsar,
    );
  }

  Future<void> dispose() async {
    await _isar.close();
    await _feedItemIsar.close();
  }

  Future<void> setFeedItemListConfig(YesodFeedItemListConfig data) async {
    return _isar.writeTxn(() => _isar.yesodFeedItemListConfigs.put(data));
  }

  YesodFeedItemListConfig? getFeedItemListConfig(int id) {
    return _isar.yesodFeedItemListConfigs.getSync(id);
  }

  Future<void> setFeedItem(FeedItem data) {
    return _feedItemIsar.writeTxn(
        () => _feedItemIsar.kVCollections.put(KVCollection.fromInternalID(
              data.id,
              data.writeToJson(),
            )));
  }

  Future<FeedItem?> getFeedItem(InternalID id) async {
    try {
      final data = await _feedItemIsar.kVCollections
          .get(KVCollection.idFromInternalID(id));
      if (data != null && data.value != null) {
        return FeedItem.fromJson(data.value!);
      }
    } catch (e) {
      // ignore
    }
    return null;
  }

  int cacheSize() {
    if (_feedItemIsar.path != null) {
      try {
        return File(_feedItemIsar.path!).lengthSync();
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  Future<void> clearCache() async {
    await _feedItemIsar.clear();
  }
}
