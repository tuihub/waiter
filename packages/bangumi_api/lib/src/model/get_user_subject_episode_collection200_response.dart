//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/user_episode_collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'get_user_subject_episode_collection200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetUserSubjectEpisodeCollection200Response {
  /// Returns a new [GetUserSubjectEpisodeCollection200Response] instance.
  GetUserSubjectEpisodeCollection200Response({
    required this.total,
    required this.limit,
    required this.offset,
    this.data,
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

  @JsonKey(
    name: r'data',
    required: false,
    includeIfNull: false,
  )
  final List<UserEpisodeCollection>? data;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GetUserSubjectEpisodeCollection200Response &&
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

  factory GetUserSubjectEpisodeCollection200Response.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserSubjectEpisodeCollection200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetUserSubjectEpisodeCollection200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
