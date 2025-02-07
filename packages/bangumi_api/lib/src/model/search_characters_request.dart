//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/search_characters_request_filter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_characters_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchCharactersRequest {
  /// Returns a new [SearchCharactersRequest] instance.
  SearchCharactersRequest({
    required this.keyword,
    this.filter,
  });

  @JsonKey(
    name: r'keyword',
    required: true,
    includeIfNull: false,
  )
  final String keyword;

  @JsonKey(
    name: r'filter',
    required: false,
    includeIfNull: false,
  )
  final SearchCharactersRequestFilter? filter;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchCharactersRequest &&
            runtimeType == other.runtimeType &&
            equals([
              keyword,
              filter,
            ], [
              other.keyword,
              other.filter,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          keyword,
          filter,
        ],
      );

  factory SearchCharactersRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchCharactersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCharactersRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
