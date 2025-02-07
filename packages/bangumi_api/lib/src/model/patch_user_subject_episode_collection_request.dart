//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'patch_user_subject_episode_collection_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PatchUserSubjectEpisodeCollectionRequest {
  /// Returns a new [PatchUserSubjectEpisodeCollectionRequest] instance.
  PatchUserSubjectEpisodeCollectionRequest({
    required this.episodeId,
    required this.type,
  });

  @JsonKey(
    name: r'episode_id',
    required: true,
    includeIfNull: false,
  )
  final List<int> episodeId;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final EpisodeCollectionType type;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PatchUserSubjectEpisodeCollectionRequest &&
            runtimeType == other.runtimeType &&
            equals([
              episodeId,
              type,
            ], [
              other.episodeId,
              other.type,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          episodeId,
          type,
        ],
      );

  factory PatchUserSubjectEpisodeCollectionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PatchUserSubjectEpisodeCollectionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PatchUserSubjectEpisodeCollectionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
