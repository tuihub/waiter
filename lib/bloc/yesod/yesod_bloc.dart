import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

import '../../common/api/api_helper.dart';
import '../../model/yesod_model.dart';

part 'yesod_event.dart';
part 'yesod_state.dart';

class YesodBloc extends Bloc<YesodEvent, YesodState> {
  final ApiHelper api;

  YesodBloc(this.api) : super(_initialState()) {
    on<YesodConfigLoadEvent>((event, emit) async {
      emit(YesodConfigLoadState(state, YesodRequestStatusCode.processing));
      final List<ListFeedConfigsResponse_FeedWithConfig> configs = [];

      final resp = await api.doRequest(
        (client) => client.listFeedConfigs,
        ListFeedConfigsRequest(
          paging: PagingRequest(
            pageSize: 1,
            pageNum: 1,
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigLoadState(state, YesodRequestStatusCode.failed,
            msg: resp.error));
        return;
      }

      final totalSize = resp.getData().paging.totalSize.toInt();
      const pageSize = 100;
      var failCount = 0;

      for (var pageNum = 1; (pageNum - 1) * pageSize < totalSize; pageNum++) {
        final resp = await api.doRequest(
          (client) => client.listFeedConfigs,
          ListFeedConfigsRequest(
            paging: PagingRequest(
              pageSize: pageSize,
              pageNum: pageNum,
            ),
          ),
        );
        if (resp.status == ApiStatus.success) {
          configs.addAll(resp.getData().feedsWithConfig);
        } else {
          failCount++;
        }
      }

      if (configs.isEmpty) {
        emit(YesodConfigLoadState(state, YesodRequestStatusCode.failed,
            msg: resp.error));
      } else {
        emit(YesodConfigLoadState(
          state.copyWith(feedConfigs: configs),
          failCount == 0
              ? YesodRequestStatusCode.success
              : YesodRequestStatusCode.partlySuccess,
        ));
      }
    }, transformer: droppable());

    on<YesodConfigPreviewEvent>((event, emit) async {
      emit(YesodConfigPreviewState(
        state.copyWith(feedPreview: null),
        YesodRequestStatusCode.processing,
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
          YesodRequestStatusCode.success,
        ));
      } catch (e) {
        emit(YesodConfigPreviewState(
          state.copyWith(
            feedPreview: RssPostItem(
                subscription: RssSubscription(
                    title: '', link: '', iconUrl: '', description: '')),
          ),
          YesodRequestStatusCode.failed,
          msg: '解析失败, $e',
        ));
      }
    }, transformer: droppable());

    on<YesodConfigAddEvent>((event, emit) async {
      emit(YesodConfigAddState(
        state,
        YesodRequestStatusCode.processing,
      ));
      final index = state.feedConfigEditIndex;
      if (index == null) {
        return;
      }
      final resp = await api.doRequest(
        (client) => client.createFeedConfig,
        CreateFeedConfigRequest(
          config: event.config,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigAddState(
          state,
          YesodRequestStatusCode.failed,
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
        YesodRequestStatusCode.success,
      ));
    }, transformer: droppable());

    on<YesodSetConfigEditIndexEvent>((event, emit) async {
      emit(state.copyWith(
        feedConfigEditIndex: event.index,
      ));
    });

    on<YesodConfigEditEvent>((event, emit) async {
      emit(YesodConfigEditState(
        state,
        YesodRequestStatusCode.processing,
      ));
      final index = state.feedConfigEditIndex;
      if (index == null) {
        return;
      }
      final resp = await api.doRequest(
        (client) => client.updateFeedConfig,
        UpdateFeedConfigRequest(
          config: event.config,
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodConfigEditState(
          state,
          YesodRequestStatusCode.failed,
          msg: resp.error,
        ));
        return;
      }
      final configs = state.feedConfigs ?? [];
      configs[index] = ListFeedConfigsResponse_FeedWithConfig(
        config: event.config,
        feed: configs[index].feed,
      );
      emit(YesodConfigEditState(
        state.copyWith(feedConfigs: configs),
        YesodRequestStatusCode.success,
      ));
    }, transformer: droppable());

    on<YesodFeedItemDigestsLoadEvent>((event, emit) async {
      final refresh = event.refresh ?? false;
      const pageSize = 10;
      final pageNum = refresh ? 1 : event.pageNum;

      emit(YesodFeedItemDigestLoadState(
        refresh
            ? state.copyWith(
                feedItemDigests: [],
              )
            : state,
        YesodRequestStatusCode.processing,
      ));
      final resp = await api.doRequest(
        (client) => client.listFeedItems,
        ListFeedItemsRequest(
          paging: PagingRequest(
            pageSize: pageSize,
            pageNum: pageNum,
          ),
        ),
      );
      if (resp.status != ApiStatus.success) {
        emit(YesodFeedItemDigestLoadState(
          state,
          YesodRequestStatusCode.failed,
          msg: resp.error,
        ));
        return;
      }
      final List<FeedItemDigest> digests =
          refresh ? [] : state.feedItemDigests ?? [];
      digests.addAll(resp.getData().items);
      emit(YesodFeedItemDigestLoadState(
        state.copyWith(feedItemDigests: digests),
        YesodRequestStatusCode.success,
        currentPage: pageNum,
        maxPage:
            ((resp.getData().paging.totalSize.toInt() - 1) ~/ pageSize) + 1,
      ));
    }, transformer: droppable());
  }
}
