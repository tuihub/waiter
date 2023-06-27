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
