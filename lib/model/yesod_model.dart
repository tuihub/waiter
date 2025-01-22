import 'package:dart_mappable/dart_mappable.dart';

part 'yesod_model.mapper.dart';

@MappableClass()
class YesodFeedItemListConfig with YesodFeedItemListConfigMappable {
  final Iterable<String>? feedIdFilter;
  final Iterable<String>? authorIdFilter;
  final Iterable<String>? publishPlatformFilter;
  final Iterable<String>? categoryFilter;
  final bool? hideRead;
  final FeedItemListType? listType;

  const YesodFeedItemListConfig({
    this.feedIdFilter,
    this.authorIdFilter,
    this.publishPlatformFilter,
    this.categoryFilter,
    this.hideRead,
    this.listType,
  });

  static const fromMap = YesodFeedItemListConfigMapper.fromMap;
  static const fromJson = YesodFeedItemListConfigMapper.fromJson;
}

enum FeedItemListType {
  table,
  magazine,
  card,
}
