//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'count.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Count {
  /// Returns a new [Count] instance.
  Count({
    this.n1,
    this.n2,
    this.n3,
    this.n4,
    this.n5,
    this.n6,
    this.n7,
    this.n8,
    this.n9,
    this.n10,
  });

  @JsonKey(
    name: r'1',
    required: false,
    includeIfNull: false,
  )
  final int? n1;

  @JsonKey(
    name: r'2',
    required: false,
    includeIfNull: false,
  )
  final int? n2;

  @JsonKey(
    name: r'3',
    required: false,
    includeIfNull: false,
  )
  final int? n3;

  @JsonKey(
    name: r'4',
    required: false,
    includeIfNull: false,
  )
  final int? n4;

  @JsonKey(
    name: r'5',
    required: false,
    includeIfNull: false,
  )
  final int? n5;

  @JsonKey(
    name: r'6',
    required: false,
    includeIfNull: false,
  )
  final int? n6;

  @JsonKey(
    name: r'7',
    required: false,
    includeIfNull: false,
  )
  final int? n7;

  @JsonKey(
    name: r'8',
    required: false,
    includeIfNull: false,
  )
  final int? n8;

  @JsonKey(
    name: r'9',
    required: false,
    includeIfNull: false,
  )
  final int? n9;

  @JsonKey(
    name: r'10',
    required: false,
    includeIfNull: false,
  )
  final int? n10;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Count &&
            runtimeType == other.runtimeType &&
            equals([
              n1,
              n2,
              n3,
              n4,
              n5,
              n6,
              n7,
              n8,
              n9,
              n10,
            ], [
              other.n1,
              other.n2,
              other.n3,
              other.n4,
              other.n5,
              other.n6,
              other.n7,
              other.n8,
              other.n9,
              other.n10,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          n1,
          n2,
          n3,
          n4,
          n5,
          n6,
          n7,
          n8,
          n9,
          n10,
        ],
      );

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);

  Map<String, dynamic> toJson() => _$CountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
