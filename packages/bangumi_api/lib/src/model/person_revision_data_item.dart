//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/person_revision_profession.dart';
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'person_revision_data_item.g.dart';

/// PersonRevisionDataItem
///
/// Properties:
/// * [prsnInfobox]
/// * [prsnSummary]
/// * [profession]
/// * [extra]
/// * [prsnName]
@BuiltValue()
abstract class PersonRevisionDataItem
    implements Built<PersonRevisionDataItem, PersonRevisionDataItemBuilder> {
  @BuiltValueField(wireName: r'prsn_infobox')
  String get prsnInfobox;

  @BuiltValueField(wireName: r'prsn_summary')
  String get prsnSummary;

  @BuiltValueField(wireName: r'profession')
  PersonRevisionProfession get profession;

  @BuiltValueField(wireName: r'extra')
  RevisionExtra get extra;

  @BuiltValueField(wireName: r'prsn_name')
  String get prsnName;

  PersonRevisionDataItem._();

  factory PersonRevisionDataItem(
          [void updates(PersonRevisionDataItemBuilder b)]) =
      _$PersonRevisionDataItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PersonRevisionDataItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PersonRevisionDataItem> get serializer =>
      _$PersonRevisionDataItemSerializer();
}

class _$PersonRevisionDataItemSerializer
    implements PrimitiveSerializer<PersonRevisionDataItem> {
  @override
  final Iterable<Type> types = const [
    PersonRevisionDataItem,
    _$PersonRevisionDataItem
  ];

  @override
  final String wireName = r'PersonRevisionDataItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PersonRevisionDataItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'prsn_infobox';
    yield serializers.serialize(
      object.prsnInfobox,
      specifiedType: const FullType(String),
    );
    yield r'prsn_summary';
    yield serializers.serialize(
      object.prsnSummary,
      specifiedType: const FullType(String),
    );
    yield r'profession';
    yield serializers.serialize(
      object.profession,
      specifiedType: const FullType(PersonRevisionProfession),
    );
    yield r'extra';
    yield serializers.serialize(
      object.extra,
      specifiedType: const FullType(RevisionExtra),
    );
    yield r'prsn_name';
    yield serializers.serialize(
      object.prsnName,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PersonRevisionDataItem object, {
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
    required PersonRevisionDataItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'prsn_infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prsnInfobox = valueDes;
          break;
        case r'prsn_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prsnSummary = valueDes;
          break;
        case r'profession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PersonRevisionProfession),
          ) as PersonRevisionProfession;
          result.profession.replace(valueDes);
          break;
        case r'extra':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RevisionExtra),
          ) as RevisionExtra;
          result.extra.replace(valueDes);
          break;
        case r'prsn_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prsnName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PersonRevisionDataItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PersonRevisionDataItemBuilder();
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
