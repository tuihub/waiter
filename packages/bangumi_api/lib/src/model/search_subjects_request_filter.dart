//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_subjects_request_filter.g.dart';

/// 不同条件之间是 `且` 的关系
///
/// Properties:
/// * [type] - 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。
/// * [metaTags] - 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。
/// * [tag] - 标签，可以多次出现。多值之间为 `且` 关系。
/// * [airDate] - 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。
/// * [rating] - 用于搜索指定评分的条目，多值之间为 `且` 关系。
/// * [rank] - 用于搜索指定排名的条目，多值之间为 `且` 关系。
/// * [nsfw] - 无权限的用户会直接忽略此字段，不会返回R18条目。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 条目。  `false` 只会返回非 R18 条目。
@BuiltValue()
abstract class SearchSubjectsRequestFilter
    implements
        Built<SearchSubjectsRequestFilter, SearchSubjectsRequestFilterBuilder> {
  /// 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。
  @BuiltValueField(wireName: r'type')
  BuiltList<SubjectType>? get type;

  /// 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。
  @BuiltValueField(wireName: r'meta_tags')
  BuiltList<String>? get metaTags;

  /// 标签，可以多次出现。多值之间为 `且` 关系。
  @BuiltValueField(wireName: r'tag')
  BuiltList<String>? get tag;

  /// 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。
  @BuiltValueField(wireName: r'air_date')
  BuiltList<String>? get airDate;

  /// 用于搜索指定评分的条目，多值之间为 `且` 关系。
  @BuiltValueField(wireName: r'rating')
  BuiltList<String>? get rating;

  /// 用于搜索指定排名的条目，多值之间为 `且` 关系。
  @BuiltValueField(wireName: r'rank')
  BuiltList<String>? get rank;

  /// 无权限的用户会直接忽略此字段，不会返回R18条目。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 条目。  `false` 只会返回非 R18 条目。
  @BuiltValueField(wireName: r'nsfw')
  bool? get nsfw;

  SearchSubjectsRequestFilter._();

  factory SearchSubjectsRequestFilter(
          [void updates(SearchSubjectsRequestFilterBuilder b)]) =
      _$SearchSubjectsRequestFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchSubjectsRequestFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchSubjectsRequestFilter> get serializer =>
      _$SearchSubjectsRequestFilterSerializer();
}

class _$SearchSubjectsRequestFilterSerializer
    implements PrimitiveSerializer<SearchSubjectsRequestFilter> {
  @override
  final Iterable<Type> types = const [
    SearchSubjectsRequestFilter,
    _$SearchSubjectsRequestFilter
  ];

  @override
  final String wireName = r'SearchSubjectsRequestFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchSubjectsRequestFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(BuiltList, [FullType(SubjectType)]),
      );
    }
    if (object.metaTags != null) {
      yield r'meta_tags';
      yield serializers.serialize(
        object.metaTags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.tag != null) {
      yield r'tag';
      yield serializers.serialize(
        object.tag,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.airDate != null) {
      yield r'air_date';
      yield serializers.serialize(
        object.airDate,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.rank != null) {
      yield r'rank';
      yield serializers.serialize(
        object.rank,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.nsfw != null) {
      yield r'nsfw';
      yield serializers.serialize(
        object.nsfw,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchSubjectsRequestFilter object, {
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
    required SearchSubjectsRequestFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SubjectType)]),
          ) as BuiltList<SubjectType>;
          result.type.replace(valueDes);
          break;
        case r'meta_tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.metaTags.replace(valueDes);
          break;
        case r'tag':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tag.replace(valueDes);
          break;
        case r'air_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.airDate.replace(valueDes);
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rating.replace(valueDes);
          break;
        case r'rank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rank.replace(valueDes);
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
  SearchSubjectsRequestFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchSubjectsRequestFilterBuilder();
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
