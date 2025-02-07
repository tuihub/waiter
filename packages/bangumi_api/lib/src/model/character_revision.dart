//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:bangumi_api/src/model/character_revision_data_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'character_revision.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CharacterRevision {
  /// Returns a new [CharacterRevision] instance.
  CharacterRevision({
    required this.id,
    required this.type,
    this.creator,
    required this.summary,
    required this.createdAt,
    this.data,
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
    name: r'creator',
    required: false,
    includeIfNull: false,
  )
  final Creator? creator;

  @JsonKey(
    name: r'summary',
    required: true,
    includeIfNull: false,
  )
  final String summary;

  @JsonKey(
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime createdAt;

  @JsonKey(
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  final Map<String, CharacterRevisionDataItem>? data;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CharacterRevision &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              creator,
              summary,
              createdAt,
              data,
            ], [
              other.id,
              other.type,
              other.creator,
              other.summary,
              other.createdAt,
              other.data,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          type,
          creator,
          summary,
          createdAt,
          data,
        ],
      );

  factory CharacterRevision.fromJson(Map<String, dynamic> json) =>
      _$CharacterRevisionFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterRevisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
