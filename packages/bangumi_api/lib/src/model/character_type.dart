//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_type.g.dart';

class CharacterType extends EnumClass {
  /// type of a character 角色，机体，舰船，组织...
  @BuiltValueEnumConst(wireNumber: 1)
  static const CharacterType Character = _$Character;

  /// type of a character 角色，机体，舰船，组织...
  @BuiltValueEnumConst(wireNumber: 2)
  static const CharacterType Mechanic = _$Mechanic;

  /// type of a character 角色，机体，舰船，组织...
  @BuiltValueEnumConst(wireNumber: 3)
  static const CharacterType Ship = _$Ship;

  /// type of a character 角色，机体，舰船，组织...
  @BuiltValueEnumConst(wireNumber: 4)
  static const CharacterType Organization = _$Organization;

  static Serializer<CharacterType> get serializer => _$characterTypeSerializer;

  const CharacterType._(String name) : super(name);

  static BuiltSet<CharacterType> get values => _$values;
  static CharacterType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CharacterTypeMixin = Object with _$CharacterTypeMixin;
