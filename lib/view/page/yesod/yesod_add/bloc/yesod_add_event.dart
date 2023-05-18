part of 'yesod_add_bloc.dart';

abstract class YesodAddEvent extends Equatable {
  const YesodAddEvent();

  @override
  List<Object> get props => [];
}

class YesodUrlCheckEvent extends YesodAddEvent {
  final String url;

  const YesodUrlCheckEvent({required this.url});

  @override
  List<Object> get props => [url];
}

class YesodFeedConfigEvent extends YesodAddEvent {
  final String name;
  final String iconUrl;
  final int refreshInterval;
  final bool enabled;

  const YesodFeedConfigEvent({
    required this.name,
    required this.iconUrl,
    required this.refreshInterval,
    required this.enabled,
  });

  @override
  List<Object> get props => [name, iconUrl, refreshInterval, enabled];
}
