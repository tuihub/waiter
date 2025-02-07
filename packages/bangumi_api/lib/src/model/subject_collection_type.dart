//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
enum SubjectCollectionType {
  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @JsonValue(1)
  Wish('1'),

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @JsonValue(2)
  Done('2'),

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @JsonValue(3)
  Doing('3'),

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @JsonValue(4)
  OnHold('4'),

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @JsonValue(5)
  Dropped('5');

  const SubjectCollectionType(this.value);

  final String value;

  @override
  String toString() => value;
}
