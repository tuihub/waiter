import 'package:opml/opml.dart';

class OPML {
  String title;
  List<OPMLItem> items;

  OPML({required this.title, required this.items});

  factory OPML.fromOPMLString(String opmlString) {
    final opml = OpmlDocument.parse(opmlString);
    final items = <OPMLItem>[];
    for (final outline in opml.body) {
      if (outline.children?.isNotEmpty ?? false) {
        for (final child in outline.children!) {
          if (child.type != 'rss') {
            continue;
          }
          items.add(
            OPMLItem(
              title: child.title ?? '',
              xmlUrl: child.xmlUrl ?? '',
              category: outline.title?.isNotEmpty ?? false
                  ? outline.title
                  : outline.text,
            ),
          );
        }
      }
      if (outline.type != 'rss') {
        continue;
      }
      items.add(
        OPMLItem(
          title: outline.title ?? '',
          xmlUrl: outline.xmlUrl ?? '',
        ),
      );
    }
    return OPML(title: opml.head.title ?? '', items: items);
  }

  String toOPMLString() {
    final head = OpmlHeadBuilder().title(title).build();
    final body = <OpmlOutline>[];
    final categories = <String, List<OPMLItem>>{};
    final uncategorized = <OPMLItem>[];
    for (final item in items) {
      if (item.category != null) {
        if (!categories.containsKey(item.category)) {
          categories[item.category!] = [];
        }
        categories[item.category!]!.add(item);
      } else {
        uncategorized.add(item);
      }
    }
    for (final category in categories.keys) {
      final categoryItems = categories[category]!;
      final categoryOutline =
          OpmlOutlineBuilder().text(category).title(category);
      for (final item in categoryItems) {
        categoryOutline.addChild(
          OpmlOutlineBuilder()
              .type('rss')
              .text(item.title)
              .title(item.title)
              .xmlUrl(item.xmlUrl)
              .build(),
        );
      }
      body.add(categoryOutline.build());
    }
    for (final item in uncategorized) {
      body.add(
        OpmlOutlineBuilder()
            .type('rss')
            .text(item.title)
            .title(item.title)
            .xmlUrl(item.xmlUrl)
            .build(),
      );
    }
    final opml = OpmlDocument(
      head: head,
      body: body,
    );

    return opml.toXmlString(pretty: true);
  }
}

class OPMLItem {
  String title;
  String xmlUrl;
  String? category;

  OPMLItem({
    required this.title,
    required this.xmlUrl,
    this.category,
  });
}
