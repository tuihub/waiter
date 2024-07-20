import 'package:test/test.dart';
import 'opml.dart';

const opmlString = '''
<?xml version="1.0" encoding="UTF-8"?>
<opml version="2.0">
  <head>
    <title>My Feeds</title>
  </head>
  <body>
    <outline text="Category 1" title="Category 1">
      <outline text="Feed 1" title="Feed 1" type="rss" xmlUrl="https://feed1.com/rss"/>
      <outline text="Feed 2" title="Feed 2" type="rss" xmlUrl="https://feed2.com/rss"/>
    </outline>
    <outline text="Category 2" title="Category 2">
      <outline text="Feed 3" title="Feed 3" type="rss" xmlUrl="https://feed3.com/rss"/>
    </outline>
    <outline text="Feed 4" title="Feed 4" type="rss" xmlUrl="https://feed4.com/rss"/>
  </body>
</opml>''';

OPML opmlObj = OPML(
  title: 'My Feeds',
  items: [
    OPMLItem(
      title: 'Feed 1',
      xmlUrl: 'https://feed1.com/rss',
      category: 'Category 1',
    ),
    OPMLItem(
      title: 'Feed 2',
      xmlUrl: 'https://feed2.com/rss',
      category: 'Category 1',
    ),
    OPMLItem(
      title: 'Feed 3',
      xmlUrl: 'https://feed3.com/rss',
      category: 'Category 2',
    ),
    OPMLItem(
      title: 'Feed 4',
      xmlUrl: 'https://feed4.com/rss',
    ),
  ],
);

void main() {
  test('OPML.fromOPMLString', () {
    final opml = OPML.fromOPMLString(opmlString);
    expect(opml.title, opmlObj.title);
    expect(opml.items.length, opmlObj.items.length);
    for (var i = 0; i < opml.items.length; i += 1) {
      expect(opml.items[i].title, opmlObj.items[i].title);
      expect(opml.items[i].xmlUrl, opmlObj.items[i].xmlUrl);
      expect(opml.items[i].category, opmlObj.items[i].category);
    }
  });

  test('OPML.toOPMLString', () {
    final opml = opmlObj.toOPMLString();
    expect(opml, opmlString);
  });
}
