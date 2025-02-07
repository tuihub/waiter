//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/search_subjects_request_filter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_subjects_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSubjectsRequest {
  /// Returns a new [SearchSubjectsRequest] instance.
  SearchSubjectsRequest({
    required this.keyword,
    this.sort = SearchSubjectsRequestSortEnum.match,
    this.filter,
  });

  @JsonKey(
    name: r'keyword',
    required: true,
    includeIfNull: false,
  )
  final String keyword;

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @JsonKey(
    name: r'sort',
    required: false,
    includeIfNull: false,
  )
  final SearchSubjectsRequestSortEnum? sort;

  @JsonKey(
    name: r'filter',
    required: false,
    includeIfNull: false,
  )
  final SearchSubjectsRequestFilter? filter;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchSubjectsRequest &&
            runtimeType == other.runtimeType &&
            equals([
              keyword,
              sort,
              filter,
            ], [
              other.keyword,
              other.sort,
              other.filter,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          keyword,
          sort,
          filter,
        ],
      );

  factory SearchSubjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchSubjectsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSubjectsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
enum SearchSubjectsRequestSortEnum {
  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @JsonValue(r'match')
  match(r'match'),

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @JsonValue(r'heat')
  heat(r'heat'),

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @JsonValue(r'rank')
  rank(r'rank'),

  /// 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分
  @JsonValue(r'score')
  score(r'score');

  const SearchSubjectsRequestSortEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
