//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'avatar.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Avatar {
  /// Returns a new [Avatar] instance.
  Avatar({
    required this.large,
    required this.medium,
    required this.small,
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

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Avatar &&
            runtimeType == other.runtimeType &&
            equals([
              large,
              medium,
              small,
            ], [
              other.large,
              other.medium,
              other.small,
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
        ],
      );

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
