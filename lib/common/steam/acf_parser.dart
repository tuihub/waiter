import 'package:petitparser/definition.dart';
import 'package:petitparser/parser.dart';

/// Based on official JSON implementation: https://github.com/petitparser/dart-petitparser-examples

/// Internal ACF parser.
final _acfParser = AcfDefinition().build();

/// Converts the given ACF-string [input] to its corresponding object.
ACF parseAcf(String input) => _acfParser.parse(input).value;

/// Type definition for ACF data.
typedef ACF = Object? /* Map<String, ACF>|String */;

/// ACF grammar definition.
class AcfDefinition extends GrammarDefinition<ACF> {
  @override
  Parser<ACF> start() => ref0(entry).map((entry) => {entry.key: entry.value});
  Parser<ACF> value() => [
        ref0(object),
        ref0(stringToken),
        failure('value expected'),
      ].toChoiceParser();

  Parser<MapEntry<String, ACF>> entry() => seq3(
        ref0(stringToken).trim(),
        whitespace().optional(),
        ref0(value),
      ).map3((key, _, value) => MapEntry(key, value));

  Parser<Map<String, ACF>> object() => seq5(
        char('{'),
        whitespace().plus(),
        ref0(objectElements),
        whitespace().plus(),
        char('}'),
      ).map5((_, __, elements, ___, ____) => elements);
  Parser<Map<String, ACF>> objectElements() => ref0(entry)
      .starSeparated(whitespace())
      .map((list) => Map.fromEntries(list.elements));

  Parser<String> stringToken() => seq3(
        char('"'),
        ref0(characterPrimitive).star(),
        char('"'),
      ).map3((_, chars, __) => chars.join());
  Parser<String> characterPrimitive() => [
        ref0(characterNormal),
        ref0(characterEscape),
        ref0(characterUnicode),
      ].toChoiceParser();
  Parser<String> characterNormal() => pattern(r'^"\');
  Parser<String> characterEscape() => seq2(
        char(r'\'),
        anyOf(jsonEscapeChars.keys.join()),
      ).map2((_, char) => jsonEscapeChars[char]!);
  Parser<String> characterUnicode() => seq2(
        string(r'\u'),
        pattern('0-9A-Fa-f').timesString(4, '4-digit hex number expected'),
      ).map2((_, value) => String.fromCharCode(int.parse(value, radix: 16)));
}

/// Escape characters of JSON strings.
const Map<String, String> jsonEscapeChars = {
  r'\': r'\',
  '/': '/',
  '"': '"',
  'b': '\b',
  'f': '\f',
  'n': '\n',
  'r': '\r',
  't': '\t',
};
