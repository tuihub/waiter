//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/user_group.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// 实际的返回值可能包括文档未声明的 `url` 字段，此字段主要用于开发者从 api 响应直接转跳到网页。 客户端开发者请不用依赖于此特性，此字段的值随时可能会改变。
///
/// Properties:
/// * [id]
/// * [username] - 唯一用户名，初始与 UID 相同，可修改一次
/// * [nickname]
/// * [userGroup]
/// * [avatar]
/// * [sign] - 个人签名
@BuiltValue(instantiable: false)
abstract class User {
  @BuiltValueField(wireName: r'id')
  int get id;

  /// 唯一用户名，初始与 UID 相同，可修改一次
  @BuiltValueField(wireName: r'username')
  String get username;

  @BuiltValueField(wireName: r'nickname')
  String get nickname;

  @BuiltValueField(wireName: r'user_group')
  UserGroup get userGroup;
  // enum userGroupEnum {  1,  2,  3,  4,  5,  8,  9,  10,  11,  };

  @BuiltValueField(wireName: r'avatar')
  Avatar get avatar;

  /// 个人签名
  @BuiltValueField(wireName: r'sign')
  String get sign;

  @BuiltValueSerializer(custom: true)
  static Serializer<User> get serializer => _$UserSerializer();
}

class _$UserSerializer implements PrimitiveSerializer<User> {
  @override
  final Iterable<Type> types = const [User];

  @override
  final String wireName = r'User';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'nickname';
    yield serializers.serialize(
      object.nickname,
      specifiedType: const FullType(String),
    );
    yield r'user_group';
    yield serializers.serialize(
      object.userGroup,
      specifiedType: const FullType(UserGroup),
    );
    yield r'avatar';
    yield serializers.serialize(
      object.avatar,
      specifiedType: const FullType(Avatar),
    );
    yield r'sign';
    yield serializers.serialize(
      object.sign,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  User deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($User))
        as $User;
  }
}

/// a concrete implementation of [User], since [User] is not instantiable
@BuiltValue(instantiable: true)
abstract class $User implements User, Built<$User, $UserBuilder> {
  $User._();

  factory $User([void Function($UserBuilder)? updates]) = _$$User;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($UserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$User> get serializer => _$$UserSerializer();
}

class _$$UserSerializer implements PrimitiveSerializer<$User> {
  @override
  final Iterable<Type> types = const [$User, _$$User];

  @override
  final String wireName = r'$User';

  @override
  Object serialize(
    Serializers serializers,
    $User object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(User))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserBuilder result,
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
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'nickname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nickname = valueDes;
          break;
        case r'user_group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserGroup),
          ) as UserGroup;
          result.userGroup = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Avatar),
          ) as Avatar;
          result.avatar.replace(valueDes);
          break;
        case r'sign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sign = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $User deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $UserBuilder();
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
