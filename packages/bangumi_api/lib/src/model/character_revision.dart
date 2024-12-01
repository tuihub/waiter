//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/revision.dart';
import 'package:bangumi_api/src/model/character_revision_data_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_revision.g.dart';

/// CharacterRevision
///
/// Properties:
/// * [id]
/// * [type]
/// * [creator]
/// * [summary]
/// * [createdAt]
/// * [data]
@BuiltValue()
abstract class CharacterRevision
    implements Revision, Built<CharacterRevision, CharacterRevisionBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltMap<String, CharacterRevisionDataItem>? get data;

  CharacterRevision._();

  factory CharacterRevision([void updates(CharacterRevisionBuilder b)]) =
      _$CharacterRevision;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterRevisionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterRevision> get serializer =>
      _$CharacterRevisionSerializer();
}

class _$CharacterRevisionSerializer
    implements PrimitiveSerializer<CharacterRevision> {
  @override
  final Iterable<Type> types = const [CharacterRevision, _$CharacterRevision];

  @override
  final String wireName = r'CharacterRevision';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterRevision object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.creator != null) {
      yield r'creator';
      yield serializers.serialize(
        object.creator,
        specifiedType: const FullType(Creator),
      );
    }
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(
            BuiltMap, [FullType(String), FullType(CharacterRevisionDataItem)]),
      );
    }
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterRevision object, {
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
    required CharacterRevisionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Creator),
          ) as Creator;
          result.creator.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap,
                [FullType(String), FullType(CharacterRevisionDataItem)]),
          ) as BuiltMap<String, CharacterRevisionDataItem>;
          result.data.replace(valueDes);
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
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
  CharacterRevision deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterRevisionBuilder();
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
