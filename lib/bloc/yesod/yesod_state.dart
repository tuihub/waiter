part of 'yesod_bloc.dart';

class YesodState {
  late List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs;
  late int? feedConfigEditIndex;
  late RssPostItem? feedPreview;

  late List<FeedItemDigest>? feedItemDigests;
  late Map<InternalID, FeedItem>? feedItems;
  late InternalID? selectedFeedItemID;

  YesodState({
    this.feedConfigs,
    this.feedConfigEditIndex,
    this.feedPreview,
    this.feedItemDigests,
    this.feedItems,
    this.selectedFeedItemID,
  });

  YesodState copyWith({
    List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
    int? feedConfigEditIndex,
    RssPostItem? feedPreview,
    List<FeedItemDigest>? feedItemDigests,
    Map<InternalID, FeedItem>? feedItems,
    InternalID? selectedFeedItemID,
  }) {
    return YesodState(
      feedConfigs: feedConfigs ?? this.feedConfigs,
      feedConfigEditIndex: feedConfigEditIndex ?? this.feedConfigEditIndex,
      feedPreview: feedPreview ?? this.feedPreview,
      feedItemDigests: feedItemDigests ?? this.feedItemDigests,
      feedItems: feedItems ?? this.feedItems,
      selectedFeedItemID: selectedFeedItemID ?? this.selectedFeedItemID,
    );
  }

  void _from(YesodState other) {
    feedConfigs = other.feedConfigs;
    feedConfigEditIndex = other.feedConfigEditIndex;
    feedPreview = other.feedPreview;
    feedItemDigests = other.feedItemDigests;
    feedItems = other.feedItems;
    selectedFeedItemID = other.selectedFeedItemID;
  }
}

class YesodConfigLoadState extends YesodState with YesodRequest {
  YesodConfigLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final YesodRequestStatusCode statusCode;
}

class YesodConfigPreviewState extends YesodState with YesodRequest {
  YesodConfigPreviewState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final YesodRequestStatusCode statusCode;
}

class YesodConfigAddState extends YesodState with YesodRequest {
  YesodConfigAddState(YesodState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final YesodRequestStatusCode statusCode;
}

class YesodConfigEditState extends YesodState with YesodRequest {
  YesodConfigEditState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final YesodRequestStatusCode statusCode;
}

class YesodFeedItemDigestLoadState extends YesodState with YesodRequest {
  YesodFeedItemDigestLoadState(YesodState state, this.statusCode,
      {this.currentPage, this.maxPage, this.msg})
      : super() {
    _from(state);
  }

  final int? currentPage;
  final int? maxPage;
  @override
  final String? msg;
  @override
  final YesodRequestStatusCode statusCode;
}

mixin YesodRequest on YesodState {
  YesodRequestStatusCode get statusCode;
  String? get msg;

  bool get processing => statusCode == YesodRequestStatusCode.processing;
  bool get success => statusCode == YesodRequestStatusCode.success;
  bool get partlySuccess => statusCode == YesodRequestStatusCode.partlySuccess;
  bool get failed => statusCode == YesodRequestStatusCode.failed;
}

class YesodRequestStatus {
  final YesodRequestStatusCode code;
  final String? msg;

  YesodRequestStatus(this.code, {this.msg});
}

enum YesodRequestStatusCode {
  processing,
  success,
  partlySuccess,
  failed;
}

YesodState _initialState() => YesodState();
