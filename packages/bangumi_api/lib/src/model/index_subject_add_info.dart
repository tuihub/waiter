//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'index_subject_add_info.g.dart';

/// 新增某条目到目录的请求信息
///
/// Properties:
/// * [subjectId]
/// * [sort] - 排序条件，越小越靠前
/// * [comment]
@BuiltValue()
abstract class IndexSubjectAddInfo
    implements Built<IndexSubjectAddInfo, IndexSubjectAddInfoBuilder> {
  @BuiltValueField(wireName: r'subject_id')
  int? get subjectId;

  /// 排序条件，越小越靠前
  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  IndexSubjectAddInfo._();

  factory IndexSubjectAddInfo([void updates(IndexSubjectAddInfoBuilder b)]) =
      _$IndexSubjectAddInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndexSubjectAddInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IndexSubjectAddInfo> get serializer =>
      _$IndexSubjectAddInfoSerializer();
}

class _$IndexSubjectAddInfoSerializer
    implements PrimitiveSerializer<IndexSubjectAddInfo> {
  @override
  final Iterable<Type> types = const [
    IndexSubjectAddInfo,
    _$IndexSubjectAddInfo
  ];

  @override
  final String wireName = r'IndexSubjectAddInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IndexSubjectAddInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.subjectId != null) {
      yield r'subject_id';
      yield serializers.serialize(
        object.subjectId,
        specifiedType: const FullType(int),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    IndexSubjectAddInfo object, {
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
    required IndexSubjectAddInfoBuilder result,
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
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.sort = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IndexSubjectAddInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndexSubjectAddInfoBuilder();
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
