//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'subject_revision_data.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubjectRevisionData {
  /// Returns a new [SubjectRevisionData] instance.
  SubjectRevisionData({
    required this.fieldEps,
    required this.fieldInfobox,
    required this.fieldSummary,
    required this.name,
    required this.nameCn,
    required this.platform,
    required this.subjectId,
    required this.type,
    required this.typeId,
    required this.voteField,
  });

  @JsonKey(
    name: r'field_eps',
    required: true,
    includeIfNull: false,
  )
  final int fieldEps;

  @JsonKey(
    name: r'field_infobox',
    required: true,
    includeIfNull: false,
  )
  final String fieldInfobox;

  @JsonKey(
    name: r'field_summary',
    required: true,
    includeIfNull: false,
  )
  final String fieldSummary;

  @JsonKey(
    name: r'name',
    required: true,
    includeIfNull: false,
  )
  final String name;

  @JsonKey(
    name: r'name_cn',
    required: true,
    includeIfNull: false,
  )
  final String nameCn;

  @JsonKey(
    name: r'platform',
    required: true,
    includeIfNull: false,
  )
  final int platform;

  @JsonKey(
    name: r'subject_id',
    required: true,
    includeIfNull: false,
  )
  final int subjectId;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final int type;

  @JsonKey(
    name: r'type_id',
    required: true,
    includeIfNull: false,
  )
  final int typeId;

  @JsonKey(
    name: r'vote_field',
    required: true,
    includeIfNull: false,
  )
  final String voteField;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SubjectRevisionData &&
            runtimeType == other.runtimeType &&
            equals([
              fieldEps,
              fieldInfobox,
              fieldSummary,
              name,
              nameCn,
              platform,
              subjectId,
              type,
              typeId,
              voteField,
            ], [
              other.fieldEps,
              other.fieldInfobox,
              other.fieldSummary,
              other.name,
              other.nameCn,
              other.platform,
              other.subjectId,
              other.type,
              other.typeId,
              other.voteField,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          fieldEps,
          fieldInfobox,
          fieldSummary,
          name,
          nameCn,
          platform,
          subjectId,
          type,
          typeId,
          voteField,
        ],
      );

  factory SubjectRevisionData.fromJson(Map<String, dynamic> json) =>
      _$SubjectRevisionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectRevisionDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
