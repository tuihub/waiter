//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/revision.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'paged_revision.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PagedRevision {
  /// Returns a new [PagedRevision] instance.
  PagedRevision({
    this.total = 0,
    this.limit = 0,
    this.offset = 0,
    this.data = const [],
  });

  @JsonKey(
    defaultValue: 0,
    name: r'total',
    required: false,
    includeIfNull: false,
  )
  final int? total;

  @JsonKey(
    defaultValue: 0,
    name: r'limit',
    required: false,
    includeIfNull: false,
  )
  final int? limit;

  @JsonKey(
    defaultValue: 0,
    name: r'offset',
    required: false,
    includeIfNull: false,
  )
  final int? offset;

  @JsonKey(
    defaultValue: [],
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  final List<Revision>? data;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PagedRevision &&
            runtimeType == other.runtimeType &&
            equals([
              total,
              limit,
              offset,
              data,
            ], [
              other.total,
              other.limit,
              other.offset,
              other.data,
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
          data,
        ],
      );

  factory PagedRevision.fromJson(Map<String, dynamic> json) =>
      _$PagedRevisionFromJson(json);

  Map<String, dynamic> toJson() => _$PagedRevisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
