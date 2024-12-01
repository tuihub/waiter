//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/collection.dart';
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/rating.dart';
import 'package:bangumi_api/src/model/item.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject.g.dart';

/// Subject
///
/// Properties:
/// * [id]
/// * [type]
/// * [name]
/// * [nameCn]
/// * [summary]
/// * [series] - 是否为书籍系列的主条目
/// * [nsfw]
/// * [locked]
/// * [date] - air date in `YYYY-MM-DD` format
/// * [platform] - TV, Web, 欧美剧, DLC...
/// * [images]
/// * [infobox]
/// * [volumes] - 书籍条目的册数，由旧服务端从wiki中解析
/// * [eps] - 由旧服务端从wiki中解析，对于书籍条目为`话数`
/// * [totalEpisodes] - 数据库中的章节数量
/// * [rating]
/// * [collection]
/// * [metaTags] - 由维基人维护的 tag
/// * [tags]
@BuiltValue()
abstract class Subject implements Built<Subject, SubjectBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'type')
  SubjectType get type;
  // enum typeEnum {  1,  2,  3,  4,  6,  };

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'name_cn')
  String get nameCn;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  /// 是否为书籍系列的主条目
  @BuiltValueField(wireName: r'series')
  bool get series;

  @BuiltValueField(wireName: r'nsfw')
  bool get nsfw;

  @BuiltValueField(wireName: r'locked')
  bool get locked;

  /// air date in `YYYY-MM-DD` format
  @BuiltValueField(wireName: r'date')
  String? get date;

  /// TV, Web, 欧美剧, DLC...
  @BuiltValueField(wireName: r'platform')
  String get platform;

  @BuiltValueField(wireName: r'images')
  Images get images;

  @BuiltValueField(wireName: r'infobox')
  BuiltList<Item>? get infobox;

  /// 书籍条目的册数，由旧服务端从wiki中解析
  @BuiltValueField(wireName: r'volumes')
  int get volumes;

  /// 由旧服务端从wiki中解析，对于书籍条目为`话数`
  @BuiltValueField(wireName: r'eps')
  int get eps;

  /// 数据库中的章节数量
  @BuiltValueField(wireName: r'total_episodes')
  int get totalEpisodes;

  @BuiltValueField(wireName: r'rating')
  Rating get rating;

  @BuiltValueField(wireName: r'collection')
  Collection get collection;

  /// 由维基人维护的 tag
  @BuiltValueField(wireName: r'meta_tags')
  BuiltList<String> get metaTags;

  @BuiltValueField(wireName: r'tags')
  BuiltList<Tag> get tags;

  Subject._();

  factory Subject([void updates(SubjectBuilder b)]) = _$Subject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Subject> get serializer => _$SubjectSerializer();
}

class _$SubjectSerializer implements PrimitiveSerializer<Subject> {
  @override
  final Iterable<Type> types = const [Subject, _$Subject];

  @override
  final String wireName = r'Subject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Subject object, {
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
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'series';
    yield serializers.serialize(
      object.series,
      specifiedType: const FullType(bool),
    );
    yield r'nsfw';
    yield serializers.serialize(
      object.nsfw,
      specifiedType: const FullType(bool),
    );
    yield r'locked';
    yield serializers.serialize(
      object.locked,
      specifiedType: const FullType(bool),
    );
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(String),
      );
    }
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(String),
    );
    yield r'images';
    yield serializers.serialize(
      object.images,
      specifiedType: const FullType(Images),
    );
    if (object.infobox != null) {
      yield r'infobox';
      yield serializers.serialize(
        object.infobox,
        specifiedType: const FullType(BuiltList, [FullType(Item)]),
      );
    }
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
    yield r'total_episodes';
    yield serializers.serialize(
      object.totalEpisodes,
      specifiedType: const FullType(int),
    );
    yield r'rating';
    yield serializers.serialize(
      object.rating,
      specifiedType: const FullType(Rating),
    );
    yield r'collection';
    yield serializers.serialize(
      object.collection,
      specifiedType: const FullType(Collection),
    );
    yield r'meta_tags';
    yield serializers.serialize(
      object.metaTags,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
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
    Subject object, {
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
    required SubjectBuilder result,
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
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'series':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.series = valueDes;
          break;
        case r'nsfw':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.nsfw = valueDes;
          break;
        case r'locked':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.locked = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.platform = valueDes;
          break;
        case r'images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Images),
          ) as Images;
          result.images.replace(valueDes);
          break;
        case r'infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Item)]),
          ) as BuiltList<Item>;
          result.infobox.replace(valueDes);
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
        case r'total_episodes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalEpisodes = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Rating),
          ) as Rating;
          result.rating.replace(valueDes);
          break;
        case r'collection':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Collection),
          ) as Collection;
          result.collection.replace(valueDes);
          break;
        case r'meta_tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.metaTags.replace(valueDes);
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
  Subject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubjectBuilder();
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
