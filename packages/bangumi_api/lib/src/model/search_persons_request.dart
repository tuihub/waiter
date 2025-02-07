//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/search_persons_request_filter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'search_persons_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchPersonsRequest {
  /// Returns a new [SearchPersonsRequest] instance.
  SearchPersonsRequest({
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
  final SearchPersonsRequestFilter? filter;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SearchPersonsRequest &&
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

  factory SearchPersonsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchPersonsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPersonsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
