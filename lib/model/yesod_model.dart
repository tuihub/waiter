enum FeedListType {
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
