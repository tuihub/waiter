//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:bangumi_api/src/model/person_type.dart';
import 'package:bangumi_api/src/model/person_career.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_person_collection.g.dart';

/// UserPersonCollection
///
/// Properties:
/// * [id]
/// * [name]
/// * [type] - `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
/// * [career]
/// * [images] - object with some size of images, this object maybe `null`
/// * [createdAt]
@BuiltValue()
abstract class UserPersonCollection
    implements Built<UserPersonCollection, UserPersonCollectionBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @BuiltValueField(wireName: r'type')
  PersonType get type;
  // enum typeEnum {  1,  2,  3,  };

  @BuiltValueField(wireName: r'career')
  BuiltList<PersonCareer> get career;

  /// object with some size of images, this object maybe `null`
  @BuiltValueField(wireName: r'images')
  PersonImages? get images;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  UserPersonCollection._();

  factory UserPersonCollection([void updates(UserPersonCollectionBuilder b)]) =
      _$UserPersonCollection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserPersonCollectionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserPersonCollection> get serializer =>
      _$UserPersonCollectionSerializer();
}

class _$UserPersonCollectionSerializer
    implements PrimitiveSerializer<UserPersonCollection> {
  @override
  final Iterable<Type> types = const [
    UserPersonCollection,
    _$UserPersonCollection
  ];

  @override
  final String wireName = r'UserPersonCollection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserPersonCollection object, {
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
      specifiedType: const FullType(PersonType),
    );
    yield r'career';
    yield serializers.serialize(
      object.career,
      specifiedType: const FullType(BuiltList, [FullType(PersonCareer)]),
    );
    if (object.images != null) {
      yield r'images';
      yield serializers.serialize(
        object.images,
        specifiedType: const FullType(PersonImages),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserPersonCollection object, {
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
    required UserPersonCollectionBuilder result,
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
            specifiedType: const FullType(PersonType),
          ) as PersonType;
          result.type = valueDes;
          break;
        case r'career':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PersonCareer)]),
          ) as BuiltList<PersonCareer>;
          result.career.replace(valueDes);
          break;
        case r'images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PersonImages),
          ) as PersonImages;
          result.images.replace(valueDes);
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserPersonCollection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserPersonCollectionBuilder();
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
