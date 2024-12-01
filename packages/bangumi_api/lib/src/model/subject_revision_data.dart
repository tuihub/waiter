//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_revision_data.g.dart';

/// SubjectRevisionData
///
/// Properties:
/// * [fieldEps]
/// * [fieldInfobox]
/// * [fieldSummary]
/// * [name]
/// * [nameCn]
/// * [platform]
/// * [subjectId]
/// * [type]
/// * [typeId]
/// * [voteField]
@BuiltValue()
abstract class SubjectRevisionData
    implements Built<SubjectRevisionData, SubjectRevisionDataBuilder> {
  @BuiltValueField(wireName: r'field_eps')
  int get fieldEps;

  @BuiltValueField(wireName: r'field_infobox')
  String get fieldInfobox;

  @BuiltValueField(wireName: r'field_summary')
  String get fieldSummary;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'name_cn')
  String get nameCn;

  @BuiltValueField(wireName: r'platform')
  int get platform;

  @BuiltValueField(wireName: r'subject_id')
  int get subjectId;

  @BuiltValueField(wireName: r'type')
  int get type;

  @BuiltValueField(wireName: r'type_id')
  int get typeId;

  @BuiltValueField(wireName: r'vote_field')
  String get voteField;

  SubjectRevisionData._();

  factory SubjectRevisionData([void updates(SubjectRevisionDataBuilder b)]) =
      _$SubjectRevisionData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubjectRevisionDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubjectRevisionData> get serializer =>
      _$SubjectRevisionDataSerializer();
}

class _$SubjectRevisionDataSerializer
    implements PrimitiveSerializer<SubjectRevisionData> {
  @override
  final Iterable<Type> types = const [
    SubjectRevisionData,
    _$SubjectRevisionData
  ];

  @override
  final String wireName = r'SubjectRevisionData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubjectRevisionData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'field_eps';
    yield serializers.serialize(
      object.fieldEps,
      specifiedType: const FullType(int),
    );
    yield r'field_infobox';
    yield serializers.serialize(
      object.fieldInfobox,
      specifiedType: const FullType(String),
    );
    yield r'field_summary';
    yield serializers.serialize(
      object.fieldSummary,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'name_cn';
    yield serializers.serialize(
      object.nameCn,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(int),
    );
    yield r'subject_id';
    yield serializers.serialize(
      object.subjectId,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(int),
    );
    yield r'type_id';
    yield serializers.serialize(
      object.typeId,
      specifiedType: const FullType(int),
    );
    yield r'vote_field';
    yield serializers.serialize(
      object.voteField,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SubjectRevisionData object, {
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
    required SubjectRevisionDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'field_eps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fieldEps = valueDes;
          break;
        case r'field_infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fieldInfobox = valueDes;
          break;
        case r'field_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fieldSummary = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'name_cn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameCn = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.platform = valueDes;
          break;
        case r'subject_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subjectId = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.type = valueDes;
          break;
        case r'type_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.typeId = valueDes;
          break;
        case r'vote_field':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.voteField = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubjectRevisionData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubjectRevisionDataBuilder();
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
