//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'character_person.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterPerson {
  /// Returns a new [CharacterPerson] instance.
  CharacterPerson({
    required this.id,
    required this.name,
    required this.type,
    this.images,
    required this.subjectId,
    required this.subjectType,
    required this.subjectName,
    required this.subjectNameCn,
    this.staff,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  @JsonKey(
    name: r'name',
    required: true,
    includeIfNull: false,
  )
  final String name;

  /// 角色，机体，舰船，组织...
  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final CharacterType type;

  /// object with some size of images, this object maybe `null`
  @JsonKey(
    name: r'images',
    required: false,
    includeIfNull: false,
  )
  final PersonImages? images;

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
    name: r'subject_name',
    required: true,
    includeIfNull: false,
  )
  final String subjectName;

  @JsonKey(
    name: r'subject_name_cn',
    required: true,
    includeIfNull: false,
  )
  final String subjectNameCn;

  @JsonKey(
    name: r'staff',
    required: false,
    includeIfNull: false,
  )
  final String? staff;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CharacterPerson &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              images,
              subjectId,
              subjectType,
              subjectName,
              subjectNameCn,
              staff,
            ], [
              other.id,
              other.name,
              other.type,
              other.images,
              other.subjectId,
              other.subjectType,
              other.subjectName,
              other.subjectNameCn,
              other.staff,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          name,
          type,
          images,
          subjectId,
          subjectType,
          subjectName,
          subjectNameCn,
          staff,
        ],
      );

  factory CharacterPerson.fromJson(Map<String, dynamic> json) =>
      _$CharacterPersonFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
