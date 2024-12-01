//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_collection_type.g.dart';

class SubjectCollectionType extends EnumClass {
  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @BuiltValueEnumConst(wireNumber: 1)
  static const SubjectCollectionType Wish = _$Wish;

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @BuiltValueEnumConst(wireNumber: 2)
  static const SubjectCollectionType Done = _$Done;

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @BuiltValueEnumConst(wireNumber: 3)
  static const SubjectCollectionType Doing = _$Doing;

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @BuiltValueEnumConst(wireNumber: 4)
  static const SubjectCollectionType OnHold = _$OnHold;

  /// - `1`: 想看 - `2`: 看过 - `3`: 在看 - `4`: 搁置 - `5`: 抛弃
  @BuiltValueEnumConst(wireNumber: 5)
  static const SubjectCollectionType Dropped = _$Dropped;

  static Serializer<SubjectCollectionType> get serializer =>
      _$subjectCollectionTypeSerializer;

  const SubjectCollectionType._(String name) : super(name);

  static BuiltSet<SubjectCollectionType> get values => _$values;
  static SubjectCollectionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectCollectionTypeMixin = Object
    with _$SubjectCollectionTypeMixin;
