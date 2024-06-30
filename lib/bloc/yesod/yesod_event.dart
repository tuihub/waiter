part of 'yesod_bloc.dart';

@immutable
sealed class YesodEvent {}

final class YesodInitEvent extends YesodEvent {}

final class YesodFeedConfigLoadEvent extends YesodEvent {}

final class YesodFeedConfigAddEvent extends YesodEvent {
  final FeedConfig config;

  YesodFeedConfigAddEvent(this.config);
}

final class YesodFeedConfigEditEvent extends YesodEvent {
  final FeedConfig config;

  YesodFeedConfigEditEvent(this.config);
}

final class YesodFeedActionSetLoadEvent extends YesodEvent {}

final class YesodFeedActionSetAddEvent extends YesodEvent {
  final FeedActionSet set;

  YesodFeedActionSetAddEvent(this.set);
}

final class YesodFeedActionSetEditEvent extends YesodEvent {
  final FeedActionSet set;

  YesodFeedActionSetEditEvent(this.set);
}

final class YesodFeedItemDigestsLoadEvent extends YesodEvent {
  final int pageNum;
  final bool? refresh;

  YesodFeedItemDigestsLoadEvent(this.pageNum, {this.refresh});
}

final class YesodFeedItemLoadEvent extends YesodEvent {
  final InternalID id;

  YesodFeedItemLoadEvent(this.id);
}

final class YesodFeedCategoriesLoadEvent extends YesodEvent {}

final class YesodFeedItemReadEvent extends YesodEvent {
  final InternalID id;

  YesodFeedItemReadEvent(this.id);
}
