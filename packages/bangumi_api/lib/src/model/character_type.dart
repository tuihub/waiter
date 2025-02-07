//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// type of a character 角色，机体，舰船，组织...
enum CharacterType {
  /// type of a character 角色，机体，舰船，组织...
  @JsonValue(1)
  Character('1'),

  /// type of a character 角色，机体，舰船，组织...
  @JsonValue(2)
  Mechanic('2'),

  /// type of a character 角色，机体，舰船，组织...
  @JsonValue(3)
  Ship('3'),

  /// type of a character 角色，机体，舰船，组织...
  @JsonValue(4)
  Organization('4');

  const CharacterType(this.value);

  final String value;

  @override
  String toString() => value;
}
