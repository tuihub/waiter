part of 'yesod_bloc.dart';

class YesodState {
  // Data from server
  late List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs;
  late List<FeedActionSet>? feedActionSets;
  late List<FeedItemDigest>? feedItemDigests;
  late List<String>? feedCategories;

  YesodState({
    this.feedConfigs,
    this.feedActionSets,
    this.feedItemDigests,
    this.feedCategories,
  });

  YesodState copyWith({
    List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs,
    List<FeedActionSet>? feedActionSets,
    List<FeedItemDigest>? feedItemDigests,
    List<String>? feedCategories,
  }) {
    return YesodState(
      feedConfigs: feedConfigs ?? this.feedConfigs,
      feedActionSets: feedActionSets ?? this.feedActionSets,
      feedItemDigests: feedItemDigests ?? this.feedItemDigests,
      feedCategories: feedCategories ?? this.feedCategories,
    );
  }

  void _from(YesodState other) {
    feedConfigs = other.feedConfigs;
    feedActionSets = other.feedActionSets;
    feedItemDigests = other.feedItemDigests;
    feedCategories = other.feedCategories;
  }
}

class YesodFeedConfigLoadState extends YesodState with EventStatusMixin {
  YesodFeedConfigLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedConfigAddState extends YesodState with EventStatusMixin {
  YesodFeedConfigAddState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedConfigEditState extends YesodState with EventStatusMixin {
  YesodFeedConfigEditState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedActionSetLoadState extends YesodState with EventStatusMixin {
  YesodFeedActionSetLoadState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedActionSetAddState extends YesodState with EventStatusMixin {
  YesodFeedActionSetAddState(YesodState state, this.statusCode, {this.msg})
      : super() {
    _from(state);
  }

  @override
  final String? msg;
  @override
  final EventStatus statusCode;
}

class YesodFeedActionSetEditState extends YesodState with EventStatusMixin {
  YesodFeedActionSetEditState(YesodState state, this.statusCode, {this.msg})
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
