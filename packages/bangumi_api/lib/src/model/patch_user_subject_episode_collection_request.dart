//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patch_user_subject_episode_collection_request.g.dart';

/// PatchUserSubjectEpisodeCollectionRequest
///
/// Properties:
/// * [episodeId]
/// * [type]
@BuiltValue()
abstract class PatchUserSubjectEpisodeCollectionRequest
    implements
        Built<PatchUserSubjectEpisodeCollectionRequest,
            PatchUserSubjectEpisodeCollectionRequestBuilder> {
  @BuiltValueField(wireName: r'episode_id')
  BuiltList<int> get episodeId;

  @BuiltValueField(wireName: r'type')
  EpisodeCollectionType get type;
  // enum typeEnum {  1,  2,  3,  };

  PatchUserSubjectEpisodeCollectionRequest._();

  factory PatchUserSubjectEpisodeCollectionRequest(
          [void updates(PatchUserSubjectEpisodeCollectionRequestBuilder b)]) =
      _$PatchUserSubjectEpisodeCollectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatchUserSubjectEpisodeCollectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatchUserSubjectEpisodeCollectionRequest> get serializer =>
      _$PatchUserSubjectEpisodeCollectionRequestSerializer();
}

class _$PatchUserSubjectEpisodeCollectionRequestSerializer
    implements PrimitiveSerializer<PatchUserSubjectEpisodeCollectionRequest> {
  @override
  final Iterable<Type> types = const [
    PatchUserSubjectEpisodeCollectionRequest,
    _$PatchUserSubjectEpisodeCollectionRequest
  ];

  @override
  final String wireName = r'PatchUserSubjectEpisodeCollectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatchUserSubjectEpisodeCollectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'episode_id';
    yield serializers.serialize(
      object.episodeId,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(EpisodeCollectionType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PatchUserSubjectEpisodeCollectionRequest object, {
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
    required PatchUserSubjectEpisodeCollectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'episode_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.episodeId.replace(valueDes);
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EpisodeCollectionType),
          ) as EpisodeCollectionType;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PatchUserSubjectEpisodeCollectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatchUserSubjectEpisodeCollectionRequestBuilder();
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
