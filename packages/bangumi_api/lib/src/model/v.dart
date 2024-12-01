//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'v.g.dart';

/// V
///
/// Properties:
/// * [v]
@BuiltValue()
abstract class V implements Built<V, VBuilder> {
  @BuiltValueField(wireName: r'v')
  String get v;

  V._();

  factory V([void updates(VBuilder b)]) = _$V;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<V> get serializer => _$VSerializer();
}

class _$VSerializer implements PrimitiveSerializer<V> {
  @override
  final Iterable<Type> types = const [V, _$V];

  @override
  final String wireName = r'V';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    V object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'v';
    yield serializers.serialize(
      object.v,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    V object, {
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
    required VBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'v':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.v = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  V deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VBuilder();
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
