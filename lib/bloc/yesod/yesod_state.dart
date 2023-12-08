part of 'yesod_bloc.dart';

class YesodState {
  // Data from server
  late List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs;
  late List<FeedItemDigest>? feedItemDigests;
  late List<String>? feedCategories;
  late Map<InternalID, FeedItem>? feedItems;

  // Data for UI
  late int? feedConfigEditIndex;
  late RssPostItem? feedPreview;
  late InternalID? selectedFeedItemID;
  late YesodFeedItemFilter? feedItemFilter;
  late FeedListType? feedListType;

  YesodState({
    this.feedConfigs,
    this.feedConfigEditIndex,
    this.feedPreview,
    this.feedItemDigests,
    this.feedItems,
    this.selectedFeedItemID,
    this.feedItemFilter,
    this.feedCategories,
    this.feedListType,
  });

  YesodState copyWith({
    List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
    int? feedConfigEditIndex,
    RssPostItem? feedPreview,
    List<FeedItemDigest>? feedItemDigests,
    Map<InternalID, FeedItem>? feedItems,
    InternalID? selectedFeedItemID,
    YesodFeedItemFilter? feedItemFilter,
    List<String>? feedCategories,
    FeedListType? feedListType,
  }) {
    return YesodState(
      feedConfigs: feedConfigs ?? this.feedConfigs,
      feedConfigEditIndex: feedConfigEditIndex ?? this.feedConfigEditIndex,
      feedPreview: feedPreview ?? this.feedPreview,
      feedItemDigests: feedItemDigests ?? this.feedItemDigests,
      feedItems: feedItems ?? this.feedItems,
      selectedFeedItemID: selectedFeedItemID ?? this.selectedFeedItemID,
      feedItemFilter: feedItemFilter ?? this.feedItemFilter,
      feedCategories: feedCategories ?? this.feedCategories,
      feedListType: feedListType ?? this.feedListType,
    );
  }

  void _from(YesodState other) {
    feedConfigs = other.feedConfigs;
    feedConfigEditIndex = other.feedConfigEditIndex;
    feedPreview = other.feedPreview;
    feedItemDigests = other.feedItemDigests;
    feedItems = other.feedItems;
    selectedFeedItemID = other.selectedFeedItemID;
    feedItemFilter = other.feedItemFilter;
    feedCategories = other.feedCategories;
    feedListType = other.feedListType;
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

class YesodFeedItemFilter {
  final Iterable<InternalID>? feedIdFilter;
  final Iterable<InternalID>? authorIdFilter;
  final Iterable<String>? publishPlatformFilter;
  final Iterable<String>? categoryFilter;
  final TimeRange? publishTimeRange;

  YesodFeedItemFilter({
    this.feedIdFilter,
    this.authorIdFilter,
    this.publishPlatformFilter,
    this.categoryFilter,
    this.publishTimeRange,
  });
}
