part of 'yesod_repo.dart';

class YesodRemoteSource implements YesodSource {
  @override
  Future<List<FeedItem>> getBatchFeedItems(Iterable<InternalID>? ids) async {
    if (ids == null || ids.isEmpty) {
      return [];
    }
    final response = await GetIt.I<ApiHelper>().doRequest(
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

  @override
  Future<List<String>> getFeedCategories() async {
    final response = await GetIt.I<ApiHelper>().doRequest(
      (client, option) {
        return client.listFeedConfigCategories(
          ListFeedConfigCategoriesRequest(),
          options: option,
        );
      },
    );
    return response.data?.categories ?? [];
  }

  @override
  Future<List<ListFeedConfigsResponse_FeedWithConfig>> listFeedConfigs(
      PagingRequest? paging, Iterable<InternalID>? ids) async {
    final response = await GetIt.I<ApiHelper>().doRequest(
      (client, option) {
        return client.listFeedConfigs(
          ListFeedConfigsRequest(
            paging: paging ??
                PagingRequest(
                  pageSize: ids?.length ?? 1,
                  pageNum: 1,
                ),
            idFilter: ids,
          ),
          options: option,
        );
      },
    );
    return response.data?.feedsWithConfig ?? [];
  }
}
