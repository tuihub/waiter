part of 'yesod_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class YesodState with YesodStateMappable {
  // Data from server
  late List<ListFeedConfigsResponse_FeedWithConfig>? feedConfigs;
  late List<FeedActionSet>? feedActionSets;
  late List<FeedItemDigest>? feedItemDigests;
  late List<String>? feedCategories;

  // Local
  late YesodFeedItemListConfig? listConfig;

  YesodState({
    this.feedConfigs,
    this.feedActionSets,
    this.feedItemDigests,
    this.feedCategories,
    this.listConfig,
  });

  YesodState.clone(YesodState other)
      : feedConfigs = other.feedConfigs,
        feedActionSets = other.feedActionSets,
        feedItemDigests = other.feedItemDigests,
        feedCategories = other.feedCategories,
        listConfig = other.listConfig;
}

class YesodEventState extends YesodState with EventStatusMixin {
  YesodEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final EventStatus statusCode;
  @override
  final String? msg;
}

class YesodFeedConfigLoadState extends YesodEventState {
  YesodFeedConfigLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedConfigAddState extends YesodEventState {
  YesodFeedConfigAddState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedConfigEditState extends YesodEventState {
  YesodFeedConfigEditState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedActionSetLoadState extends YesodEventState {
  YesodFeedActionSetLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedActionSetAddState extends YesodEventState {
  YesodFeedActionSetAddState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedActionSetEditState extends YesodEventState {
  YesodFeedActionSetEditState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class YesodFeedItemDigestLoadState extends YesodEventState {
  YesodFeedItemDigestLoadState(super.state, super.statusCode,
      {this.currentPage, this.maxPage, super.msg})
      : super.clone();

  final int? currentPage;
  final int? maxPage;
}

class YesodFeedItemLoadState extends YesodEventState {
  YesodFeedItemLoadState(super.state, super.statusCode,
      {this.feedItem, super.msg})
      : super.clone();

  final FeedItem? feedItem;
}

class YesodFeedCategoriesLoadState extends YesodEventState {
  YesodFeedCategoriesLoadState(super.state, super.statusCode, {super.msg})
      : super.clone();
}
