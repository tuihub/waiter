//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'revision.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Revision {
  /// Returns a new [Revision] instance.
  Revision({
    required this.id,
    required this.type,
    this.creator,
    required this.summary,
    required this.createdAt,
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

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Revision &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              creator,
              summary,
              createdAt,
            ], [
              other.id,
              other.type,
              other.creator,
              other.summary,
              other.createdAt,
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
        ],
      );

  factory Revision.fromJson(Map<String, dynamic> json) =>
      _$RevisionFromJson(json);

  Map<String, dynamic> toJson() => _$RevisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
