//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_collection_type.dart';
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/slim_subject.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_subject_collection.g.dart';

/// UserSubjectCollection
///
/// Properties:
/// * [subjectId]
/// * [subjectType]
/// * [rate]
/// * [type]
/// * [comment]
/// * [tags]
/// * [epStatus]
/// * [volStatus]
/// * [updatedAt] - 本时间并不代表条目的收藏时间。修改评分，评价，章节观看状态等收藏信息时未更新此时间是一个 bug。请不要依赖此特性
/// * [private]
/// * [subject]
@BuiltValue()
abstract class UserSubjectCollection
    implements Built<UserSubjectCollection, UserSubjectCollectionBuilder> {
  @BuiltValueField(wireName: r'subject_id')
  int get subjectId;

  @BuiltValueField(wireName: r'subject_type')
  SubjectType get subjectType;
  // enum subjectTypeEnum {  1,  2,  3,  4,  6,  };

  @BuiltValueField(wireName: r'rate')
  int get rate;

  @BuiltValueField(wireName: r'type')
  SubjectCollectionType get type;
  // enum typeEnum {  1,  2,  3,  4,  5,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String> get tags;

  @BuiltValueField(wireName: r'ep_status')
  int get epStatus;

  @BuiltValueField(wireName: r'vol_status')
  int get volStatus;

  /// 本时间并不代表条目的收藏时间。修改评分，评价，章节观看状态等收藏信息时未更新此时间是一个 bug。请不要依赖此特性
  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'private')
  bool get private;

  @BuiltValueField(wireName: r'subject')
  SlimSubject? get subject;

  UserSubjectCollection._();

  factory UserSubjectCollection(
      [void updates(UserSubjectCollectionBuilder b)]) = _$UserSubjectCollection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserSubjectCollectionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserSubjectCollection> get serializer =>
      _$UserSubjectCollectionSerializer();
}

class _$UserSubjectCollectionSerializer
    implements PrimitiveSerializer<UserSubjectCollection> {
  @override
  final Iterable<Type> types = const [
    UserSubjectCollection,
    _$UserSubjectCollection
  ];

  @override
  final String wireName = r'UserSubjectCollection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserSubjectCollection object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'subject_id';
    yield serializers.serialize(
      object.subjectId,
      specifiedType: const FullType(int),
    );
    yield r'subject_type';
    yield serializers.serialize(
      object.subjectType,
      specifiedType: const FullType(SubjectType),
    );
    yield r'rate';
    yield serializers.serialize(
      object.rate,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(SubjectCollectionType),
    );
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
    yield r'tags';
    yield serializers.serialize(
      object.tags,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'ep_status';
    yield serializers.serialize(
      object.epStatus,
      specifiedType: const FullType(int),
    );
    yield r'vol_status';
    yield serializers.serialize(
      object.volStatus,
      specifiedType: const FullType(int),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'private';
    yield serializers.serialize(
      object.private,
      specifiedType: const FullType(bool),
    );
    if (object.subject != null) {
      yield r'subject';
      yield serializers.serialize(
        object.subject,
        specifiedType: const FullType(SlimSubject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserSubjectCollection object, {
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
    required UserSubjectCollectionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'subject_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subjectId = valueDes;
          break;
        case r'subject_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubjectType),
          ) as SubjectType;
          result.subjectType = valueDes;
          break;
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rate = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubjectCollectionType),
          ) as SubjectCollectionType;
          result.type = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        case r'ep_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.epStatus = valueDes;
          break;
        case r'vol_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.volStatus = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'private':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.private = valueDes;
          break;
        case r'subject':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SlimSubject),
          ) as SlimSubject;
          result.subject.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserSubjectCollection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserSubjectCollectionBuilder();
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
