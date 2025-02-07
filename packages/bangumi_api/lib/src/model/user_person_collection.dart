//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:bangumi_api/src/model/person_type.dart';
import 'package:bangumi_api/src/model/person_career.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_person_collection.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserPersonCollection {
  /// Returns a new [UserPersonCollection] instance.
  UserPersonCollection({
    required this.id,
    required this.name,
    required this.type,
    required this.career,
    this.images,
    required this.createdAt,
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

  /// `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final PersonType type;

  @JsonKey(
    name: r'career',
    required: true,
    includeIfNull: false,
  )
  final List<PersonCareer> career;

  /// object with some size of images, this object maybe `null`
  @JsonKey(
    name: r'images',
    required: false,
    includeIfNull: false,
  )
  final PersonImages? images;

  @JsonKey(
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime createdAt;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserPersonCollection &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              career,
              images,
              createdAt,
            ], [
              other.id,
              other.name,
              other.type,
              other.career,
              other.images,
              other.createdAt,
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
          career,
          images,
          createdAt,
        ],
      );

  factory UserPersonCollection.fromJson(Map<String, dynamic> json) =>
      _$UserPersonCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$UserPersonCollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
