//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_career.g.dart';

class PersonCareer extends EnumClass {
  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'producer')
  static const PersonCareer producer = _$producer;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'mangaka')
  static const PersonCareer mangaka = _$mangaka;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'artist')
  static const PersonCareer artist = _$artist;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'seiyu')
  static const PersonCareer seiyu = _$seiyu;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'writer')
  static const PersonCareer writer = _$writer;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'illustrator')
  static const PersonCareer illustrator = _$illustrator;

  /// An enumeration.
  @BuiltValueEnumConst(wireName: r'actor')
  static const PersonCareer actor = _$actor;

  static Serializer<PersonCareer> get serializer => _$personCareerSerializer;

  const PersonCareer._(String name) : super(name);

  static BuiltSet<PersonCareer> get values => _$values;
  static PersonCareer valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class PersonCareerMixin = Object with _$PersonCareerMixin;
