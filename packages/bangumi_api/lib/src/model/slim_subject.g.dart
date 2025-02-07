// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slim_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlimSubject _$SlimSubjectFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SlimSubject',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'name',
            'name_cn',
            'short_summary',
            'images',
            'volumes',
            'eps',
            'collection_total',
            'score',
            'rank',
            'tags'
          ],
        );
        final val = SlimSubject(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$SubjectTypeEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          shortSummary: $checkedConvert('short_summary', (v) => v as String),
          date: $checkedConvert('date', (v) => v as String?),
          images: $checkedConvert(
              'images', (v) => Images.fromJson(v as Map<String, dynamic>)),
          volumes: $checkedConvert('volumes', (v) => (v as num).toInt()),
          eps: $checkedConvert('eps', (v) => (v as num).toInt()),
          collectionTotal:
              $checkedConvert('collection_total', (v) => (v as num).toInt()),
          score: $checkedConvert('score', (v) => v as num),
          rank: $checkedConvert('rank', (v) => (v as num).toInt()),
          tags: $checkedConvert(
              'tags',
              (v) => (v as List<dynamic>)
                  .map((e) => Tag.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'nameCn': 'name_cn',
        'shortSummary': 'short_summary',
        'collectionTotal': 'collection_total'
      },
    );

Map<String, dynamic> _$SlimSubjectToJson(SlimSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SubjectTypeEnumMap[instance.type]!,
      'name': instance.name,
      'name_cn': instance.nameCn,
      'short_summary': instance.shortSummary,
      if (instance.date case final value?) 'date': value,
      'images': instance.images.toJson(),
      'volumes': instance.volumes,
      'eps': instance.eps,
      'collection_total': instance.collectionTotal,
      'score': instance.score,
      'rank': instance.rank,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};
