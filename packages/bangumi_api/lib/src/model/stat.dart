//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stat.g.dart';

/// Stat
///
/// Properties:
/// * [comments]
/// * [collects]
@BuiltValue()
abstract class Stat implements Built<Stat, StatBuilder> {
  @BuiltValueField(wireName: r'comments')
  int get comments;

  @BuiltValueField(wireName: r'collects')
  int get collects;

  Stat._();

  factory Stat([void updates(StatBuilder b)]) = _$Stat;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StatBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Stat> get serializer => _$StatSerializer();
}

class _$StatSerializer implements PrimitiveSerializer<Stat> {
  @override
  final Iterable<Type> types = const [Stat, _$Stat];

  @override
  final String wireName = r'Stat';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Stat object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'comments';
    yield serializers.serialize(
      object.comments,
      specifiedType: const FullType(int),
    );
    yield r'collects';
    yield serializers.serialize(
      object.collects,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Stat object, {
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
    required StatBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'comments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.comments = valueDes;
          break;
        case r'collects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.collects = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Stat deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatBuilder();
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
