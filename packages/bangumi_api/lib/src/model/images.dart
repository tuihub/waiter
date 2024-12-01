//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'images.g.dart';

/// Images
///
/// Properties:
/// * [large]
/// * [common]
/// * [medium]
/// * [small]
/// * [grid]
@BuiltValue()
abstract class Images implements Built<Images, ImagesBuilder> {
  @BuiltValueField(wireName: r'large')
  String get large;

  @BuiltValueField(wireName: r'common')
  String get common;

  @BuiltValueField(wireName: r'medium')
  String get medium;

  @BuiltValueField(wireName: r'small')
  String get small;

  @BuiltValueField(wireName: r'grid')
  String get grid;

  Images._();

  factory Images([void updates(ImagesBuilder b)]) = _$Images;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ImagesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Images> get serializer => _$ImagesSerializer();
}

class _$ImagesSerializer implements PrimitiveSerializer<Images> {
  @override
  final Iterable<Type> types = const [Images, _$Images];

  @override
  final String wireName = r'Images';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Images object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'large';
    yield serializers.serialize(
      object.large,
      specifiedType: const FullType(String),
    );
    yield r'common';
    yield serializers.serialize(
      object.common,
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
    Images object, {
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
    required ImagesBuilder result,
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
        case r'common':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.common = valueDes;
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
  Images deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ImagesBuilder();
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
