// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_user_subject_episode_collection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchUserSubjectEpisodeCollectionRequest
    _$PatchUserSubjectEpisodeCollectionRequestFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'PatchUserSubjectEpisodeCollectionRequest',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              requiredKeys: const ['episode_id', 'type'],
            );
            final val = PatchUserSubjectEpisodeCollectionRequest(
              episodeId: $checkedConvert(
                  'episode_id',
                  (v) => (v as List<dynamic>)
                      .map((e) => (e as num).toInt())
                      .toList()),
              type: $checkedConvert('type',
                  (v) => $enumDecode(_$EpisodeCollectionTypeEnumMap, v)),
            );
            return val;
          },
          fieldKeyMap: const {'episodeId': 'episode_id'},
        );

Map<String, dynamic> _$PatchUserSubjectEpisodeCollectionRequestToJson(
        PatchUserSubjectEpisodeCollectionRequest instance) =>
    <String, dynamic>{
      'episode_id': instance.episodeId,
      'type': _$EpisodeCollectionTypeEnumMap[instance.type]!,
    };

const _$EpisodeCollectionTypeEnumMap = {
  EpisodeCollectionType.number1: 1,
  EpisodeCollectionType.number2: 2,
  EpisodeCollectionType.number3: 3,
};
