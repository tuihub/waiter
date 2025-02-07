//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'v0_subject_relation.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class V0SubjectRelation {
  /// Returns a new [V0SubjectRelation] instance.
  V0SubjectRelation({
    required this.id,
    required this.type,
    required this.name,
    required this.nameCn,
    this.images,
    required this.relation,
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
    name: r'images',
    required: false,
    includeIfNull: false,
  )
  final Images? images;

  @JsonKey(
    name: r'relation',
    required: true,
    includeIfNull: false,
  )
  final String relation;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is V0SubjectRelation &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              name,
              nameCn,
              images,
              relation,
            ], [
              other.id,
              other.type,
              other.name,
              other.nameCn,
              other.images,
              other.relation,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          type,
          name,
          nameCn,
          images,
          relation,
        ],
      );

  factory V0SubjectRelation.fromJson(Map<String, dynamic> json) =>
      _$V0SubjectRelationFromJson(json);

  Map<String, dynamic> toJson() => _$V0SubjectRelationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
