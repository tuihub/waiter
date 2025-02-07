// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_user_episode_collection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutUserEpisodeCollectionRequest _$PutUserEpisodeCollectionRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PutUserEpisodeCollectionRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['type'],
        );
        final val = PutUserEpisodeCollectionRequest(
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$EpisodeCollectionTypeEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PutUserEpisodeCollectionRequestToJson(
        PutUserEpisodeCollectionRequest instance) =>
    <String, dynamic>{
      'type': _$EpisodeCollectionTypeEnumMap[instance.type]!,
    };

const _$EpisodeCollectionTypeEnumMap = {
  EpisodeCollectionType.number1: 1,
  EpisodeCollectionType.number2: 2,
  EpisodeCollectionType.number3: 3,
};
