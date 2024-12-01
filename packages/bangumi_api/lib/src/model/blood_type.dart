//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'blood_type.g.dart';

class BloodType extends EnumClass {
  /// Blood type of a person. A, B, AB, O
  @BuiltValueEnumConst(wireNumber: 1)
  static const BloodType A = _$A;

  /// Blood type of a person. A, B, AB, O
  @BuiltValueEnumConst(wireNumber: 2)
  static const BloodType B = _$B;

  /// Blood type of a person. A, B, AB, O
  @BuiltValueEnumConst(wireNumber: 3)
  static const BloodType AB = _$AB;

  /// Blood type of a person. A, B, AB, O
  @BuiltValueEnumConst(wireNumber: 4)
  static const BloodType O = _$O;

  static Serializer<BloodType> get serializer => _$bloodTypeSerializer;

  const BloodType._(String name) : super(name);

  static BuiltSet<BloodType> get values => _$values;
  static BloodType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class BloodTypeMixin = Object with _$BloodTypeMixin;
