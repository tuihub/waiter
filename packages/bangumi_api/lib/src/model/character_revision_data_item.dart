//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_revision_data_item.g.dart';

/// CharacterRevisionDataItem
///
/// Properties:
/// * [infobox]
/// * [summary]
/// * [name]
/// * [extra]
@BuiltValue()
abstract class CharacterRevisionDataItem
    implements
        Built<CharacterRevisionDataItem, CharacterRevisionDataItemBuilder> {
  @BuiltValueField(wireName: r'infobox')
  String get infobox;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'extra')
  RevisionExtra get extra;

  CharacterRevisionDataItem._();

  factory CharacterRevisionDataItem(
          [void updates(CharacterRevisionDataItemBuilder b)]) =
      _$CharacterRevisionDataItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CharacterRevisionDataItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CharacterRevisionDataItem> get serializer =>
      _$CharacterRevisionDataItemSerializer();
}

class _$CharacterRevisionDataItemSerializer
    implements PrimitiveSerializer<CharacterRevisionDataItem> {
  @override
  final Iterable<Type> types = const [
    CharacterRevisionDataItem,
    _$CharacterRevisionDataItem
  ];

  @override
  final String wireName = r'CharacterRevisionDataItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CharacterRevisionDataItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'infobox';
    yield serializers.serialize(
      object.infobox,
      specifiedType: const FullType(String),
    );
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'extra';
    yield serializers.serialize(
      object.extra,
      specifiedType: const FullType(RevisionExtra),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CharacterRevisionDataItem object, {
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
    required CharacterRevisionDataItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.infobox = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'extra':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RevisionExtra),
          ) as RevisionExtra;
          result.extra.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CharacterRevisionDataItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterRevisionDataItemBuilder();
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
