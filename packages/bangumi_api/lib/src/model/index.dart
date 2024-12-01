//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/creator.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'index.g.dart';

/// Index
///
/// Properties:
/// * [id]
/// * [title]
/// * [desc]
/// * [total] - 收录条目总数
/// * [stat] - 目录评论及收藏数
/// * [createdAt]
/// * [updatedAt]
/// * [creator]
/// * [ban] - deprecated, always false.
/// * [nsfw]
@BuiltValue()
abstract class Index implements Built<Index, IndexBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'desc')
  String get desc;

  /// 收录条目总数
  @BuiltValueField(wireName: r'total')
  int? get total;

  /// 目录评论及收藏数
  @BuiltValueField(wireName: r'stat')
  Stat get stat;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'creator')
  Creator get creator;

  /// deprecated, always false.
  @Deprecated('ban has been deprecated')
  @BuiltValueField(wireName: r'ban')
  bool get ban;

  @BuiltValueField(wireName: r'nsfw')
  bool get nsfw;

  Index._();

  factory Index([void updates(IndexBuilder b)]) = _$Index;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndexBuilder b) => b..total = 0;

  @BuiltValueSerializer(custom: true)
  static Serializer<Index> get serializer => _$IndexSerializer();
}

class _$IndexSerializer implements PrimitiveSerializer<Index> {
  @override
  final Iterable<Type> types = const [Index, _$Index];

  @override
  final String wireName = r'Index';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Index object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'desc';
    yield serializers.serialize(
      object.desc,
      specifiedType: const FullType(String),
    );
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    yield r'stat';
    yield serializers.serialize(
      object.stat,
      specifiedType: const FullType(Stat),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'creator';
    yield serializers.serialize(
      object.creator,
      specifiedType: const FullType(Creator),
    );
    yield r'ban';
    yield serializers.serialize(
      object.ban,
      specifiedType: const FullType(bool),
    );
    yield r'nsfw';
    yield serializers.serialize(
      object.nsfw,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Index object, {
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
    required IndexBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'desc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.desc = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'stat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Stat),
          ) as Stat;
          result.stat.replace(valueDes);
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Creator),
          ) as Creator;
          result.creator.replace(valueDes);
          break;
        case r'ban':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ban = valueDes;
          break;
        case r'nsfw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.nsfw = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Index deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndexBuilder();
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
