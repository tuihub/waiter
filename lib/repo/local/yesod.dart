import 'package:hive/hive.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:universal_io/io.dart';

const _feedItemCacheBoxFile = 'yesod_feed_item_cache';

class YesodRepo {
  late Box<String> _feedItemCacheBox;
  late String _path;

  YesodRepo._init(Box<String> box) {
    _feedItemCacheBox = box;
  }

  static Future<YesodRepo> init(String path) async {
    final box = await Hive.openBox<String>(_feedItemCacheBoxFile, path: path);
    return YesodRepo._init(box);
  }

  Future<void> setFeedItem(InternalID id, FeedItem data) {
    return _feedItemCacheBox.put(id.toString(), data.writeToJson());
  }

  FeedItem? getFeedItem(InternalID id) {
    final data = _feedItemCacheBox.get(id.toString());
    if (data != null) {
      return FeedItem.fromJson(data);
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
