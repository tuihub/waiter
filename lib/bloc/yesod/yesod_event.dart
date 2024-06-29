part of 'yesod_bloc.dart';

@immutable
sealed class YesodEvent {}

final class YesodInitEvent extends YesodEvent {}

final class YesodConfigLoadEvent extends YesodEvent {}

final class YesodConfigAddEvent extends YesodEvent {
  final FeedConfig config;

  YesodConfigAddEvent(this.config);
}

final class YesodConfigEditEvent extends YesodEvent {
  final FeedConfig config;

  YesodConfigEditEvent(this.config);
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
