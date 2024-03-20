part of 'yesod_bloc.dart';

class YesodState {
  // Data from server
  late List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs;
  late List<FeedItemDigest>? feedItemDigests;
  late List<String>? feedCategories;

  // Data for UI
  late RssPostItem? feedPreview;

  YesodState({
    this.feedConfigs,
    this.feedPreview,
    this.feedItemDigests,
    this.feedCategories,
  });

  YesodState copyWith({
    List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
    RssPostItem? feedPreview,
    List<FeedItemDigest>? feedItemDigests,
    List<String>? feedCategories,
  }) {
    return YesodState(
      feedConfigs: feedConfigs ?? this.feedConfigs,
      feedPreview: feedPreview ?? this.feedPreview,
      feedItemDigests: feedItemDigests ?? this.feedItemDigests,
      feedCategories: feedCategories ?? this.feedCategories,
    );
  }

  void _from(YesodState other) {
    feedConfigs = other.feedConfigs;
    feedPreview = other.feedPreview;
    feedItemDigests = other.feedItemDigests;
    feedCategories = other.feedCategories;
  }
}

class YesodConfigLoadState extends YesodState with EventStatusMixin {
  YesodConfigLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodConfigPreviewState extends YesodState with EventStatusMixin {
  YesodConfigPreviewState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodConfigAddState extends YesodState with EventStatusMixin {
  YesodConfigAddState(YesodState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodConfigEditState extends YesodState with EventStatusMixin {
  YesodConfigEditState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedItemDigestLoadState extends YesodState with EventStatusMixin {
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
  final EventStatus statusCode;
}

class YesodFeedItemLoadState extends YesodState with EventStatusMixin {
  YesodFeedItemLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedCategoriesLoadState extends YesodState with EventStatusMixin {
  YesodFeedCategoriesLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}
