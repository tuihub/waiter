//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'v0_related_subject.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class V0RelatedSubject {
  /// Returns a new [V0RelatedSubject] instance.
  V0RelatedSubject({
    required this.id,
    required this.type,
    required this.staff,
    required this.name,
    required this.nameCn,
    this.image,
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
  final SubjectType type;

  @JsonKey(
    name: r'staff',
    required: true,
    includeIfNull: false,
  )
  final String staff;

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
    name: r'image',
    required: false,
    includeIfNull: false,
  )
  final String? image;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is V0RelatedSubject &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              staff,
              name,
              nameCn,
              image,
            ], [
              other.id,
              other.type,
              other.staff,
              other.name,
              other.nameCn,
              other.image,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          type,
          staff,
          name,
          nameCn,
          image,
        ],
      );

  factory V0RelatedSubject.fromJson(Map<String, dynamic> json) =>
      _$V0RelatedSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$V0RelatedSubjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
