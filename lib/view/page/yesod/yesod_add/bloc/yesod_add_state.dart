// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'yesod_add_bloc.dart';

enum YesodAddStage { urlCheck, feedConfig }

extension YesodAddStageExtension on YesodAddStage {
  bool get isUrlCheck => this == YesodAddStage.urlCheck;
  bool get isFeedConfig => this == YesodAddStage.feedConfig;
}

abstract class YesodAddState extends Equatable {
  const YesodAddState({
    this.stage = YesodAddStage.urlCheck,
  });

  final YesodAddStage stage;

  @override
  List<Object> get props => [stage];
}

class YesodAddFirstState extends YesodAddState {
  final String url;

  const YesodAddFirstState({
    required this.url,
  }) : super(stage: YesodAddStage.urlCheck);

  @override
  List<Object> get props => [url, stage];
}

class YesodAddInitial extends YesodAddState {}

class YesodUrlCheckLoading extends YesodAddFirstState {
  const YesodUrlCheckLoading({required super.url});
}

class YesodUrlCheckSuccess extends YesodAddFirstState {
  final RssPostItem example;
  const YesodUrlCheckSuccess({required this.example, required super.url});
}

class YesodUrlCheckFail extends YesodAddFirstState {
  const YesodUrlCheckFail({required super.url});
}

class YesodAddSecondState extends YesodAddState {
  final String name;
  final String iconUrl;
  final int refreshInterval;
  final bool enabled;

  const YesodAddSecondState({
    required this.name,
    required this.iconUrl,
    required this.refreshInterval,
    required this.enabled,
  }) : super(stage: YesodAddStage.feedConfig);

  @override
  List<Object> get props => [name, iconUrl, refreshInterval, enabled, stage];
}

class YesodFeedConfigLoading extends YesodAddSecondState {
  const YesodFeedConfigLoading(
      {required super.name,
      required super.iconUrl,
      required super.refreshInterval,
      required super.enabled});
}

class YesodFeedConfigSuccess extends YesodAddSecondState {
  const YesodFeedConfigSuccess(
      {required super.name,
      required super.iconUrl,
      required super.refreshInterval,
      required super.enabled});
}

class YesodFeedConfigFail extends YesodAddSecondState {
  final String message;

  const YesodFeedConfigFail({
    required super.name,
    required super.iconUrl,
    required super.refreshInterval,
    required super.enabled,
    required this.message,
  });
}
