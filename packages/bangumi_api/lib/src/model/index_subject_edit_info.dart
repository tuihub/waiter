//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'index_subject_edit_info.g.dart';

/// 修改目录中条目的信息
///
/// Properties:
/// * [sort] - 排序条件，越小越靠前
/// * [comment]
@BuiltValue()
abstract class IndexSubjectEditInfo
    implements Built<IndexSubjectEditInfo, IndexSubjectEditInfoBuilder> {
  /// 排序条件，越小越靠前
  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  IndexSubjectEditInfo._();

  factory IndexSubjectEditInfo([void updates(IndexSubjectEditInfoBuilder b)]) =
      _$IndexSubjectEditInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndexSubjectEditInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IndexSubjectEditInfo> get serializer =>
      _$IndexSubjectEditInfoSerializer();
}

class _$IndexSubjectEditInfoSerializer
    implements PrimitiveSerializer<IndexSubjectEditInfo> {
  @override
  final Iterable<Type> types = const [
    IndexSubjectEditInfo,
    _$IndexSubjectEditInfo
  ];

  @override
  final String wireName = r'IndexSubjectEditInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IndexSubjectEditInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    IndexSubjectEditInfo object, {
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
    required IndexSubjectEditInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  IndexSubjectEditInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndexSubjectEditInfoBuilder();
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
