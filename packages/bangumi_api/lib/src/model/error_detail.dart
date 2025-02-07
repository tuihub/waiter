//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/detail.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'error_detail.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorDetail {
  /// Returns a new [ErrorDetail] instance.
  ErrorDetail({
    required this.title,
    required this.description,
    this.details,
  });

  @JsonKey(
    name: r'title',
    required: true,
    includeIfNull: false,
  )
  final String title;

  @JsonKey(
    name: r'description',
    required: true,
    includeIfNull: false,
  )
  final String description;

  @JsonKey(
    name: r'details',
    required: false,
    includeIfNull: false,
  )
  final Detail? details;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ErrorDetail &&
            runtimeType == other.runtimeType &&
            equals([
              title,
              description,
              details,
            ], [
              other.title,
              other.description,
              other.details,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          title,
          description,
          details,
        ],
      );

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
