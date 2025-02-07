//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// An enumeration.
enum PersonCareer {
  /// An enumeration.
  @JsonValue(r'producer')
  producer(r'producer'),

  /// An enumeration.
  @JsonValue(r'mangaka')
  mangaka(r'mangaka'),

  /// An enumeration.
  @JsonValue(r'artist')
  artist(r'artist'),

  /// An enumeration.
  @JsonValue(r'seiyu')
  seiyu(r'seiyu'),

  /// An enumeration.
  @JsonValue(r'writer')
  writer(r'writer'),

  /// An enumeration.
  @JsonValue(r'illustrator')
  illustrator(r'illustrator'),

  /// An enumeration.
  @JsonValue(r'actor')
  actor(r'actor');

  const PersonCareer(this.value);

  final String value;

  @override
  String toString() => value;
}
