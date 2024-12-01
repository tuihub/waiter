//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'put_user_episode_collection_request.g.dart';

/// PutUserEpisodeCollectionRequest
///
/// Properties:
/// * [type]
@BuiltValue()
abstract class PutUserEpisodeCollectionRequest
    implements
        Built<PutUserEpisodeCollectionRequest,
            PutUserEpisodeCollectionRequestBuilder> {
  @BuiltValueField(wireName: r'type')
  EpisodeCollectionType get type;
  // enum typeEnum {  1,  2,  3,  };

  PutUserEpisodeCollectionRequest._();

  factory PutUserEpisodeCollectionRequest(
          [void updates(PutUserEpisodeCollectionRequestBuilder b)]) =
      _$PutUserEpisodeCollectionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PutUserEpisodeCollectionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PutUserEpisodeCollectionRequest> get serializer =>
      _$PutUserEpisodeCollectionRequestSerializer();
}

class _$PutUserEpisodeCollectionRequestSerializer
    implements PrimitiveSerializer<PutUserEpisodeCollectionRequest> {
  @override
  final Iterable<Type> types = const [
    PutUserEpisodeCollectionRequest,
    _$PutUserEpisodeCollectionRequest
  ];

  @override
  final String wireName = r'PutUserEpisodeCollectionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PutUserEpisodeCollectionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(EpisodeCollectionType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PutUserEpisodeCollectionRequest object, {
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
    required PutUserEpisodeCollectionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  PutUserEpisodeCollectionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PutUserEpisodeCollectionRequestBuilder();
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
