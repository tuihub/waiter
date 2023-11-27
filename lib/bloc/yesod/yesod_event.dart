part of 'yesod_bloc.dart';

@immutable
sealed class YesodEvent {}

final class YesodInitEvent extends YesodEvent {}

final class YesodConfigLoadEvent extends YesodEvent {}

final class YesodConfigPreviewEvent extends YesodEvent {
  final String url;

  YesodConfigPreviewEvent(this.url);
}

final class YesodConfigAddEvent extends YesodEvent {
  final FeedConfig config;

  YesodConfigAddEvent(this.config);
}

final class YesodSetConfigEditIndexEvent extends YesodEvent {
  final int index;

  YesodSetConfigEditIndexEvent(this.index);
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

final class YesodFeedItemDigestsSetFilterEvent extends YesodEvent {
  final YesodFeedItemFilter filter;

  YesodFeedItemDigestsSetFilterEvent(this.filter);
}

final class YesodFeedItemLoadEvent extends YesodEvent {
  final InternalID id;

  YesodFeedItemLoadEvent(this.id);
}

final class YesodFeedCategoriesLoadEvent extends YesodEvent {}
