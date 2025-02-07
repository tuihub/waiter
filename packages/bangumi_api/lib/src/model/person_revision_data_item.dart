//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/person_revision_profession.dart';
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'person_revision_data_item.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonRevisionDataItem {
  /// Returns a new [PersonRevisionDataItem] instance.
  PersonRevisionDataItem({
    required this.prsnInfobox,
    required this.prsnSummary,
    required this.profession,
    required this.extra,
    required this.prsnName,
  });

  @JsonKey(
    name: r'prsn_infobox',
    required: true,
    includeIfNull: false,
  )
  final String prsnInfobox;

  @JsonKey(
    name: r'prsn_summary',
    required: true,
    includeIfNull: false,
  )
  final String prsnSummary;

  @JsonKey(
    name: r'profession',
    required: true,
    includeIfNull: false,
  )
  final PersonRevisionProfession profession;

  @JsonKey(
    name: r'extra',
    required: true,
    includeIfNull: false,
  )
  final RevisionExtra extra;

  @JsonKey(
    name: r'prsn_name',
    required: true,
    includeIfNull: false,
  )
  final String prsnName;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PersonRevisionDataItem &&
            runtimeType == other.runtimeType &&
            equals([
              prsnInfobox,
              prsnSummary,
              profession,
              extra,
              prsnName,
            ], [
              other.prsnInfobox,
              other.prsnSummary,
              other.profession,
              other.extra,
              other.prsnName,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          prsnInfobox,
          prsnSummary,
          profession,
          extra,
          prsnName,
        ],
      );

  factory PersonRevisionDataItem.fromJson(Map<String, dynamic> json) =>
      _$PersonRevisionDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonRevisionDataItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
