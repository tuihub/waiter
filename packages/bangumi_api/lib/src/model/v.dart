//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'v.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class V {
  /// Returns a new [V] instance.
  V({
    required this.v,
  });

  @JsonKey(
    name: r'v',
    required: true,
    includeIfNull: false,
  )
  final String v;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is V &&
            runtimeType == other.runtimeType &&
            equals([
              v,
            ], [
              other.v,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          v,
        ],
      );

  factory V.fromJson(Map<String, dynamic> json) => _$VFromJson(json);

  Map<String, dynamic> toJson() => _$VToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
