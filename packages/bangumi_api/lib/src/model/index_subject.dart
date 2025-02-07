//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/item.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'index_subject.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IndexSubject {
  /// Returns a new [IndexSubject] instance.
  IndexSubject({
    required this.id,
    required this.type,
    required this.name,
    this.images,
    this.infobox,
    this.date,
    required this.comment,
    required this.addedAt,
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
    name: r'images',
    required: false,
    includeIfNull: false,
  )
  final Images? images;

  @JsonKey(
    name: r'infobox',
    required: false,
    includeIfNull: false,
  )
  final List<Item>? infobox;

  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  final String? date;

  @JsonKey(
    name: r'comment',
    required: true,
    includeIfNull: false,
  )
  final String comment;

  @JsonKey(
    name: r'added_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime addedAt;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is IndexSubject &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              name,
              images,
              infobox,
              date,
              comment,
              addedAt,
            ], [
              other.id,
              other.type,
              other.name,
              other.images,
              other.infobox,
              other.date,
              other.comment,
              other.addedAt,
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
          images,
          infobox,
          date,
          comment,
          addedAt,
        ],
      );

  factory IndexSubject.fromJson(Map<String, dynamic> json) =>
      _$IndexSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$IndexSubjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
