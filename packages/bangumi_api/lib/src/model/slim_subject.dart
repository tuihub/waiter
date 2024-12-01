//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'slim_subject.g.dart';

/// SlimSubject
///
/// Properties:
/// * [id]
/// * [type]
/// * [name]
/// * [nameCn]
/// * [shortSummary] - 截短后的条目描述。
/// * [date] - air date in `YYYY-MM-DD` format
/// * [images]
/// * [volumes] - 书籍条目的册数，由旧服务端从wiki中解析
/// * [eps] - 由旧服务端从wiki中解析，对于书籍条目为`话数`
/// * [collectionTotal] - 收藏人数
/// * [score] - 分数
/// * [rank] - 排名
/// * [tags] - 前 10 个 tag
@BuiltValue()
abstract class SlimSubject implements Built<SlimSubject, SlimSubjectBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'type')
  SubjectType get type;
  // enum typeEnum {  1,  2,  3,  4,  6,  };

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'name_cn')
  String get nameCn;

  /// 截短后的条目描述。
  @BuiltValueField(wireName: r'short_summary')
  String get shortSummary;

  /// air date in `YYYY-MM-DD` format
  @BuiltValueField(wireName: r'date')
  String? get date;

  @BuiltValueField(wireName: r'images')
  Images get images;

  /// 书籍条目的册数，由旧服务端从wiki中解析
  @BuiltValueField(wireName: r'volumes')
  int get volumes;

  /// 由旧服务端从wiki中解析，对于书籍条目为`话数`
  @BuiltValueField(wireName: r'eps')
  int get eps;

  /// 收藏人数
  @BuiltValueField(wireName: r'collection_total')
  int get collectionTotal;

  /// 分数
  @BuiltValueField(wireName: r'score')
  num get score;

  /// 排名
  @BuiltValueField(wireName: r'rank')
  int get rank;

  /// 前 10 个 tag
  @BuiltValueField(wireName: r'tags')
  BuiltList<Tag> get tags;

  SlimSubject._();

  factory SlimSubject([void updates(SlimSubjectBuilder b)]) = _$SlimSubject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SlimSubjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SlimSubject> get serializer => _$SlimSubjectSerializer();
}

class _$SlimSubjectSerializer implements PrimitiveSerializer<SlimSubject> {
  @override
  final Iterable<Type> types = const [SlimSubject, _$SlimSubject];

  @override
  final String wireName = r'SlimSubject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SlimSubject object, {
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
      specifiedType: const FullType(SubjectType),
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
    yield r'short_summary';
    yield serializers.serialize(
      object.shortSummary,
      specifiedType: const FullType(String),
    );
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(String),
      );
    }
    yield r'images';
    yield serializers.serialize(
      object.images,
      specifiedType: const FullType(Images),
    );
    yield r'volumes';
    yield serializers.serialize(
      object.volumes,
      specifiedType: const FullType(int),
    );
    yield r'eps';
    yield serializers.serialize(
      object.eps,
      specifiedType: const FullType(int),
    );
    yield r'collection_total';
    yield serializers.serialize(
      object.collectionTotal,
      specifiedType: const FullType(int),
    );
    yield r'score';
    yield serializers.serialize(
      object.score,
      specifiedType: const FullType(num),
    );
    yield r'rank';
    yield serializers.serialize(
      object.rank,
      specifiedType: const FullType(int),
    );
    yield r'tags';
    yield serializers.serialize(
      object.tags,
      specifiedType: const FullType(BuiltList, [FullType(Tag)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SlimSubject object, {
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
    required SlimSubjectBuilder result,
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
            specifiedType: const FullType(SubjectType),
          ) as SubjectType;
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
        case r'short_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shortSummary = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Images),
          ) as Images;
          result.images.replace(valueDes);
          break;
        case r'volumes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.volumes = valueDes;
          break;
        case r'eps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.eps = valueDes;
          break;
        case r'collection_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.collectionTotal = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.score = valueDes;
          break;
        case r'rank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rank = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Tag)]),
          ) as BuiltList<Tag>;
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
  SlimSubject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SlimSubjectBuilder();
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
