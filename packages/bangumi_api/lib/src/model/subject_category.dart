//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_game_category.dart';
import 'package:bangumi_api/src/model/subject_anime_category.dart';
import 'package:bangumi_api/src/model/subject_book_category.dart';
import 'package:bangumi_api/src/model/subject_real_category.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'subject_category.g.dart';

/// SubjectCategory
@BuiltValue()
abstract class SubjectCategory
    implements Built<SubjectCategory, SubjectCategoryBuilder> {
  /// Any Of [SubjectAnimeCategory], [SubjectBookCategory], [SubjectGameCategory], [SubjectRealCategory]
  AnyOf get anyOf;

  SubjectCategory._();

  factory SubjectCategory([void updates(SubjectCategoryBuilder b)]) =
      _$SubjectCategory;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubjectCategoryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubjectCategory> get serializer =>
      _$SubjectCategorySerializer();
}

class _$SubjectCategorySerializer
    implements PrimitiveSerializer<SubjectCategory> {
  @override
  final Iterable<Type> types = const [SubjectCategory, _$SubjectCategory];

  @override
  final String wireName = r'SubjectCategory';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubjectCategory object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    SubjectCategory object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf,
        specifiedType: FullType(
            AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  SubjectCategory deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubjectCategoryBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [
      FullType(SubjectBookCategory),
      FullType(SubjectAnimeCategory),
      FullType(SubjectGameCategory),
      FullType(SubjectRealCategory),
    ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc,
        specifiedType: targetType) as AnyOf;
    return result.build();
  }
}
