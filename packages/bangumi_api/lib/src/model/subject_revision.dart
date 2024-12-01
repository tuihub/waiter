//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:bangumi_api/src/model/subject_revision_data.dart';
import 'package:bangumi_api/src/model/revision.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_revision.g.dart';

/// SubjectRevision
///
/// Properties:
/// * [id]
/// * [type]
/// * [creator]
/// * [summary]
/// * [createdAt]
/// * [data]
@BuiltValue()
abstract class SubjectRevision
    implements Revision, Built<SubjectRevision, SubjectRevisionBuilder> {
  @BuiltValueField(wireName: r'data')
  SubjectRevisionData? get data;

  SubjectRevision._();

  factory SubjectRevision([void updates(SubjectRevisionBuilder b)]) =
      _$SubjectRevision;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubjectRevisionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubjectRevision> get serializer =>
      _$SubjectRevisionSerializer();
}

class _$SubjectRevisionSerializer
    implements PrimitiveSerializer<SubjectRevision> {
  @override
  final Iterable<Type> types = const [SubjectRevision, _$SubjectRevision];

  @override
  final String wireName = r'SubjectRevision';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubjectRevision object, {
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
        specifiedType: const FullType(SubjectRevisionData),
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
    SubjectRevision object, {
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
    required SubjectRevisionBuilder result,
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
            specifiedType: const FullType(SubjectRevisionData),
          ) as SubjectRevisionData;
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
  SubjectRevision deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubjectRevisionBuilder();
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
