//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kv.g.dart';

/// KV
///
/// Properties:
/// * [k]
/// * [v]
@BuiltValue()
abstract class KV implements Built<KV, KVBuilder> {
  @BuiltValueField(wireName: r'k')
  String get k;

  @BuiltValueField(wireName: r'v')
  String get v;

  KV._();

  factory KV([void updates(KVBuilder b)]) = _$KV;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KVBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KV> get serializer => _$KVSerializer();
}

class _$KVSerializer implements PrimitiveSerializer<KV> {
  @override
  final Iterable<Type> types = const [KV, _$KV];

  @override
  final String wireName = r'KV';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KV object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'k';
    yield serializers.serialize(
      object.k,
      specifiedType: const FullType(String),
    );
    yield r'v';
    yield serializers.serialize(
      object.v,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    KV object, {
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
    required KVBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'k':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.k = valueDes;
          break;
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
  KV deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KVBuilder();
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
