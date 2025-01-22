part of 'yesod_bloc.dart';

@immutable
sealed class YesodEvent {
  final EventContext context;

  YesodEvent(EventContext? context)
      : context = context ?? EventContext(DIService.instance.currentServer);
}

final class _YesodSwitchServerEvent extends YesodEvent {
  _YesodSwitchServerEvent(ServerID serverID) : super(EventContext(serverID));
}

final class YesodInitEvent extends YesodEvent {
  YesodInitEvent(super.context);
}

final class YesodFeedConfigLoadEvent extends YesodEvent {
  YesodFeedConfigLoadEvent(super.context);
}

final class YesodFeedConfigAddEvent extends YesodEvent {
  final FeedConfig config;

  YesodFeedConfigAddEvent(super.context, this.config);
}

final class YesodFeedConfigEditEvent extends YesodEvent {
  final FeedConfig config;

  YesodFeedConfigEditEvent(super.context, this.config);
}

final class YesodFeedActionSetLoadEvent extends YesodEvent {
  YesodFeedActionSetLoadEvent(super.context);
}

final class YesodFeedActionSetAddEvent extends YesodEvent {
  final FeedActionSet set;

  YesodFeedActionSetAddEvent(super.context, this.set);
}

final class YesodFeedActionSetEditEvent extends YesodEvent {
  final FeedActionSet set;

  YesodFeedActionSetEditEvent(super.context, this.set);
}

final class YesodFeedItemDigestsLoadEvent extends YesodEvent {
  final int pageNum;
  final bool? refresh;

  YesodFeedItemDigestsLoadEvent(super.context, this.pageNum, {this.refresh});
}

final class YesodFeedItemLoadEvent extends YesodEvent {
  final InternalID id;

  YesodFeedItemLoadEvent(super.context, this.id);
}

final class YesodFeedCategoriesLoadEvent extends YesodEvent {
  YesodFeedCategoriesLoadEvent(super.context);
}

final class YesodFeedItemReadEvent extends YesodEvent {
  final InternalID id;

  YesodFeedItemReadEvent(super.context, this.id);
}

final class YesodFeedItemListConfigSetEvent extends YesodEvent {
  final YesodFeedItemListConfig config;

  YesodFeedItemListConfigSetEvent(super.context, this.config);
}
