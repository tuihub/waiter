//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Blood type of a person. A, B, AB, O
enum BloodType {
  /// Blood type of a person. A, B, AB, O
  @JsonValue(1)
  A('1'),

  /// Blood type of a person. A, B, AB, O
  @JsonValue(2)
  B('2'),

  /// Blood type of a person. A, B, AB, O
  @JsonValue(3)
  AB('3'),

  /// Blood type of a person. A, B, AB, O
  @JsonValue(4)
  O('4');

  const BloodType(this.value);

  final String value;

  @override
  String toString() => value;
}
