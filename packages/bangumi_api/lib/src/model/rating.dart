//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/count.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'rating.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Rating {
  /// Returns a new [Rating] instance.
  Rating({
    required this.rank,
    required this.total,
    required this.count,
    required this.score,
  });

  @JsonKey(
    name: r'rank',
    required: true,
    includeIfNull: false,
  )
  final int rank;

  @JsonKey(
    name: r'total',
    required: true,
    includeIfNull: false,
  )
  final int total;

  @JsonKey(
    name: r'count',
    required: true,
    includeIfNull: false,
  )
  final Count count;

  @JsonKey(
    name: r'score',
    required: true,
    includeIfNull: false,
  )
  final num score;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Rating &&
            runtimeType == other.runtimeType &&
            equals([
              rank,
              total,
              count,
              score,
            ], [
              other.rank,
              other.total,
              other.count,
              other.score,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          rank,
          total,
          count,
          score,
        ],
      );

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
