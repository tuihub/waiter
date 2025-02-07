//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:bangumi_api/src/model/subject_revision_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'subject_revision.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SubjectRevision {
  /// Returns a new [SubjectRevision] instance.
  SubjectRevision({
    required this.id,
    required this.type,
    this.creator,
    required this.summary,
    required this.createdAt,
    this.data,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final int type;

  @JsonKey(
    name: r'creator',
    required: false,
    includeIfNull: false,
  )
  final Creator? creator;

  @JsonKey(
    name: r'summary',
    required: true,
    includeIfNull: false,
  )
  final String summary;

  @JsonKey(
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime createdAt;

  @JsonKey(
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  final SubjectRevisionData? data;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SubjectRevision &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              creator,
              summary,
              createdAt,
              data,
            ], [
              other.id,
              other.type,
              other.creator,
              other.summary,
              other.createdAt,
              other.data,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          type,
          creator,
          summary,
          createdAt,
          data,
        ],
      );

  factory SubjectRevision.fromJson(Map<String, dynamic> json) =>
      _$SubjectRevisionFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectRevisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
