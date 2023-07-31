import 'package:html/parser.dart' show parse;
import 'package:waitress/common/model/yesod_model.dart';

abstract class AbstractContentFormatter {
  RssDescriptionContent format(String content);
}

class HtmlContentFormatter implements AbstractContentFormatter {
  final TextContentFormatter _text = TextContentFormatter();

  @override
  RssDescriptionContent format(String content) {
    try {
      final doc = parse(content);

      String description = "";
      doc.querySelectorAll('p,h1,h2,h3,h4,h5,span').forEach((element) {
        description = description + element.text;
      });
      description.replaceAll("\n", " ");

      final imgElements = doc.getElementsByTagName("img");
      if (imgElements.isNotEmpty) {
        final imgUrl = imgElements.first.attributes["src"];
        if (imgUrl != null) {
          return ImgTextContent(description, imgUrl);
        }
      }

      return TextContent(description);
    } catch (e) {
      return _text.format(content);
    }
  }
}

class TextContentFormatter implements AbstractContentFormatter {
  @override
  RssDescriptionContent format(String content) {
    content = content.replaceAll("\n", " ");
    return TextContent(content);
  }
}

class RssContentFormatter implements AbstractContentFormatter {
  final HtmlContentFormatter _html = HtmlContentFormatter();
  final TextContentFormatter _text = TextContentFormatter();

  @override
  RssDescriptionContent format(String content) {
    bool isHtml = false;
    if (RegExp(r"<[^>]*>.*<[^>]*>").hasMatch(content)) {
      isHtml = true;
    }
    if (isHtml) {
      return _html.format(content);
    }
    return _text.format(content);
  }
}
