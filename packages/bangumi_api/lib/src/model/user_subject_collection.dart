//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_collection_type.dart';
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/slim_subject.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_subject_collection.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserSubjectCollection {
  /// Returns a new [UserSubjectCollection] instance.
  UserSubjectCollection({
    required this.subjectId,
    required this.subjectType,
    required this.rate,
    required this.type,
    this.comment,
    required this.tags,
    required this.epStatus,
    required this.volStatus,
    required this.updatedAt,
    required this.private,
    this.subject,
  });

  @JsonKey(
    name: r'subject_id',
    required: true,
    includeIfNull: false,
  )
  final int subjectId;

  @JsonKey(
    name: r'subject_type',
    required: true,
    includeIfNull: false,
  )
  final SubjectType subjectType;

  @JsonKey(
    name: r'rate',
    required: true,
    includeIfNull: false,
  )
  final int rate;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final SubjectCollectionType type;

  @JsonKey(
    name: r'comment',
    required: false,
    includeIfNull: false,
  )
  final String? comment;

  @JsonKey(
    name: r'tags',
    required: true,
    includeIfNull: false,
  )
  final List<String> tags;

  @JsonKey(
    name: r'ep_status',
    required: true,
    includeIfNull: false,
  )
  final int epStatus;

  @JsonKey(
    name: r'vol_status',
    required: true,
    includeIfNull: false,
  )
  final int volStatus;

  /// 本时间并不代表条目的收藏时间。修改评分，评价，章节观看状态等收藏信息时未更新此时间是一个 bug。请不要依赖此特性
  @JsonKey(
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime updatedAt;

  @JsonKey(
    name: r'private',
    required: true,
    includeIfNull: false,
  )
  final bool private;

  @JsonKey(
    name: r'subject',
    required: false,
    includeIfNull: false,
  )
  final SlimSubject? subject;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserSubjectCollection &&
            runtimeType == other.runtimeType &&
            equals([
              subjectId,
              subjectType,
              rate,
              type,
              comment,
              tags,
              epStatus,
              volStatus,
              updatedAt,
              private,
              subject,
            ], [
              other.subjectId,
              other.subjectType,
              other.rate,
              other.type,
              other.comment,
              other.tags,
              other.epStatus,
              other.volStatus,
              other.updatedAt,
              other.private,
              other.subject,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          subjectId,
          subjectType,
          rate,
          type,
          comment,
          tags,
          epStatus,
          volStatus,
          updatedAt,
          private,
          subject,
        ],
      );

  factory UserSubjectCollection.fromJson(Map<String, dynamic> json) =>
      _$UserSubjectCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSubjectCollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
