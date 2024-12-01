//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_collection_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_subject_collection_modify_payload.g.dart';

/// 所有的字段均可选
///
/// Properties:
/// * [type] - 修改条目收藏类型
/// * [rate] - 评分，`0` 表示删除评分
/// * [epStatus] - 只能用于修改书籍条目进度
/// * [volStatus] - 只能用于修改书籍条目进度
/// * [comment] - 评价
/// * [private] - 仅自己可见
/// * [tags] - 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。
@BuiltValue()
abstract class UserSubjectCollectionModifyPayload
    implements
        Built<UserSubjectCollectionModifyPayload,
            UserSubjectCollectionModifyPayloadBuilder> {
  /// 修改条目收藏类型
  @BuiltValueField(wireName: r'type')
  SubjectCollectionType? get type;
  // enum typeEnum {  1,  2,  3,  4,  5,  };

  /// 评分，`0` 表示删除评分
  @BuiltValueField(wireName: r'rate')
  int? get rate;

  /// 只能用于修改书籍条目进度
  @BuiltValueField(wireName: r'ep_status')
  int? get epStatus;

  /// 只能用于修改书籍条目进度
  @BuiltValueField(wireName: r'vol_status')
  int? get volStatus;

  /// 评价
  @BuiltValueField(wireName: r'comment')
  String? get comment;

  /// 仅自己可见
  @BuiltValueField(wireName: r'private')
  bool? get private;

  /// 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。
  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  UserSubjectCollectionModifyPayload._();

  factory UserSubjectCollectionModifyPayload(
          [void updates(UserSubjectCollectionModifyPayloadBuilder b)]) =
      _$UserSubjectCollectionModifyPayload;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserSubjectCollectionModifyPayloadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserSubjectCollectionModifyPayload> get serializer =>
      _$UserSubjectCollectionModifyPayloadSerializer();
}

class _$UserSubjectCollectionModifyPayloadSerializer
    implements PrimitiveSerializer<UserSubjectCollectionModifyPayload> {
  @override
  final Iterable<Type> types = const [
    UserSubjectCollectionModifyPayload,
    _$UserSubjectCollectionModifyPayload
  ];

  @override
  final String wireName = r'UserSubjectCollectionModifyPayload';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserSubjectCollectionModifyPayload object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(SubjectCollectionType),
      );
    }
    if (object.rate != null) {
      yield r'rate';
      yield serializers.serialize(
        object.rate,
        specifiedType: const FullType(int),
      );
    }
    if (object.epStatus != null) {
      yield r'ep_status';
      yield serializers.serialize(
        object.epStatus,
        specifiedType: const FullType(int),
      );
    }
    if (object.volStatus != null) {
      yield r'vol_status';
      yield serializers.serialize(
        object.volStatus,
        specifiedType: const FullType(int),
      );
    }
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
    if (object.private != null) {
      yield r'private';
      yield serializers.serialize(
        object.private,
        specifiedType: const FullType(bool),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserSubjectCollectionModifyPayload object, {
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
    required UserSubjectCollectionModifyPayloadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubjectCollectionType),
          ) as SubjectCollectionType;
          result.type = valueDes;
          break;
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rate = valueDes;
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
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'private':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.private = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tags.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserSubjectCollectionModifyPayload deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserSubjectCollectionModifyPayloadBuilder();
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
