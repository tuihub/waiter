//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'index_basic_info.g.dart';

/// 新增或修改条目的内容，同名字段意义同<a href=\"#model-Subject\">Subject</a>
///
/// Properties:
/// * [title]
/// * [description]
@BuiltValue()
abstract class IndexBasicInfo
    implements Built<IndexBasicInfo, IndexBasicInfoBuilder> {
  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'description')
  String? get description;

  IndexBasicInfo._();

  factory IndexBasicInfo([void updates(IndexBasicInfoBuilder b)]) =
      _$IndexBasicInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndexBasicInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IndexBasicInfo> get serializer =>
      _$IndexBasicInfoSerializer();
}

class _$IndexBasicInfoSerializer
    implements PrimitiveSerializer<IndexBasicInfo> {
  @override
  final Iterable<Type> types = const [IndexBasicInfo, _$IndexBasicInfo];

  @override
  final String wireName = r'IndexBasicInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IndexBasicInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IndexBasicInfo object, {
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
    required IndexBasicInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IndexBasicInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndexBasicInfoBuilder();
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
