//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'character_revision_data_item.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterRevisionDataItem {
  /// Returns a new [CharacterRevisionDataItem] instance.
  CharacterRevisionDataItem({
    required this.infobox,
    required this.summary,
    required this.name,
    required this.extra,
  });

  @JsonKey(
    name: r'infobox',
    required: true,
    includeIfNull: false,
  )
  final String infobox;

  @JsonKey(
    name: r'summary',
    required: true,
    includeIfNull: false,
  )
  final String summary;

  @JsonKey(
    name: r'name',
    required: true,
    includeIfNull: false,
  )
  final String name;

  @JsonKey(
    name: r'extra',
    required: true,
    includeIfNull: false,
  )
  final RevisionExtra extra;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CharacterRevisionDataItem &&
            runtimeType == other.runtimeType &&
            equals([
              infobox,
              summary,
              name,
              extra,
            ], [
              other.infobox,
              other.summary,
              other.name,
              other.extra,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          infobox,
          summary,
          name,
          extra,
        ],
      );

  factory CharacterRevisionDataItem.fromJson(Map<String, dynamic> json) =>
      _$CharacterRevisionDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterRevisionDataItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
