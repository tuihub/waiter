// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Episode',
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
            'disc'
          ],
        );
        final val = Episode(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          sort: $checkedConvert('sort', (v) => v as num),
          ep: $checkedConvert('ep', (v) => v as num?),
          airdate: $checkedConvert('airdate', (v) => v as String),
          comment: $checkedConvert('comment', (v) => (v as num).toInt()),
          duration: $checkedConvert('duration', (v) => v as String),
          desc: $checkedConvert('desc', (v) => v as String),
          disc: $checkedConvert('disc', (v) => (v as num).toInt()),
          durationSeconds:
              $checkedConvert('duration_seconds', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'nameCn': 'name_cn',
        'durationSeconds': 'duration_seconds'
      },
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'name_cn': instance.nameCn,
      'sort': instance.sort,
      if (instance.ep case final value?) 'ep': value,
      'airdate': instance.airdate,
      'comment': instance.comment,
      'duration': instance.duration,
      'desc': instance.desc,
      'disc': instance.disc,
      if (instance.durationSeconds case final value?) 'duration_seconds': value,
    };
