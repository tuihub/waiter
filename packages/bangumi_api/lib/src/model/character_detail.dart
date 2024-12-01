//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/blood_type.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_detail.g.dart';

/// CharacterDetail
///
/// Properties:
/// * [id]
/// * [name]
/// * [type] - 角色，机体，舰船，组织...
/// * [images] - object with some size of images, this object maybe `null`
/// * [summary]
/// * [locked]
/// * [infobox] - server parsed infobox, a map from key to string or tuple null if server infobox is not valid
/// * [gender] - parsed from wiki, maybe null
/// * [bloodType] - parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O`
/// * [birthYear] - parsed from wiki, maybe `null`
/// * [birthMon] - parsed from wiki, maybe `null`
/// * [birthDay] - parsed from wiki, maybe `null`
/// * [stat]
@BuiltValue()
abstract class CharacterDetail
    implements Built<CharacterDetail, CharacterDetailBuilder> {
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

  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'locked')
  bool get locked;

  /// server parsed infobox, a map from key to string or tuple null if server infobox is not valid
  @BuiltValueField(wireName: r'infobox')
  BuiltList<JsonObject>? get infobox;

  /// parsed from wiki, maybe null
  @BuiltValueField(wireName: r'gender')
  String? get gender;

  /// parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O`
  @BuiltValueField(wireName: r'blood_type')
  BloodType? get bloodType;
  // enum bloodTypeEnum {  1,  2,  3,  4,  };

  /// parsed from wiki, maybe `null`
  @BuiltValueField(wireName: r'birth_year')
  int? get birthYear;

  /// parsed from wiki, maybe `null`
  @BuiltValueField(wireName: r'birth_mon')
  int? get birthMon;

  /// parsed from wiki, maybe `null`
  @BuiltValueField(wireName: r'birth_day')
  int? get birthDay;

  @BuiltValueField(wireName: r'stat')
  Stat get stat;

  CharacterDetail._();

  factory CharacterDetail([void updates(CharacterDetailBuilder b)]) =
      _$CharacterDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterDetail> get serializer =>
      _$CharacterDetailSerializer();
}

class _$CharacterDetailSerializer
    implements PrimitiveSerializer<CharacterDetail> {
  @override
  final Iterable<Type> types = const [CharacterDetail, _$CharacterDetail];

  @override
  final String wireName = r'CharacterDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterDetail object, {
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
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'locked';
    yield serializers.serialize(
      object.locked,
      specifiedType: const FullType(bool),
    );
    if (object.infobox != null) {
      yield r'infobox';
      yield serializers.serialize(
        object.infobox,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(String),
      );
    }
    if (object.bloodType != null) {
      yield r'blood_type';
      yield serializers.serialize(
        object.bloodType,
        specifiedType: const FullType(BloodType),
      );
    }
    if (object.birthYear != null) {
      yield r'birth_year';
      yield serializers.serialize(
        object.birthYear,
        specifiedType: const FullType(int),
      );
    }
    if (object.birthMon != null) {
      yield r'birth_mon';
      yield serializers.serialize(
        object.birthMon,
        specifiedType: const FullType(int),
      );
    }
    if (object.birthDay != null) {
      yield r'birth_day';
      yield serializers.serialize(
        object.birthDay,
        specifiedType: const FullType(int),
      );
    }
    yield r'stat';
    yield serializers.serialize(
      object.stat,
      specifiedType: const FullType(Stat),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterDetail object, {
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
    required CharacterDetailBuilder result,
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
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'locked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.locked = valueDes;
          break;
        case r'infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
          ) as BuiltList<JsonObject>;
          result.infobox.replace(valueDes);
          break;
        case r'gender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.gender = valueDes;
          break;
        case r'blood_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BloodType),
          ) as BloodType;
          result.bloodType = valueDes;
          break;
        case r'birth_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.birthYear = valueDes;
          break;
        case r'birth_mon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.birthMon = valueDes;
          break;
        case r'birth_day':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.birthDay = valueDes;
          break;
        case r'stat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Stat),
          ) as Stat;
          result.stat.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CharacterDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterDetailBuilder();
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
