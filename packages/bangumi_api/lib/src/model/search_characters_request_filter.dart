//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_characters_request_filter.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCharactersRequestFilter {
  /// Returns a new [SearchCharactersRequestFilter] instance.
  SearchCharactersRequestFilter({
    this.nsfw,
  });

  /// 无权限的用户会直接忽略此字段，不会返回 R18 角色。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 角色。  `false` 只会返回非 R18 角色。
  @JsonKey(
    name: r'nsfw',
    required: false,
    includeIfNull: false,
  )
  final bool? nsfw;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchCharactersRequestFilter &&
            runtimeType == other.runtimeType &&
            equals([
              nsfw,
            ], [
              other.nsfw,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          nsfw,
        ],
      );

  factory SearchCharactersRequestFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchCharactersRequestFilterFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCharactersRequestFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
