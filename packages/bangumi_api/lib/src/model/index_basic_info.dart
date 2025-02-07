//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'index_basic_info.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IndexBasicInfo {
  /// Returns a new [IndexBasicInfo] instance.
  IndexBasicInfo({
    this.title,
    this.description,
  });

  @JsonKey(
    name: r'title',
    required: false,
    includeIfNull: false,
  )
  final String? title;

  @JsonKey(
    name: r'description',
    required: false,
    includeIfNull: false,
  )
  final String? description;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IndexBasicInfo &&
            runtimeType == other.runtimeType &&
            equals([
              title,
              description,
            ], [
              other.title,
              other.description,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          title,
          description,
        ],
      );

  factory IndexBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$IndexBasicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IndexBasicInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
