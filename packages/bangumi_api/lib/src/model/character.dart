//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:bangumi_api/src/model/blood_type.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'character.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Character {
  /// Returns a new [Character] instance.
  Character({
    required this.id,
    required this.name,
    required this.type,
    this.images,
    required this.summary,
    required this.locked,
    this.infobox,
    this.gender,
    this.bloodType,
    this.birthYear,
    this.birthMon,
    this.birthDay,
    required this.stat,
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
    name: r'summary',
    required: true,
    includeIfNull: false,
  )
  final String summary;

  @JsonKey(
    name: r'locked',
    required: true,
    includeIfNull: false,
  )
  final bool locked;

  /// server parsed infobox, a map from key to string or tuple null if server infobox is not valid
  @JsonKey(
    name: r'infobox',
    required: false,
    includeIfNull: false,
  )
  final List<Object>? infobox;

  /// parsed from wiki, maybe null
  @JsonKey(
    name: r'gender',
    required: false,
    includeIfNull: false,
  )
  final String? gender;

  /// parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O`
  @JsonKey(
    name: r'blood_type',
    required: false,
    includeIfNull: false,
  )
  final BloodType? bloodType;

  /// parsed from wiki, maybe `null`
  @JsonKey(
    name: r'birth_year',
    required: false,
    includeIfNull: false,
  )
  final int? birthYear;

  /// parsed from wiki, maybe `null`
  @JsonKey(
    name: r'birth_mon',
    required: false,
    includeIfNull: false,
  )
  final int? birthMon;

  /// parsed from wiki, maybe `null`
  @JsonKey(
    name: r'birth_day',
    required: false,
    includeIfNull: false,
  )
  final int? birthDay;

  @JsonKey(
    name: r'stat',
    required: true,
    includeIfNull: false,
  )
  final Stat stat;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Character &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              images,
              summary,
              locked,
              infobox,
              gender,
              bloodType,
              birthYear,
              birthMon,
              birthDay,
              stat,
            ], [
              other.id,
              other.name,
              other.type,
              other.images,
              other.summary,
              other.locked,
              other.infobox,
              other.gender,
              other.bloodType,
              other.birthYear,
              other.birthMon,
              other.birthDay,
              other.stat,
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
          summary,
          locked,
          infobox,
          gender,
          bloodType,
          birthYear,
          birthMon,
          birthDay,
          stat,
        ],
      );

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
