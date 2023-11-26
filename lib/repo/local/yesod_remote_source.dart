part of '../local/yesod_repo.dart';

class YesodRemoteSource implements YesodSource {
  @override
  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids) async {
    if (ids == null || ids.isEmpty) {
      return [];
    }
    final response = await GetIt.I<ApiHelper>().doRequest(
      (client) => client.getBatchFeedItems,
      GetBatchFeedItemsRequest(
        ids: ids,
      ),
    );
    if (kDebugMode) {
      print(
          'retrive ${response.data?.items} items from remotessssssssssssssssssssss');
    }
    return response.data?.items ?? [];
  }

  @override
  Future<List<String>> getFeedCategories() async {
    final response = await GetIt.I<ApiHelper>().doRequest(
      (client) => client.listFeedConfigCategories,
      ListFeedConfigCategoriesRequest(),
    );
    return response.data?.categories ?? [];
  }
}
