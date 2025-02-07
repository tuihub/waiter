//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'person_images.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonImages {
  /// Returns a new [PersonImages] instance.
  PersonImages({
    required this.large,
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
        other is PersonImages &&
            runtimeType == other.runtimeType &&
            equals([
              large,
              medium,
              small,
              grid,
            ], [
              other.large,
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
          medium,
          small,
          grid,
        ],
      );

  factory PersonImages.fromJson(Map<String, dynamic> json) =>
      _$PersonImagesFromJson(json);

  Map<String, dynamic> toJson() => _$PersonImagesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
