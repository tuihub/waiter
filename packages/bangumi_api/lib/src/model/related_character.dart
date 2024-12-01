//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/person.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'related_character.g.dart';

/// RelatedCharacter
///
/// Properties:
/// * [id]
/// * [name]
/// * [type] - 角色，机体，舰船，组织...
/// * [images] - object with some size of images, this object maybe `null`
/// * [relation]
/// * [actors] - 演员列表
@BuiltValue()
abstract class RelatedCharacter
    implements Built<RelatedCharacter, RelatedCharacterBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  /// 角色，机体，舰船，组织...
  @BuiltValueField(wireName: r'type')
  CharacterType get type;
  // enum typeEnum {  1,  2,  3,  4,  };

  /// object with some size of images, this object maybe `null`
  @BuiltValueField(wireName: r'images')
  PersonImages? get images;

  @BuiltValueField(wireName: r'relation')
  String get relation;

  /// 演员列表
  @BuiltValueField(wireName: r'actors')
  BuiltList<Person>? get actors;

  RelatedCharacter._();

  factory RelatedCharacter([void updates(RelatedCharacterBuilder b)]) =
      _$RelatedCharacter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RelatedCharacterBuilder b) => b..actors = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<RelatedCharacter> get serializer =>
      _$RelatedCharacterSerializer();
}

class _$RelatedCharacterSerializer
    implements PrimitiveSerializer<RelatedCharacter> {
  @override
  final Iterable<Type> types = const [RelatedCharacter, _$RelatedCharacter];

  @override
  final String wireName = r'RelatedCharacter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RelatedCharacter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(CharacterType),
    );
    if (object.images != null) {
      yield r'images';
      yield serializers.serialize(
        object.images,
        specifiedType: const FullType(PersonImages),
      );
    }
    yield r'relation';
    yield serializers.serialize(
      object.relation,
      specifiedType: const FullType(String),
    );
    if (object.actors != null) {
      yield r'actors';
      yield serializers.serialize(
        object.actors,
        specifiedType: const FullType(BuiltList, [FullType(Person)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RelatedCharacter object, {
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
    required RelatedCharacterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterType),
          ) as CharacterType;
          result.type = valueDes;
          break;
        case r'images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PersonImages),
          ) as PersonImages;
          result.images.replace(valueDes);
          break;
        case r'relation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.relation = valueDes;
          break;
        case r'actors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Person)]),
          ) as BuiltList<Person>;
          result.actors.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RelatedCharacter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RelatedCharacterBuilder();
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
