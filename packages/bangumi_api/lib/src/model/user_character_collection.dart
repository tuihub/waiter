//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_character_collection.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserCharacterCollection {
  /// Returns a new [UserCharacterCollection] instance.
  UserCharacterCollection({
    required this.id,
    required this.name,
    required this.type,
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
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime createdAt;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserCharacterCollection &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              images,
              createdAt,
            ], [
              other.id,
              other.name,
              other.type,
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
          images,
          createdAt,
        ],
      );

  factory UserCharacterCollection.fromJson(Map<String, dynamic> json) =>
      _$UserCharacterCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$UserCharacterCollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
