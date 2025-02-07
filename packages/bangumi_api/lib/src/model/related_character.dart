//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:bangumi_api/src/model/person.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'related_character.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RelatedCharacter {
  /// Returns a new [RelatedCharacter] instance.
  RelatedCharacter({
    required this.id,
    required this.name,
    required this.type,
    this.images,
    required this.relation,
    this.actors = const [],
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
    name: r'relation',
    required: true,
    includeIfNull: false,
  )
  final String relation;

  /// 演员列表
  @JsonKey(
    defaultValue: [],
    name: r'actors',
    required: false,
    includeIfNull: false,
  )
  final List<Person>? actors;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RelatedCharacter &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              images,
              relation,
              actors,
            ], [
              other.id,
              other.name,
              other.type,
              other.images,
              other.relation,
              other.actors,
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
          relation,
          actors,
        ],
      );

  factory RelatedCharacter.fromJson(Map<String, dynamic> json) =>
      _$RelatedCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedCharacterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
