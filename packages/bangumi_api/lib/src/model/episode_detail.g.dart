// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDetail _$EpisodeDetailFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EpisodeDetail',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'name',
            'name_cn',
            'sort',
            'airdate',
            'comment',
            'duration',
            'desc',
            'disc',
            'subject_id'
          ],
        );
        final val = EpisodeDetail(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => $enumDecode(_$EpTypeEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          sort: $checkedConvert('sort', (v) => v as num),
          ep: $checkedConvert('ep', (v) => v as num?),
          airdate: $checkedConvert('airdate', (v) => v as String),
          comment: $checkedConvert('comment', (v) => (v as num).toInt()),
          duration: $checkedConvert('duration', (v) => v as String),
          desc: $checkedConvert('desc', (v) => v as String),
          disc: $checkedConvert('disc', (v) => (v as num).toInt()),
          subjectId: $checkedConvert('subject_id', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'nameCn': 'name_cn', 'subjectId': 'subject_id'},
    );

Map<String, dynamic> _$EpisodeDetailToJson(EpisodeDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$EpTypeEnumMap[instance.type]!,
      'name': instance.name,
      'name_cn': instance.nameCn,
      'sort': instance.sort,
      if (instance.ep case final value?) 'ep': value,
      'airdate': instance.airdate,
      'comment': instance.comment,
      'duration': instance.duration,
      'desc': instance.desc,
      'disc': instance.disc,
      'subject_id': instance.subjectId,
    };

const _$EpTypeEnumMap = {
  EpType.MainStory: 0,
  EpType.SP: 1,
  EpType.OP: 2,
  EpType.ED: 3,
  EpType.PV: 4,
  EpType.MAD: 5,
  EpType.Other: 6,
};
