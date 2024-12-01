//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:bangumi_api/src/model/episode.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_episode_collection.g.dart';

/// UserEpisodeCollection
///
/// Properties:
/// * [episode]
/// * [type]
@BuiltValue()
abstract class UserEpisodeCollection
    implements Built<UserEpisodeCollection, UserEpisodeCollectionBuilder> {
  @BuiltValueField(wireName: r'episode')
  Episode get episode;

  @BuiltValueField(wireName: r'type')
  EpisodeCollectionType get type;
  // enum typeEnum {  1,  2,  3,  };

  UserEpisodeCollection._();

  factory UserEpisodeCollection(
      [void updates(UserEpisodeCollectionBuilder b)]) = _$UserEpisodeCollection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserEpisodeCollectionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserEpisodeCollection> get serializer =>
      _$UserEpisodeCollectionSerializer();
}

class _$UserEpisodeCollectionSerializer
    implements PrimitiveSerializer<UserEpisodeCollection> {
  @override
  final Iterable<Type> types = const [
    UserEpisodeCollection,
    _$UserEpisodeCollection
  ];

  @override
  final String wireName = r'UserEpisodeCollection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserEpisodeCollection object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'episode';
    yield serializers.serialize(
      object.episode,
      specifiedType: const FullType(Episode),
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
    UserEpisodeCollection object, {
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
    required UserEpisodeCollectionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'episode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Episode),
          ) as Episode;
          result.episode.replace(valueDes);
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
  UserEpisodeCollection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserEpisodeCollectionBuilder();
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
