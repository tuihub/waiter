//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'kv.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class KV {
  /// Returns a new [KV] instance.
  KV({
    required this.k,
    required this.v,
  });

  @JsonKey(
    name: r'k',
    required: true,
    includeIfNull: false,
  )
  final String k;

  @JsonKey(
    name: r'v',
    required: true,
    includeIfNull: false,
  )
  final String v;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is KV &&
            runtimeType == other.runtimeType &&
            equals([
              k,
              v,
            ], [
              other.k,
              other.v,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          k,
          v,
        ],
      );

  factory KV.fromJson(Map<String, dynamic> json) => _$KVFromJson(json);

  Map<String, dynamic> toJson() => _$KVToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
