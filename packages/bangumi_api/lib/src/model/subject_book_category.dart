//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
enum SubjectBookCategory {
  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @JsonValue(0)
  Other('0'),

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @JsonValue(1001)
  Comic('1001'),

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @JsonValue(1002)
  Novel('1002'),

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @JsonValue(1003)
  Illustration('1003');

  const SubjectBookCategory(this.value);

  final String value;

  @override
  String toString() => value;
}
