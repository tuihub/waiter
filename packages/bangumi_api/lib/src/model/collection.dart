//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'collection.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Collection {
  /// Returns a new [Collection] instance.
  Collection({
    required this.wish,
    required this.collect,
    required this.doing,
    required this.onHold,
    required this.dropped,
  });

  @JsonKey(
    name: r'wish',
    required: true,
    includeIfNull: false,
  )
  final int wish;

  @JsonKey(
    name: r'collect',
    required: true,
    includeIfNull: false,
  )
  final int collect;

  @JsonKey(
    name: r'doing',
    required: true,
    includeIfNull: false,
  )
  final int doing;

  @JsonKey(
    name: r'on_hold',
    required: true,
    includeIfNull: false,
  )
  final int onHold;

  @JsonKey(
    name: r'dropped',
    required: true,
    includeIfNull: false,
  )
  final int dropped;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Collection &&
            runtimeType == other.runtimeType &&
            equals([
              wish,
              collect,
              doing,
              onHold,
              dropped,
            ], [
              other.wish,
              other.collect,
              other.doing,
              other.onHold,
              other.dropped,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          wish,
          collect,
          doing,
          onHold,
          dropped,
        ],
      );

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
