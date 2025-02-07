//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'put_user_episode_collection_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PutUserEpisodeCollectionRequest {
  /// Returns a new [PutUserEpisodeCollectionRequest] instance.
  PutUserEpisodeCollectionRequest({
    required this.type,
  });

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final EpisodeCollectionType type;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PutUserEpisodeCollectionRequest &&
            runtimeType == other.runtimeType &&
            equals([
              type,
            ], [
              other.type,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          type,
        ],
      );

  factory PutUserEpisodeCollectionRequest.fromJson(Map<String, dynamic> json) =>
      _$PutUserEpisodeCollectionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PutUserEpisodeCollectionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
