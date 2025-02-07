// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_episode_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEpisodeCollection _$UserEpisodeCollectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UserEpisodeCollection',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['episode', 'type'],
        );
        final val = UserEpisodeCollection(
          episode: $checkedConvert(
              'episode', (v) => Episode.fromJson(v as Map<String, dynamic>)),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$EpisodeCollectionTypeEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserEpisodeCollectionToJson(
        UserEpisodeCollection instance) =>
    <String, dynamic>{
      'episode': instance.episode.toJson(),
      'type': _$EpisodeCollectionTypeEnumMap[instance.type]!,
    };

const _$EpisodeCollectionTypeEnumMap = {
  EpisodeCollectionType.number1: 1,
  EpisodeCollectionType.number2: 2,
  EpisodeCollectionType.number3: 3,
};
