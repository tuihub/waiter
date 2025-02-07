//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
enum EpisodeCollectionType {
  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @JsonValue(1)
  number1('1'),

  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @JsonValue(2)
  number2('2'),

  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @JsonValue(3)
  number3('3');

  const EpisodeCollectionType(this.value);

  final String value;

  @override
  String toString() => value;
}
