//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'images.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Images {
  /// Returns a new [Images] instance.
  Images({
    required this.large,
    required this.common,
    required this.medium,
    required this.small,
    required this.grid,
  });

  @JsonKey(
    name: r'large',
    required: true,
    includeIfNull: false,
  )
  final String large;

  @JsonKey(
    name: r'common',
    required: true,
    includeIfNull: false,
  )
  final String common;

  @JsonKey(
    name: r'medium',
    required: true,
    includeIfNull: false,
  )
  final String medium;

  @JsonKey(
    name: r'small',
    required: true,
    includeIfNull: false,
  )
  final String small;

  @JsonKey(
    name: r'grid',
    required: true,
    includeIfNull: false,
  )
  final String grid;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Images &&
            runtimeType == other.runtimeType &&
            equals([
              large,
              common,
              medium,
              small,
              grid,
            ], [
              other.large,
              other.common,
              other.medium,
              other.small,
              other.grid,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          large,
          common,
          medium,
          small,
          grid,
        ],
      );

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
