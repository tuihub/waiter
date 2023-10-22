part of 'yesod_add_bloc.dart';

abstract class YesodAddEvent extends Equatable {
  const YesodAddEvent();

  @override
  List<Object> get props => [];
}

class YesodUrlValidateEvent extends YesodAddEvent {}

class YesodUrlCheckEvent extends YesodAddEvent {
  final String url;

  const YesodUrlCheckEvent({required this.url});

  @override
  List<Object> get props => [url];
}

class YesodFeedConfigEvent extends YesodAddEvent {
  final String name;
  final String url;
  final int refreshInterval;
  final String category;
  final bool enabled;

  const YesodFeedConfigEvent({
    required this.url,
    required this.name,
    required this.refreshInterval,
    required this.category,
    required this.enabled,
  });

  @override
  List<Object> get props => [url, name, refreshInterval, enabled];
}

class YesodAddSecondStageEvent extends YesodAddEvent {
  final String url;
  final String name;

  const YesodAddSecondStageEvent(this.name, this.url);
}

class ChangeNameEvent extends YesodAddEvent {
  final String name;

  const ChangeNameEvent(this.name);
}

class ChangeEnabledEvent extends YesodAddEvent {
  final bool enabled;

  const ChangeEnabledEvent(this.enabled);
}

class ChangeIntervalEvent extends YesodAddEvent {
  final int interval;

  const ChangeIntervalEvent(this.interval);
}

class ChangeCategoryEvent extends YesodAddEvent {
  final String category;

  const ChangeCategoryEvent(this.category);
}
