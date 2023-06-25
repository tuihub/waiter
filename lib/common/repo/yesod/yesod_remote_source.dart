part of 'yesod_repo.dart';

class YesodRemoteSource implements YesodSource {
  @override
  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids) async {
    if (ids == null || ids.isEmpty) {
      return [];
    }
    final response = await ApiHelper.instance.doRequest(
      (client, option) {
        return client.getBatchFeedItems(
          GetBatchFeedItemsRequest(
            ids: ids,
          ),
          options: option,
        );
      },
    );
    if (kDebugMode) {
      print(
          'retrive ${response.data?.items} items from remotessssssssssssssssssssss');
    }
    return response.data?.items ?? [];
  }
}
