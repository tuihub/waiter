import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

// tests for UserSubjectCollectionModifyPayload
void main() {
  final UserSubjectCollectionModifyPayload?
      instance = /* UserSubjectCollectionModifyPayload(...) */ null;
  // TODO add properties to the entity

  group(UserSubjectCollectionModifyPayload, () {
    // 修改条目收藏类型
    // SubjectCollectionType type
    test('to test the property `type`', () async {
      // TODO
    });

    // 评分，`0` 表示删除评分
    // int rate
    test('to test the property `rate`', () async {
      // TODO
    });

    // 只能用于修改书籍条目进度
    // int epStatus
    test('to test the property `epStatus`', () async {
      // TODO
    });

    // 只能用于修改书籍条目进度
    // int volStatus
    test('to test the property `volStatus`', () async {
      // TODO
    });

    // 评价
    // String comment
    test('to test the property `comment`', () async {
      // TODO
    });

    // 仅自己可见
    // bool private
    test('to test the property `private`', () async {
      // TODO
    });

    // 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。
    // List<String> tags
    test('to test the property `tags`', () async {
      // TODO
    });
  });
}
