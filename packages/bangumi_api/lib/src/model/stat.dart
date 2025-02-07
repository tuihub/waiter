//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'stat.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Stat {
  /// Returns a new [Stat] instance.
  Stat({
    required this.comments,
    required this.collects,
  });

  @JsonKey(
    name: r'comments',
    required: true,
    includeIfNull: false,
  )
  final int comments;

  @JsonKey(
    name: r'collects',
    required: true,
    includeIfNull: false,
  )
  final int collects;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Stat &&
            runtimeType == other.runtimeType &&
            equals([
              comments,
              collects,
            ], [
              other.comments,
              other.collects,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          comments,
          collects,
        ],
      );

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
