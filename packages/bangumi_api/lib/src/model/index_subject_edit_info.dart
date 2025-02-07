//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'index_subject_edit_info.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IndexSubjectEditInfo {
  /// Returns a new [IndexSubjectEditInfo] instance.
  IndexSubjectEditInfo({
    this.sort,
    this.comment,
  });

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
        other is IndexSubjectEditInfo &&
            runtimeType == other.runtimeType &&
            equals([
              sort,
              comment,
            ], [
              other.sort,
              other.comment,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          sort,
          comment,
        ],
      );

  factory IndexSubjectEditInfo.fromJson(Map<String, dynamic> json) =>
      _$IndexSubjectEditInfoFromJson(json);

  Map<String, dynamic> toJson() => _$IndexSubjectEditInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
