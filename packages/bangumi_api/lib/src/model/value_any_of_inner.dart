//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/kv.dart';
import 'package:bangumi_api/src/model/v.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'value_any_of_inner.g.dart';

/// ValueAnyOfInner
///
/// Properties:
/// * [k]
/// * [v]
@BuiltValue()
abstract class ValueAnyOfInner
    implements Built<ValueAnyOfInner, ValueAnyOfInnerBuilder> {
  /// Any Of [KV], [V]
  AnyOf get anyOf;

  ValueAnyOfInner._();

  factory ValueAnyOfInner([void updates(ValueAnyOfInnerBuilder b)]) =
      _$ValueAnyOfInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ValueAnyOfInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ValueAnyOfInner> get serializer =>
      _$ValueAnyOfInnerSerializer();
}

class _$ValueAnyOfInnerSerializer
    implements PrimitiveSerializer<ValueAnyOfInner> {
  @override
  final Iterable<Type> types = const [ValueAnyOfInner, _$ValueAnyOfInner];

  @override
  final String wireName = r'ValueAnyOfInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ValueAnyOfInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    ValueAnyOfInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf,
        specifiedType: FullType(
            AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  ValueAnyOfInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ValueAnyOfInnerBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [
      FullType(KV),
      FullType(V),
    ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc,
        specifiedType: targetType) as AnyOf;
    return result.build();
  }
}
