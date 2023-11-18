import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:webfeed_revised/domain/rss_feed.dart';

import '../../common/api/api_helper.dart';
import '../../model/yesod_model.dart';

part 'yesod_state.dart';

class YesodCubit extends Cubit<YesodState> {
  final ApiHelper api;

  YesodCubit(this.api) : super(_initialState());

  Future<void> loadFeedConfigs() async {
    emit(YesodConfigLoadState(state, YesodRequestStatusCode.processing));
    final List<ListFeedConfigsResponse_FeedWithConfig> configs = [];

    final resp = await api.doRequest<ListFeedConfigsResponse>(
      (client, option) => client.listFeedConfigs(
        ListFeedConfigsRequest(
          paging: PagingRequest(
            pageSize: 1,
            pageNum: 1,
          ),
        ),
        options: option,
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
      final resp = await api.doRequest<ListFeedConfigsResponse>(
        (client, option) => client.listFeedConfigs(
          ListFeedConfigsRequest(
            paging: PagingRequest(
              pageSize: pageSize,
              pageNum: pageNum,
            ),
          ),
          options: option,
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
  }

  Future<void> previewFeedConfig(String url) async {
    emit(YesodConfigPreviewState(
      state.copyWith(feedPreview: null),
      YesodRequestStatusCode.processing,
    ));
    try {
      final response = await http.get(Uri.parse(url));
      final data = RssFeed.parse(response.body);

      debugPrint(data.title);

      debugPrint(data.description);

      final subscription = RssSubscription(
          title: data.title!,
          link: url,
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
  }

  Future<void> addFeedConfig(FeedConfig config) async {
    emit(YesodConfigAddState(
      state,
      YesodRequestStatusCode.processing,
    ));
    final index = state.feedConfigEditIndex;
    if (index == null) {
      return;
    }
    final resp = await api.doRequest((client, option) {
      return client.createFeedConfig(
        CreateFeedConfigRequest(
          config: config,
        ),
        options: option,
      );
    });
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
        config: config,
        feed: null,
      )
    ];
    configs.addAll(state.feedConfigs ?? []);
    emit(YesodConfigAddState(
      state.copyWith(feedConfigs: configs),
      YesodRequestStatusCode.success,
    ));
  }

  void setFeedConfigEditIndex(int index) {
    emit(state.copyWith(
      feedConfigEditIndex: index,
    ));
  }

  Future<void> editFeedConfig(FeedConfig config) async {
    emit(YesodConfigEditState(
      state,
      YesodRequestStatusCode.processing,
    ));
    final index = state.feedConfigEditIndex;
    if (index == null) {
      return;
    }
    final resp = await api.doRequest((client, option) {
      return client.updateFeedConfig(
        UpdateFeedConfigRequest(
          config: config,
        ),
        options: option,
      );
    });
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
      config: config,
      feed: configs[index].feed,
    );
    emit(YesodConfigEditState(
      state.copyWith(feedConfigs: configs),
      YesodRequestStatusCode.success,
    ));
  }
}
