//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/detail_one_of.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'detail.g.dart';

/// Detail
///
/// Properties:
/// * [error] - error message
/// * [path] - request path
@BuiltValue()
abstract class Detail implements Built<Detail, DetailBuilder> {
  /// One Of [DetailOneOf], [String]
  OneOf get oneOf;

  Detail._();

  factory Detail([void updates(DetailBuilder b)]) = _$Detail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Detail> get serializer => _$DetailSerializer();
}

class _$DetailSerializer implements PrimitiveSerializer<Detail> {
  @override
  final Iterable<Type> types = const [Detail, _$Detail];

  @override
  final String wireName = r'Detail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Detail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    Detail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  Detail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DetailBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(DetailOneOf),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc,
        specifiedType: targetType) as OneOf;
    return result.build();
  }
}
