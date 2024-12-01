//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/user_episode_collection.dart';
import 'package:bangumi_api/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_user_subject_episode_collection200_response.g.dart';

/// GetUserSubjectEpisodeCollection200Response
///
/// Properties:
/// * [total]
/// * [limit]
/// * [offset]
/// * [data]
@BuiltValue()
abstract class GetUserSubjectEpisodeCollection200Response
    implements
        Page,
        Built<GetUserSubjectEpisodeCollection200Response,
            GetUserSubjectEpisodeCollection200ResponseBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<UserEpisodeCollection>? get data;

  GetUserSubjectEpisodeCollection200Response._();

  factory GetUserSubjectEpisodeCollection200Response(
          [void updates(GetUserSubjectEpisodeCollection200ResponseBuilder b)]) =
      _$GetUserSubjectEpisodeCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetUserSubjectEpisodeCollection200ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetUserSubjectEpisodeCollection200Response>
      get serializer =>
          _$GetUserSubjectEpisodeCollection200ResponseSerializer();
}

class _$GetUserSubjectEpisodeCollection200ResponseSerializer
    implements PrimitiveSerializer<GetUserSubjectEpisodeCollection200Response> {
  @override
  final Iterable<Type> types = const [
    GetUserSubjectEpisodeCollection200Response,
    _$GetUserSubjectEpisodeCollection200Response
  ];

  @override
  final String wireName = r'GetUserSubjectEpisodeCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetUserSubjectEpisodeCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'limit';
    yield serializers.serialize(
      object.limit,
      specifiedType: const FullType(int),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType:
            const FullType(BuiltList, [FullType(UserEpisodeCollection)]),
      );
    }
    yield r'offset';
    yield serializers.serialize(
      object.offset,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetUserSubjectEpisodeCollection200Response object, {
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
    required GetUserSubjectEpisodeCollection200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(UserEpisodeCollection)]),
          ) as BuiltList<UserEpisodeCollection>;
          result.data.replace(valueDes);
          break;
        case r'offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.offset = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetUserSubjectEpisodeCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetUserSubjectEpisodeCollection200ResponseBuilder();
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
