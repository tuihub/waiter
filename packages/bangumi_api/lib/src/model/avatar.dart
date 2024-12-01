//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'avatar.g.dart';

/// Avatar
///
/// Properties:
/// * [large]
/// * [medium]
/// * [small]
@BuiltValue()
abstract class Avatar implements Built<Avatar, AvatarBuilder> {
  @BuiltValueField(wireName: r'large')
  String get large;

  @BuiltValueField(wireName: r'medium')
  String get medium;

  @BuiltValueField(wireName: r'small')
  String get small;

  Avatar._();

  factory Avatar([void updates(AvatarBuilder b)]) = _$Avatar;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AvatarBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Avatar> get serializer => _$AvatarSerializer();
}

class _$AvatarSerializer implements PrimitiveSerializer<Avatar> {
  @override
  final Iterable<Type> types = const [Avatar, _$Avatar];

  @override
  final String wireName = r'Avatar';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Avatar object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'large';
    yield serializers.serialize(
      object.large,
      specifiedType: const FullType(String),
    );
    yield r'medium';
    yield serializers.serialize(
      object.medium,
      specifiedType: const FullType(String),
    );
    yield r'small';
    yield serializers.serialize(
      object.small,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Avatar object, {
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
    required AvatarBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'large':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.large = valueDes;
          break;
        case r'medium':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.medium = valueDes;
          break;
        case r'small':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.small = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Avatar deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AvatarBuilder();
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
