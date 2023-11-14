import 'package:bloc/bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/yesod.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../common/api/api_helper.dart';

class YesodState {
  final List<ListFeedConfigsResponse_FeedWithConfig> feedConfigs;
  final int? feedConfigEditIndex;
  final YesodRequestStatus configLoadStatus;
  final YesodRequestStatus configEditStatus;

  final List<FeedItemDigest> feedItemDigests;
  final Map<InternalID, FeedItem> feedItems;

  YesodState(
    this.feedConfigs,
    this.feedConfigEditIndex,
    this.configLoadStatus,
    this.configEditStatus,
    this.feedItemDigests,
    this.feedItems,
  );

  YesodState copyWith({
    List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
    int? feedConfigEditIndex,
    YesodRequestStatus? configLoadStatus,
    YesodRequestStatus? configEditStatus,
    List<FeedItemDigest>? feedItemDigests,
    Map<InternalID, FeedItem>? feedItems,
  }) {
    return YesodState(
      feedConfigs ?? this.feedConfigs,
      feedConfigEditIndex ?? this.feedConfigEditIndex,
      configLoadStatus ?? this.configLoadStatus,
      configEditStatus ?? this.configEditStatus,
      feedItemDigests ?? this.feedItemDigests,
      feedItems ?? this.feedItems,
    );
  }
}

class YesodRequestStatus {
  final YesodRequestStatusCode code;
  final String? msg;

  YesodRequestStatus(this.code, {this.msg});
}

enum YesodRequestStatusCode {
  initial,
  processing,
  success,
  partlySuccess,
  failed;
}

YesodState _initialState() => YesodState(
      [],
      null,
      YesodRequestStatus(YesodRequestStatusCode.initial),
      YesodRequestStatus(YesodRequestStatusCode.initial),
      [],
      {},
    );

class YesodCubit extends Cubit<YesodState> {
  final ApiHelper api;

  YesodCubit(this.api) : super(_initialState());

  Future<void> loadFeedConfigs() async {
    emit(state.copyWith(
      configLoadStatus: YesodRequestStatus(YesodRequestStatusCode.processing),
    ));
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
      emit(state.copyWith(
        configLoadStatus:
            YesodRequestStatus(YesodRequestStatusCode.failed, msg: resp.error),
      ));
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
      emit(state.copyWith(
        configLoadStatus:
            YesodRequestStatus(YesodRequestStatusCode.failed, msg: resp.error),
      ));
    } else {
      emit(state.copyWith(
        feedConfigs: configs,
        configLoadStatus: YesodRequestStatus(failCount == 0
            ? YesodRequestStatusCode.success
            : YesodRequestStatusCode.partlySuccess),
      ));
    }
  }

  void setFeedConfigEditIndex(int index) {
    emit(state.copyWith(
      feedConfigEditIndex: index,
    ));
  }

  Future<void> editFeedConfig(FeedConfig config) async {
    emit(state.copyWith(
      configEditStatus: YesodRequestStatus(YesodRequestStatusCode.processing),
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
      emit(state.copyWith(
        configEditStatus:
            YesodRequestStatus(YesodRequestStatusCode.failed, msg: resp.error),
      ));
      return;
    }
    final configs = state.feedConfigs;
    configs[index] = ListFeedConfigsResponse_FeedWithConfig(
      config: config,
      feed: configs[index].feed,
    );
    emit(state.copyWith(
      feedConfigs: configs,
      configEditStatus: YesodRequestStatus(YesodRequestStatusCode.success),
    ));
  }
}
