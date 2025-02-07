//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'creator.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Creator {
  /// Returns a new [Creator] instance.
  Creator({
    required this.username,
    required this.nickname,
  });

  @JsonKey(
    name: r'username',
    required: true,
    includeIfNull: false,
  )
  final String username;

  @JsonKey(
    name: r'nickname',
    required: true,
    includeIfNull: false,
  )
  final String nickname;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Creator &&
            runtimeType == other.runtimeType &&
            equals([
              username,
              nickname,
            ], [
              other.username,
              other.nickname,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          username,
          nickname,
        ],
      );

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
