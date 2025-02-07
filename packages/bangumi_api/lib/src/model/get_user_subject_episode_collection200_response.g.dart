// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_subject_episode_collection200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSubjectEpisodeCollection200Response
    _$GetUserSubjectEpisodeCollection200ResponseFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'GetUserSubjectEpisodeCollection200Response',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              requiredKeys: const ['total', 'limit', 'offset'],
            );
            final val = GetUserSubjectEpisodeCollection200Response(
              total: $checkedConvert('total', (v) => (v as num).toInt()),
              limit: $checkedConvert('limit', (v) => (v as num).toInt()),
              offset: $checkedConvert('offset', (v) => (v as num).toInt()),
              data: $checkedConvert(
                  'data',
                  (v) => (v as List<dynamic>?)
                      ?.map((e) => UserEpisodeCollection.fromJson(
                          e as Map<String, dynamic>))
                      .toList()),
            );
            return val;
          },
        );

Map<String, dynamic> _$GetUserSubjectEpisodeCollection200ResponseToJson(
        GetUserSubjectEpisodeCollection200Response instance) =>
    <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
