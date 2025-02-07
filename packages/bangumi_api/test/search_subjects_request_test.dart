import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

// tests for SearchSubjectsRequest
void main() {
  final SearchSubjectsRequest? instance = /* SearchSubjectsRequest(...) */ null;
  // TODO add properties to the entity

  group(SearchSubjectsRequest, () {
    // String keyword
    test('to test the property `keyword`', () async {
      // TODO
    });

    // 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
    // String sort (default value: 'match')
    test('to test the property `sort`', () async {
      // TODO
    });

    // SearchSubjectsRequestFilter filter
    test('to test the property `filter`', () async {
      // TODO
    });
  });
}
