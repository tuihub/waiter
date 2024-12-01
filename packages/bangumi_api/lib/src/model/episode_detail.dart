//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/ep_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'episode_detail.g.dart';

/// EpisodeDetail
///
/// Properties:
/// * [id]
/// * [type]
/// * [name]
/// * [nameCn]
/// * [sort] - 同类条目的排序和集数
/// * [ep] - 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
/// * [airdate]
/// * [comment]
/// * [duration]
/// * [desc] - 简介
/// * [disc] - 音乐曲目的碟片数
/// * [subjectId]
@BuiltValue()
abstract class EpisodeDetail
    implements Built<EpisodeDetail, EpisodeDetailBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'type')
  EpType get type;
  // enum typeEnum {  0,  1,  2,  3,  4,  5,  6,  };

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

  @BuiltValueField(wireName: r'duration')
  String get duration;

  /// 简介
  @BuiltValueField(wireName: r'desc')
  String get desc;

  /// 音乐曲目的碟片数
  @BuiltValueField(wireName: r'disc')
  int get disc;

  @BuiltValueField(wireName: r'subject_id')
  int get subjectId;

  EpisodeDetail._();

  factory EpisodeDetail([void updates(EpisodeDetailBuilder b)]) =
      _$EpisodeDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EpisodeDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EpisodeDetail> get serializer =>
      _$EpisodeDetailSerializer();
}

class _$EpisodeDetailSerializer implements PrimitiveSerializer<EpisodeDetail> {
  @override
  final Iterable<Type> types = const [EpisodeDetail, _$EpisodeDetail];

  @override
  final String wireName = r'EpisodeDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EpisodeDetail object, {
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
      specifiedType: const FullType(EpType),
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
    yield r'subject_id';
    yield serializers.serialize(
      object.subjectId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EpisodeDetail object, {
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
    required EpisodeDetailBuilder result,
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
            specifiedType: const FullType(EpType),
          ) as EpType;
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
        case r'subject_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subjectId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EpisodeDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EpisodeDetailBuilder();
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
