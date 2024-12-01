//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/search_subjects_request_filter.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_subjects_request.g.dart';

/// SearchSubjectsRequest
///
/// Properties:
/// * [keyword]
/// * [sort] - 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
/// * [filter]
@BuiltValue()
abstract class SearchSubjectsRequest
    implements Built<SearchSubjectsRequest, SearchSubjectsRequestBuilder> {
  @BuiltValueField(wireName: r'keyword')
  String get keyword;

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @BuiltValueField(wireName: r'sort')
  SearchSubjectsRequestSortEnum? get sort;
  // enum sortEnum {  match,  heat,  rank,  score,  };

  @BuiltValueField(wireName: r'filter')
  SearchSubjectsRequestFilter? get filter;

  SearchSubjectsRequest._();

  factory SearchSubjectsRequest(
      [void updates(SearchSubjectsRequestBuilder b)]) = _$SearchSubjectsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchSubjectsRequestBuilder b) =>
      b..sort = const SearchSubjectsRequestSortEnum._('match');

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchSubjectsRequest> get serializer =>
      _$SearchSubjectsRequestSerializer();
}

class _$SearchSubjectsRequestSerializer
    implements PrimitiveSerializer<SearchSubjectsRequest> {
  @override
  final Iterable<Type> types = const [
    SearchSubjectsRequest,
    _$SearchSubjectsRequest
  ];

  @override
  final String wireName = r'SearchSubjectsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchSubjectsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'keyword';
    yield serializers.serialize(
      object.keyword,
      specifiedType: const FullType(String),
    );
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType(SearchSubjectsRequestSortEnum),
      );
    }
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(SearchSubjectsRequestFilter),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SearchSubjectsRequest object, {
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
    required SearchSubjectsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'keyword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.keyword = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SearchSubjectsRequestSortEnum),
          ) as SearchSubjectsRequestSortEnum;
          result.sort = valueDes;
          break;
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SearchSubjectsRequestFilter),
          ) as SearchSubjectsRequestFilter;
          result.filter.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SearchSubjectsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchSubjectsRequestBuilder();
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

class SearchSubjectsRequestSortEnum extends EnumClass {
  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @BuiltValueEnumConst(wireName: r'match')
  static const SearchSubjectsRequestSortEnum match =
      _$searchSubjectsRequestSortEnum_match;

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @BuiltValueEnumConst(wireName: r'heat')
  static const SearchSubjectsRequestSortEnum heat =
      _$searchSubjectsRequestSortEnum_heat;

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @BuiltValueEnumConst(wireName: r'rank')
  static const SearchSubjectsRequestSortEnum rank =
      _$searchSubjectsRequestSortEnum_rank;

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @BuiltValueEnumConst(wireName: r'score')
  static const SearchSubjectsRequestSortEnum score =
      _$searchSubjectsRequestSortEnum_score;

  static Serializer<SearchSubjectsRequestSortEnum> get serializer =>
      _$searchSubjectsRequestSortEnumSerializer;

  const SearchSubjectsRequestSortEnum._(String name) : super(name);

  static BuiltSet<SearchSubjectsRequestSortEnum> get values =>
      _$searchSubjectsRequestSortEnumValues;
  static SearchSubjectsRequestSortEnum valueOf(String name) =>
      _$searchSubjectsRequestSortEnumValueOf(name);
}
