//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'subject_category.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubjectCategory {
  /// Returns a new [SubjectCategory] instance.
  SubjectCategory();

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SubjectCategory &&
            runtimeType == other.runtimeType &&
            equals([], []);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [],
      );

  factory SubjectCategory.fromJson(Map<String, dynamic> json) =>
      _$SubjectCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectCategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
