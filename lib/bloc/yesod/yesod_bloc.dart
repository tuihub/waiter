import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

import '../../common/bloc_event_status_mixin.dart';
import '../../l10n/l10n.dart';
import '../../model/yesod_model.dart';
import '../../repo/grpc/api_helper.dart';
import '../../repo/local/yesod.dart';

part 'yesod_event.dart';
part 'yesod_state.dart';

class YesodBloc extends Bloc<YesodEvent, YesodState> {
  final ApiHelper _api;
  final YesodRepo repo;

  YesodBloc(this._api, this.repo) : super(YesodState()) {
    on<YesodInitEvent>((event, emit) async {
      if (state.feedConfigs == null) {
        add(YesodConfigLoadEvent());
      }
      if (state.feedItemDigests == null) {
        add(YesodFeedItemDigestsLoadEvent(1));
      }
      if (state.feedCategories == null) {
        add(YesodFeedCategoriesLoadEvent());
      }
    }, transformer: restartable());

    on<YesodConfigLoadEvent>((event, emit) async {
      emit(YesodConfigLoadState(state, EventStatus.processing));
      final List<ListFeedConfigsResponse_FeedWithConfig> configs = [];

      final resp = await _api.doRequest(
        (client) => client.listFeedConfigs,
        ListFeedConfigsRequest(
          paging: PagingRequest(
            pageSize: Int64(1),
            pageNum: Int64(1),
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigLoadState(state, EventStatus.failed, msg: resp.error));
        return;
      }

      final totalSize = resp.getData().paging.totalSize.toInt();
      const pageSize = 100;
      var failCount = 0;

      for (var pageNum = 1; (pageNum - 1) * pageSize < totalSize; pageNum++) {
        final resp = await _api.doRequest(
          (client) => client.listFeedConfigs,
          ListFeedConfigsRequest(
            paging: PagingRequest(
              pageSize: Int64(pageSize),
              pageNum: Int64(pageNum),
            ),
          ),
        );
        if (resp.status == ApiStatus.success) {
          configs.addAll(resp.getData().feedsWithConfig);
        } else {
          failCount++;
        }
      }

      emit(YesodConfigLoadState(
        state.copyWith(feedConfigs: configs),
        failCount == 0 ? EventStatus.success : EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodConfigPreviewEvent>((event, emit) async {
      emit(YesodConfigPreviewState(
        state.copyWith(feedPreview: null),
        EventStatus.processing,
      ));
      try {
        final response = await http.get(Uri.parse(event.url));
        final data = RssFeed.parse(response.body);

        debugPrint(data.title);

        debugPrint(data.description);

        final subscription = RssSubscription(
            title: data.title!,
            link: event.url,
            description: data.description!,
            iconUrl: '');

        final item = data.items!.first;

        String? imgUrl;

        String description = '';
        if (item.description != null) {
          try {
            final doc = parse(item.description);
            final imgElements = doc.getElementsByTagName('img');
            if (imgElements.isNotEmpty) {
              imgUrl = imgElements.first.attributes['src'];
            }
            doc.querySelectorAll('p,h1,h2,h3,h4,h5,span').forEach((element) {
              description = description + element.text;
            });
            description.replaceAll('\n', ' ');
            debugPrint(description);
          } catch (e) {
            description = item.description!;
          }
        }

        final example = RssPostItem(
          title: item.title,
          link: item.link,
          description: description,
          subscription: subscription,
          image: imgUrl,
        );
        emit(YesodConfigPreviewState(
          state.copyWith(feedPreview: example),
          EventStatus.success,
        ));
      } catch (e) {
        emit(YesodConfigPreviewState(
          state.copyWith(
            feedPreview: RssPostItem(
                subscription: RssSubscription(
                    title: '', link: '', iconUrl: '', description: '')),
          ),
          EventStatus.failed,
          msg: '${S.current.parseFailed} $e',
        ));
      }
    }, transformer: droppable());

    on<YesodConfigAddEvent>((event, emit) async {
      emit(YesodConfigAddState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.doRequest(
        (client) => client.createFeedConfig,
        CreateFeedConfigRequest(
          config: event.config,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigAddState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final configs = [
        ListFeedConfigsResponse_FeedWithConfig(
          config: event.config,
          feed: null,
        )
      ];
      configs.addAll(state.feedConfigs ?? []);
      emit(YesodConfigAddState(
        state.copyWith(feedConfigs: configs),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodConfigEditEvent>((event, emit) async {
      emit(YesodConfigEditState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.doRequest(
        (client) => client.updateFeedConfig,
        UpdateFeedConfigRequest(
          config: event.config,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigEditState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final configs = state.feedConfigs ?? [];
      add(YesodConfigLoadEvent());
      emit(YesodConfigEditState(
        state.copyWith(feedConfigs: configs),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedItemDigestsLoadEvent>((event, emit) async {
      final refresh = event.refresh ?? false;
      const pageSize = 20;
      final pageNum = refresh ? 1 : event.pageNum;

      emit(YesodFeedItemDigestLoadState(
        refresh
            ? state.copyWith(
                feedItemDigests: [],
              )
            : state,
        EventStatus.processing,
      ));
      final listConfig = await repo.getFeedItemListConfig();
      final resp = await _api.doRequest(
        (client) => client.listFeedItems,
        ListFeedItemsRequest(
          paging: PagingRequest(
            pageSize: Int64(pageSize),
            pageNum: Int64(pageNum),
          ),
          feedIdFilter: listConfig.feedIdFilter
              ?.map((e) => InternalID(id: Int64.parseInt(e))),
          categoryFilter: listConfig.categoryFilter,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodFeedItemDigestLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      final List<FeedItemDigest> digests =
          refresh ? [] : state.feedItemDigests ?? [];
      digests.addAll(resp.getData().items);
      emit(YesodFeedItemDigestLoadState(
        state.copyWith(feedItemDigests: digests),
        EventStatus.success,
        currentPage: pageNum,
        maxPage:
            ((resp.getData().paging.totalSize.toInt() - 1) ~/ pageSize) + 1,
      ));
    }, transformer: droppable());

    on<YesodFeedItemLoadEvent>((event, emit) async {
      emit(YesodFeedItemLoadState(
        state,
        EventStatus.processing,
      ));
      if (!repo.existFeedItem(event.id)) {
        final resp = await _api.doRequest(
          (client) => client.getFeedItem,
          GetFeedItemRequest(
            id: event.id,
          ),
        );
        if (resp.status != ApiStatus.success) {
          emit(YesodFeedItemLoadState(
            state,
            EventStatus.failed,
            msg: resp.error,
          ));
          return;
        } else {
          final item = resp.getData().item;
          await repo.setFeedItem(event.id, item);
        }
      }
      emit(YesodFeedItemLoadState(
        state,
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedCategoriesLoadEvent>((event, emit) async {
      emit(YesodFeedCategoriesLoadState(
        state,
        EventStatus.processing,
      ));
      final resp = await _api.doRequest(
        (client) => client.listFeedCategories,
        ListFeedCategoriesRequest(),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodFeedCategoriesLoadState(
          state,
          EventStatus.failed,
          msg: resp.error,
        ));
        return;
      }
      emit(YesodFeedCategoriesLoadState(
        state.copyWith(feedCategories: resp.getData().categories),
        EventStatus.success,
      ));
    }, transformer: droppable());

    on<YesodFeedItemReadEvent>((event, emit) async {
      await _api.doRequest(
        (client) => client.readFeedItem,
        ReadFeedItemRequest(id: event.id),
      );
    });
  }

  int cacheSize() {
    return repo.cacheSize();
  }

  Future<void> clearCache() async {
    await repo.clearCache();
  }
}
