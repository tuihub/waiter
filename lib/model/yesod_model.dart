import 'package:freezed_annotation/freezed_annotation.dart';

part 'yesod_model.freezed.dart';
part 'yesod_model.g.dart';

@freezed
class YesodFeedItemListConfig with _$YesodFeedItemListConfig {
  const factory YesodFeedItemListConfig({
    Iterable<String>? feedIdFilter,
    Iterable<String>? authorIdFilter,
    Iterable<String>? publishPlatformFilter,
    Iterable<String>? categoryFilter,
    bool? hideRead,
    FeedItemListType? listType,
  }) = _YesodFeedItemListConfig;

  factory YesodFeedItemListConfig.fromJson(Map<String, dynamic> json) =>
      _$YesodFeedItemListConfigFromJson(json);
}

enum FeedItemListType {
  table,
  magazine,
  card,
}
