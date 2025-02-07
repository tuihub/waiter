//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'person_revision_profession.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonRevisionProfession {
  /// Returns a new [PersonRevisionProfession] instance.
  PersonRevisionProfession({
    this.producer,
    this.mangaka,
    this.artist,
    this.seiyu,
    this.writer,
    this.illustrator,
    this.actor,
  });

  @JsonKey(
    name: r'producer',
    required: false,
    includeIfNull: false,
  )
  final String? producer;

  @JsonKey(
    name: r'mangaka',
    required: false,
    includeIfNull: false,
  )
  final String? mangaka;

  @JsonKey(
    name: r'artist',
    required: false,
    includeIfNull: false,
  )
  final String? artist;

  @JsonKey(
    name: r'seiyu',
    required: false,
    includeIfNull: false,
  )
  final String? seiyu;

  @JsonKey(
    name: r'writer',
    required: false,
    includeIfNull: false,
  )
  final String? writer;

  @JsonKey(
    name: r'illustrator',
    required: false,
    includeIfNull: false,
  )
  final String? illustrator;

  @JsonKey(
    name: r'actor',
    required: false,
    includeIfNull: false,
  )
  final String? actor;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PersonRevisionProfession &&
            runtimeType == other.runtimeType &&
            equals([
              producer,
              mangaka,
              artist,
              seiyu,
              writer,
              illustrator,
              actor,
            ], [
              other.producer,
              other.mangaka,
              other.artist,
              other.seiyu,
              other.writer,
              other.illustrator,
              other.actor,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          producer,
          mangaka,
          artist,
          seiyu,
          writer,
          illustrator,
          actor,
        ],
      );

  factory PersonRevisionProfession.fromJson(Map<String, dynamic> json) =>
      _$PersonRevisionProfessionFromJson(json);

  Map<String, dynamic> toJson() => _$PersonRevisionProfessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
