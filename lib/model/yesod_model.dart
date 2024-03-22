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

@Deprecated('delete')
class RssSubscription {
  final String title;
  final String link;
  final String iconUrl;
  final String description;

  RssSubscription({
    required this.title,
    required this.link,
    required this.iconUrl,
    required this.description,
  });
}

@Deprecated('delete')
class RssPostItem {
  String? title;
  String? link;
  String? description;
  String? updateTime;
  String? image;
  RssSubscription subscription;

  RssPostItem({
    this.title,
    this.link,
    this.description,
    this.updateTime,
    this.image,
    required this.subscription,
  });
}

@Deprecated('delete')
class RssDescriptionContent {
  final String content;

  RssDescriptionContent(this.content);
}

@Deprecated('delete')
class TextContent extends RssDescriptionContent {
  TextContent(super.content);
}

@Deprecated('delete')
class ImgTextContent extends RssDescriptionContent {
  final String imgUrl;

  ImgTextContent(super.content, this.imgUrl);
}
