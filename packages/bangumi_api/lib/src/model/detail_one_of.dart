//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'detail_one_of.g.dart';

/// DetailOneOf
///
/// Properties:
/// * [error] - error message
/// * [path] - request path
@BuiltValue()
abstract class DetailOneOf implements Built<DetailOneOf, DetailOneOfBuilder> {
  /// error message
  @BuiltValueField(wireName: r'error')
  String? get error;

  /// request path
  @BuiltValueField(wireName: r'path')
  String? get path;

  DetailOneOf._();

  factory DetailOneOf([void updates(DetailOneOfBuilder b)]) = _$DetailOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DetailOneOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DetailOneOf> get serializer => _$DetailOneOfSerializer();
}

class _$DetailOneOfSerializer implements PrimitiveSerializer<DetailOneOf> {
  @override
  final Iterable<Type> types = const [DetailOneOf, _$DetailOneOf];

  @override
  final String wireName = r'DetailOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DetailOneOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(String),
      );
    }
    if (object.path != null) {
      yield r'path';
      yield serializers.serialize(
        object.path,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DetailOneOf object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DetailOneOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.error = valueDes;
          break;
        case r'path':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.path = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DetailOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DetailOneOfBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
