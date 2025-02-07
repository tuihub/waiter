//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/blood_type.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:bangumi_api/src/model/person_type.dart';
import 'package:bangumi_api/src/model/person_career.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'person_detail.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonDetail {
  /// Returns a new [PersonDetail] instance.
  PersonDetail({
    required this.id,
    required this.name,
    required this.type,
    required this.career,
    this.images,
    required this.summary,
    required this.locked,
    required this.lastModified,
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

  /// currently it's latest user comment time, it will be replaced by wiki modified date in the future
  @JsonKey(
    name: r'last_modified',
    required: true,
    includeIfNull: false,
  )
  final DateTime lastModified;

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
        other is PersonDetail &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              name,
              type,
              career,
              images,
              summary,
              locked,
              lastModified,
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
              other.career,
              other.images,
              other.summary,
              other.locked,
              other.lastModified,
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
          career,
          images,
          summary,
          locked,
          lastModified,
          infobox,
          gender,
          bloodType,
          birthYear,
          birthMon,
          birthDay,
          stat,
        ],
      );

  factory PersonDetail.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
