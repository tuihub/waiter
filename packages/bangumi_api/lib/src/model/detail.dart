//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'detail.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Detail {
  /// Returns a new [Detail] instance.
  Detail({
    this.error,
    this.path,
  });

  /// error message
  @JsonKey(
    name: r'error',
    required: false,
    includeIfNull: false,
  )
  final String? error;

  /// request path
  @JsonKey(
    name: r'path',
    required: false,
    includeIfNull: false,
  )
  final String? path;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Detail &&
            runtimeType == other.runtimeType &&
            equals([
              error,
              path,
            ], [
              other.error,
              other.path,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          error,
          path,
        ],
      );

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
