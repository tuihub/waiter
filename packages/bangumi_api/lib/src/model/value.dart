//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/value_any_of_inner.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'value.g.dart';

/// Value
@BuiltValue()
abstract class Value implements Built<Value, ValueBuilder> {
  /// Any Of [BuiltList<ValueAnyOfInner>], [String]
  AnyOf get anyOf;

  Value._();

  factory Value([void updates(ValueBuilder b)]) = _$Value;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Value> get serializer => _$ValueSerializer();
}

class _$ValueSerializer implements PrimitiveSerializer<Value> {
  @override
  final Iterable<Type> types = const [Value, _$Value];

  @override
  final String wireName = r'Value';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Value object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    Value object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf,
        specifiedType: FullType(
            AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  Value deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ValueBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [
      FullType(String),
      FullType(BuiltList, [FullType(ValueAnyOfInner)]),
    ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc,
        specifiedType: targetType) as AnyOf;
    return result.build();
  }
}
