import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

// tests for SearchSubjectsRequestFilter
void main() {
  final SearchSubjectsRequestFilter?
      instance = /* SearchSubjectsRequestFilter(...) */ null;
  // TODO add properties to the entity

  group(SearchSubjectsRequestFilter, () {
    // 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。
    // List<SubjectType> type
    test('to test the property `type`', () async {
      // TODO
    });

    // 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。
    // List<String> metaTags
    test('to test the property `metaTags`', () async {
      // TODO
    });

    // 标签，可以多次出现。多值之间为 `且` 关系。
    // List<String> tag
    test('to test the property `tag`', () async {
      // TODO
    });

    // 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。
    // List<String> airDate
    test('to test the property `airDate`', () async {
      // TODO
    });

    // 用于搜索指定评分的条目，多值之间为 `且` 关系。
    // List<String> rating
    test('to test the property `rating`', () async {
      // TODO
    });

    // 用于搜索指定排名的条目，多值之间为 `且` 关系。
    // List<String> rank
    test('to test the property `rank`', () async {
      // TODO
    });

    // 无权限的用户会直接忽略此字段，不会返回R18条目。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 条目。  `false` 只会返回非 R18 条目。
    // bool nsfw
    test('to test the property `nsfw`', () async {
      // TODO
    });
  });
}
