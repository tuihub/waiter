//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'page.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Page {
  /// Returns a new [Page] instance.
  Page({
    required this.total,
    required this.limit,
    required this.offset,
  });

  @JsonKey(
    name: r'total',
    required: true,
    includeIfNull: false,
  )
  final int total;

  @JsonKey(
    name: r'limit',
    required: true,
    includeIfNull: false,
  )
  final int limit;

  @JsonKey(
    name: r'offset',
    required: true,
    includeIfNull: false,
  )
  final int offset;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Page &&
            runtimeType == other.runtimeType &&
            equals([
              total,
              limit,
              offset,
            ], [
              other.total,
              other.limit,
              other.offset,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          total,
          limit,
          offset,
        ],
      );

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
