//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_type.g.dart';

class PersonType extends EnumClass {
  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @BuiltValueEnumConst(wireNumber: 1)
  static const PersonType Individual = _$Individual;

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @BuiltValueEnumConst(wireNumber: 2)
  static const PersonType Corporation = _$Corporation;

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @BuiltValueEnumConst(wireNumber: 3)
  static const PersonType Association = _$Association;

  static Serializer<PersonType> get serializer => _$personTypeSerializer;

  const PersonType._(String name) : super(name);

  static BuiltSet<PersonType> get values => _$values;
  static PersonType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PersonTypeMixin = Object with _$PersonTypeMixin;
