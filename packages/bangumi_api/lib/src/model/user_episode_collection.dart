//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/episode_collection_type.dart';
import 'package:bangumi_api/src/model/episode.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_episode_collection.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserEpisodeCollection {
  /// Returns a new [UserEpisodeCollection] instance.
  UserEpisodeCollection({
    required this.episode,
    required this.type,
  });

  @JsonKey(
    name: r'episode',
    required: true,
    includeIfNull: false,
  )
  final Episode episode;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final EpisodeCollectionType type;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserEpisodeCollection &&
            runtimeType == other.runtimeType &&
            equals([
              episode,
              type,
            ], [
              other.episode,
              other.type,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          episode,
          type,
        ],
      );

  factory UserEpisodeCollection.fromJson(Map<String, dynamic> json) =>
      _$UserEpisodeCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$UserEpisodeCollectionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
