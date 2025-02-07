//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
enum PersonType {
  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @JsonValue(1)
  Individual('1'),

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @JsonValue(2)
  Corporation('2'),

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @JsonValue(3)
  Association('3');

  const PersonType(this.value);

  final String value;

  @override
  String toString() => value;
}
