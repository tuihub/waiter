//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'index_subject_add_info.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IndexSubjectAddInfo {
  /// Returns a new [IndexSubjectAddInfo] instance.
  IndexSubjectAddInfo({
    this.subjectId,
    this.sort,
    this.comment,
  });

  @JsonKey(
    name: r'subject_id',
    required: false,
    includeIfNull: false,
  )
  final int? subjectId;

  /// 排序条件，越小越靠前
  @JsonKey(
    name: r'sort',
    required: false,
    includeIfNull: false,
  )
  final int? sort;

  @JsonKey(
    name: r'comment',
    required: false,
    includeIfNull: false,
  )
  final String? comment;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IndexSubjectAddInfo &&
            runtimeType == other.runtimeType &&
            equals([
              subjectId,
              sort,
              comment,
            ], [
              other.subjectId,
              other.sort,
              other.comment,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          subjectId,
          sort,
          comment,
        ],
      );

  factory IndexSubjectAddInfo.fromJson(Map<String, dynamic> json) =>
      _$IndexSubjectAddInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IndexSubjectAddInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
