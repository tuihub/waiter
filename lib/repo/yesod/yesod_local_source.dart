part of 'yesod_repo.dart';

class YesodLocalSource implements YesodSource {
  late CacheDao _cacheDao;

  YesodLocalSource(Box<String> cacheBox) {
    _cacheDao = CacheDao(cacheBox);
  }

  Iterable<InternalID> checkCached(Iterable<InternalID>? ids) {
    if (ids == null) {
      return const Iterable.empty();
    }
    return ids.where((id) => _cacheDao.exist(id.id.toString()));
  }

  void cacheFeedItem(FeedItem item) {
    _cacheDao.set(item.id.id.toString(), item.writeToJson());
  }

  void cacheFeedItems(Iterable<FeedItem>? items) {
    if (items == null) {
      return;
    }
    for (final item in items) {
      cacheFeedItem(item);
    }
  }

  @override
  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids) async {
    if (ids == null || ids.isEmpty) {
      return [];
    }
    final List<FeedItem> cacheList = [];
    for (final id in ids) {
      final cached = _cacheDao.get(id.id.toString());
      if (cached != null) {
        final cachedObj = FeedItem.fromJson(cached);
        cacheList.add(cachedObj);
      }
    }
    if (kDebugMode) {
      print('recover ${cacheList.length} items from cache');
    }
    return cacheList;
  }
}
