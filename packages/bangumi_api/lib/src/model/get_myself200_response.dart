//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/user.dart';
import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/user_group.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_myself200_response.g.dart';

/// GetMyself200Response
///
/// Properties:
/// * [id]
/// * [username] - 唯一用户名，初始与 UID 相同，可修改一次
/// * [nickname]
/// * [userGroup]
/// * [avatar]
/// * [sign] - 个人签名
/// * [timeOffset] - 用户设置的时区偏移，以小时为单位。比如 GMT+8（shanghai/beijing）为 8
@BuiltValue()
abstract class GetMyself200Response
    implements User, Built<GetMyself200Response, GetMyself200ResponseBuilder> {
  /// 用户设置的时区偏移，以小时为单位。比如 GMT+8（shanghai/beijing）为 8
  @BuiltValueField(wireName: r'time_offset')
  int? get timeOffset;

  GetMyself200Response._();

  factory GetMyself200Response([void updates(GetMyself200ResponseBuilder b)]) =
      _$GetMyself200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetMyself200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetMyself200Response> get serializer =>
      _$GetMyself200ResponseSerializer();
}

class _$GetMyself200ResponseSerializer
    implements PrimitiveSerializer<GetMyself200Response> {
  @override
  final Iterable<Type> types = const [
    GetMyself200Response,
    _$GetMyself200Response
  ];

  @override
  final String wireName = r'GetMyself200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetMyself200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'nickname';
    yield serializers.serialize(
      object.nickname,
      specifiedType: const FullType(String),
    );
    yield r'sign';
    yield serializers.serialize(
      object.sign,
      specifiedType: const FullType(String),
    );
    if (object.timeOffset != null) {
      yield r'time_offset';
      yield serializers.serialize(
        object.timeOffset,
        specifiedType: const FullType(int),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'avatar';
    yield serializers.serialize(
      object.avatar,
      specifiedType: const FullType(Avatar),
    );
    yield r'user_group';
    yield serializers.serialize(
      object.userGroup,
      specifiedType: const FullType(UserGroup),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetMyself200Response object, {
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
    required GetMyself200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nickname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nickname = valueDes;
          break;
        case r'sign':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sign = valueDes;
          break;
        case r'time_offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.timeOffset = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Avatar),
          ) as Avatar;
          result.avatar.replace(valueDes);
          break;
        case r'user_group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserGroup),
          ) as UserGroup;
          result.userGroup = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetMyself200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetMyself200ResponseBuilder();
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
