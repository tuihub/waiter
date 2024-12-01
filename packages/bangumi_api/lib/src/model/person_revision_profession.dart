//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_revision_profession.g.dart';

/// PersonRevisionProfession
///
/// Properties:
/// * [producer]
/// * [mangaka]
/// * [artist]
/// * [seiyu]
/// * [writer]
/// * [illustrator]
/// * [actor]
@BuiltValue()
abstract class PersonRevisionProfession
    implements
        Built<PersonRevisionProfession, PersonRevisionProfessionBuilder> {
  @BuiltValueField(wireName: r'producer')
  String? get producer;

  @BuiltValueField(wireName: r'mangaka')
  String? get mangaka;

  @BuiltValueField(wireName: r'artist')
  String? get artist;

  @BuiltValueField(wireName: r'seiyu')
  String? get seiyu;

  @BuiltValueField(wireName: r'writer')
  String? get writer;

  @BuiltValueField(wireName: r'illustrator')
  String? get illustrator;

  @BuiltValueField(wireName: r'actor')
  String? get actor;

  PersonRevisionProfession._();

  factory PersonRevisionProfession(
          [void updates(PersonRevisionProfessionBuilder b)]) =
      _$PersonRevisionProfession;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonRevisionProfessionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonRevisionProfession> get serializer =>
      _$PersonRevisionProfessionSerializer();
}

class _$PersonRevisionProfessionSerializer
    implements PrimitiveSerializer<PersonRevisionProfession> {
  @override
  final Iterable<Type> types = const [
    PersonRevisionProfession,
    _$PersonRevisionProfession
  ];

  @override
  final String wireName = r'PersonRevisionProfession';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonRevisionProfession object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.producer != null) {
      yield r'producer';
      yield serializers.serialize(
        object.producer,
        specifiedType: const FullType(String),
      );
    }
    if (object.mangaka != null) {
      yield r'mangaka';
      yield serializers.serialize(
        object.mangaka,
        specifiedType: const FullType(String),
      );
    }
    if (object.artist != null) {
      yield r'artist';
      yield serializers.serialize(
        object.artist,
        specifiedType: const FullType(String),
      );
    }
    if (object.seiyu != null) {
      yield r'seiyu';
      yield serializers.serialize(
        object.seiyu,
        specifiedType: const FullType(String),
      );
    }
    if (object.writer != null) {
      yield r'writer';
      yield serializers.serialize(
        object.writer,
        specifiedType: const FullType(String),
      );
    }
    if (object.illustrator != null) {
      yield r'illustrator';
      yield serializers.serialize(
        object.illustrator,
        specifiedType: const FullType(String),
      );
    }
    if (object.actor != null) {
      yield r'actor';
      yield serializers.serialize(
        object.actor,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonRevisionProfession object, {
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
    required PersonRevisionProfessionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'producer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.producer = valueDes;
          break;
        case r'mangaka':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mangaka = valueDes;
          break;
        case r'artist':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.artist = valueDes;
          break;
        case r'seiyu':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.seiyu = valueDes;
          break;
        case r'writer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.writer = valueDes;
          break;
        case r'illustrator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.illustrator = valueDes;
          break;
        case r'actor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.actor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonRevisionProfession deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonRevisionProfessionBuilder();
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
