//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_images.g.dart';

/// PersonImages
///
/// Properties:
/// * [large]
/// * [medium]
/// * [small]
/// * [grid]
@BuiltValue()
abstract class PersonImages
    implements Built<PersonImages, PersonImagesBuilder> {
  @BuiltValueField(wireName: r'large')
  String get large;

  @BuiltValueField(wireName: r'medium')
  String get medium;

  @BuiltValueField(wireName: r'small')
  String get small;

  @BuiltValueField(wireName: r'grid')
  String get grid;

  PersonImages._();

  factory PersonImages([void updates(PersonImagesBuilder b)]) = _$PersonImages;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonImagesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonImages> get serializer => _$PersonImagesSerializer();
}

class _$PersonImagesSerializer implements PrimitiveSerializer<PersonImages> {
  @override
  final Iterable<Type> types = const [PersonImages, _$PersonImages];

  @override
  final String wireName = r'PersonImages';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonImages object, {
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
    yield r'grid';
    yield serializers.serialize(
      object.grid,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonImages object, {
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
    required PersonImagesBuilder result,
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
        case r'grid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.grid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonImages deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonImagesBuilder();
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
