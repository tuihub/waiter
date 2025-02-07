//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_subjects_request_filter.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSubjectsRequestFilter {
  /// Returns a new [SearchSubjectsRequestFilter] instance.
  SearchSubjectsRequestFilter({
    this.type,
    this.metaTags,
    this.tag,
    this.airDate,
    this.rating,
    this.rank,
    this.nsfw,
  });

  /// 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。
  @JsonKey(
    name: r'type',
    required: false,
    includeIfNull: false,
  )
  final List<SubjectType>? type;

  /// 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。
  @JsonKey(
    name: r'meta_tags',
    required: false,
    includeIfNull: false,
  )
  final List<String>? metaTags;

  /// 标签，可以多次出现。多值之间为 `且` 关系。
  @JsonKey(
    name: r'tag',
    required: false,
    includeIfNull: false,
  )
  final List<String>? tag;

  /// 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。
  @JsonKey(
    name: r'air_date',
    required: false,
    includeIfNull: false,
  )
  final List<String>? airDate;

  /// 用于搜索指定评分的条目，多值之间为 `且` 关系。
  @JsonKey(
    name: r'rating',
    required: false,
    includeIfNull: false,
  )
  final List<String>? rating;

  /// 用于搜索指定排名的条目，多值之间为 `且` 关系。
  @JsonKey(
    name: r'rank',
    required: false,
    includeIfNull: false,
  )
  final List<String>? rank;

  /// 无权限的用户会直接忽略此字段，不会返回R18条目。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 条目。  `false` 只会返回非 R18 条目。
  @JsonKey(
    name: r'nsfw',
    required: false,
    includeIfNull: false,
  )
  final bool? nsfw;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchSubjectsRequestFilter &&
            runtimeType == other.runtimeType &&
            equals([
              type,
              metaTags,
              tag,
              airDate,
              rating,
              rank,
              nsfw,
            ], [
              other.type,
              other.metaTags,
              other.tag,
              other.airDate,
              other.rating,
              other.rank,
              other.nsfw,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          type,
          metaTags,
          tag,
          airDate,
          rating,
          rank,
          nsfw,
        ],
      );

  factory SearchSubjectsRequestFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchSubjectsRequestFilterFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSubjectsRequestFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
