//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'revision_extra.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RevisionExtra {
  /// Returns a new [RevisionExtra] instance.
  RevisionExtra({
    this.img,
  });

  @JsonKey(
    name: r'img',
    required: false,
    includeIfNull: false,
  )
  final String? img;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RevisionExtra &&
            runtimeType == other.runtimeType &&
            equals([
              img,
            ], [
              other.img,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          img,
        ],
      );

  factory RevisionExtra.fromJson(Map<String, dynamic> json) =>
      _$RevisionExtraFromJson(json);

  Map<String, dynamic> toJson() => _$RevisionExtraToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
