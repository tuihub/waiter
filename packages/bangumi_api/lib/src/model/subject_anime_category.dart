//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
enum SubjectAnimeCategory {
  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @JsonValue(0)
  Other('0'),

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @JsonValue(1)
  TV('1'),

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @JsonValue(2)
  OVA('2'),

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @JsonValue(3)
  Movie('3'),

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @JsonValue(5)
  WEB('5');

  const SubjectAnimeCategory(this.value);

  final String value;

  @override
  String toString() => value;
}
