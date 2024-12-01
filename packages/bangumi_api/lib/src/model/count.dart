//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'count.g.dart';

/// Count
///
/// Properties:
/// * [n1]
/// * [n2]
/// * [n3]
/// * [n4]
/// * [n5]
/// * [n6]
/// * [n7]
/// * [n8]
/// * [n9]
/// * [n10]
@BuiltValue()
abstract class Count implements Built<Count, CountBuilder> {
  @BuiltValueField(wireName: r'1')
  int? get n1;

  @BuiltValueField(wireName: r'2')
  int? get n2;

  @BuiltValueField(wireName: r'3')
  int? get n3;

  @BuiltValueField(wireName: r'4')
  int? get n4;

  @BuiltValueField(wireName: r'5')
  int? get n5;

  @BuiltValueField(wireName: r'6')
  int? get n6;

  @BuiltValueField(wireName: r'7')
  int? get n7;

  @BuiltValueField(wireName: r'8')
  int? get n8;

  @BuiltValueField(wireName: r'9')
  int? get n9;

  @BuiltValueField(wireName: r'10')
  int? get n10;

  Count._();

  factory Count([void updates(CountBuilder b)]) = _$Count;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CountBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Count> get serializer => _$CountSerializer();
}

class _$CountSerializer implements PrimitiveSerializer<Count> {
  @override
  final Iterable<Type> types = const [Count, _$Count];

  @override
  final String wireName = r'Count';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Count object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.n1 != null) {
      yield r'1';
      yield serializers.serialize(
        object.n1,
        specifiedType: const FullType(int),
      );
    }
    if (object.n2 != null) {
      yield r'2';
      yield serializers.serialize(
        object.n2,
        specifiedType: const FullType(int),
      );
    }
    if (object.n3 != null) {
      yield r'3';
      yield serializers.serialize(
        object.n3,
        specifiedType: const FullType(int),
      );
    }
    if (object.n4 != null) {
      yield r'4';
      yield serializers.serialize(
        object.n4,
        specifiedType: const FullType(int),
      );
    }
    if (object.n5 != null) {
      yield r'5';
      yield serializers.serialize(
        object.n5,
        specifiedType: const FullType(int),
      );
    }
    if (object.n6 != null) {
      yield r'6';
      yield serializers.serialize(
        object.n6,
        specifiedType: const FullType(int),
      );
    }
    if (object.n7 != null) {
      yield r'7';
      yield serializers.serialize(
        object.n7,
        specifiedType: const FullType(int),
      );
    }
    if (object.n8 != null) {
      yield r'8';
      yield serializers.serialize(
        object.n8,
        specifiedType: const FullType(int),
      );
    }
    if (object.n9 != null) {
      yield r'9';
      yield serializers.serialize(
        object.n9,
        specifiedType: const FullType(int),
      );
    }
    if (object.n10 != null) {
      yield r'10';
      yield serializers.serialize(
        object.n10,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Count object, {
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
    required CountBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n1 = valueDes;
          break;
        case r'2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n2 = valueDes;
          break;
        case r'3':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n3 = valueDes;
          break;
        case r'4':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n4 = valueDes;
          break;
        case r'5':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n5 = valueDes;
          break;
        case r'6':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n6 = valueDes;
          break;
        case r'7':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n7 = valueDes;
          break;
        case r'8':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n8 = valueDes;
          break;
        case r'9':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n9 = valueDes;
          break;
        case r'10':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.n10 = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Count deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CountBuilder();
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
