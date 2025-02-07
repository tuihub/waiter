import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

// tests for SearchCharactersRequestFilter
void main() {
  final SearchCharactersRequestFilter?
      instance = /* SearchCharactersRequestFilter(...) */ null;
  // TODO add properties to the entity

  group(SearchCharactersRequestFilter, () {
    // 无权限的用户会直接忽略此字段，不会返回 R18 角色。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 角色。  `false` 只会返回非 R18 角色。
    // bool nsfw
    test('to test the property `nsfw`', () async {
      // TODO
    });
  });
}
