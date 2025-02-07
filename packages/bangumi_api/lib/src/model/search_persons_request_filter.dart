//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_persons_request_filter.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchPersonsRequestFilter {
  /// Returns a new [SearchPersonsRequestFilter] instance.
  SearchPersonsRequestFilter({
    this.career,
  });

  /// 职业，可以多次出现。多值之间为 `且` 关系。
  @JsonKey(
    name: r'career',
    required: false,
    includeIfNull: false,
  )
  final List<String>? career;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchPersonsRequestFilter &&
            runtimeType == other.runtimeType &&
            equals([
              career,
            ], [
              other.career,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          career,
        ],
      );

  factory SearchPersonsRequestFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchPersonsRequestFilterFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPersonsRequestFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
