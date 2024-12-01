//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'episode.g.dart';

/// Episode
///
/// Properties:
/// * [id]
/// * [type] - `0` 本篇，`1` SP，`2` OP，`3` ED
/// * [name]
/// * [nameCn]
/// * [sort] - 同类条目的排序和集数
/// * [ep] - 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
/// * [airdate]
/// * [comment]
/// * [duration] - 维基人填写的原始时长
/// * [desc] - 简介
/// * [disc] - 音乐曲目的碟片数
/// * [durationSeconds] - 服务器解析的时长，无法解析时为 `0`
@BuiltValue()
abstract class Episode implements Built<Episode, EpisodeBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  /// `0` 本篇，`1` SP，`2` OP，`3` ED
  @BuiltValueField(wireName: r'type')
  int get type;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'name_cn')
  String get nameCn;

  /// 同类条目的排序和集数
  @BuiltValueField(wireName: r'sort')
  num get sort;

  /// 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
  @BuiltValueField(wireName: r'ep')
  num? get ep;

  @BuiltValueField(wireName: r'airdate')
  String get airdate;

  @BuiltValueField(wireName: r'comment')
  int get comment;

  /// 维基人填写的原始时长
  @BuiltValueField(wireName: r'duration')
  String get duration;

  /// 简介
  @BuiltValueField(wireName: r'desc')
  String get desc;

  /// 音乐曲目的碟片数
  @BuiltValueField(wireName: r'disc')
  int get disc;

  /// 服务器解析的时长，无法解析时为 `0`
  @BuiltValueField(wireName: r'duration_seconds')
  int? get durationSeconds;

  Episode._();

  factory Episode([void updates(EpisodeBuilder b)]) = _$Episode;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EpisodeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Episode> get serializer => _$EpisodeSerializer();
}

class _$EpisodeSerializer implements PrimitiveSerializer<Episode> {
  @override
  final Iterable<Type> types = const [Episode, _$Episode];

  @override
  final String wireName = r'Episode';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Episode object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(int),
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
    yield r'sort';
    yield serializers.serialize(
      object.sort,
      specifiedType: const FullType(num),
    );
    if (object.ep != null) {
      yield r'ep';
      yield serializers.serialize(
        object.ep,
        specifiedType: const FullType(num),
      );
    }
    yield r'airdate';
    yield serializers.serialize(
      object.airdate,
      specifiedType: const FullType(String),
    );
    yield r'comment';
    yield serializers.serialize(
      object.comment,
      specifiedType: const FullType(int),
    );
    yield r'duration';
    yield serializers.serialize(
      object.duration,
      specifiedType: const FullType(String),
    );
    yield r'desc';
    yield serializers.serialize(
      object.desc,
      specifiedType: const FullType(String),
    );
    yield r'disc';
    yield serializers.serialize(
      object.disc,
      specifiedType: const FullType(int),
    );
    if (object.durationSeconds != null) {
      yield r'duration_seconds';
      yield serializers.serialize(
        object.durationSeconds,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Episode object, {
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
    required EpisodeBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.type = valueDes;
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
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sort = valueDes;
          break;
        case r'ep':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.ep = valueDes;
          break;
        case r'airdate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.airdate = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.comment = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.duration = valueDes;
          break;
        case r'desc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.desc = valueDes;
          break;
        case r'disc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.disc = valueDes;
          break;
        case r'duration_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.durationSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Episode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EpisodeBuilder();
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
