// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Subject',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'name',
            'name_cn',
            'summary',
            'series',
            'nsfw',
            'locked',
            'platform',
            'images',
            'volumes',
            'eps',
            'rating',
            'collection',
            'meta_tags',
            'tags'
          ],
        );
        final val = Subject(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$SubjectTypeEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          summary: $checkedConvert('summary', (v) => v as String),
          series: $checkedConvert('series', (v) => v as bool),
          nsfw: $checkedConvert('nsfw', (v) => v as bool),
          locked: $checkedConvert('locked', (v) => v as bool),
          date: $checkedConvert('date', (v) => v as String?),
          platform: $checkedConvert('platform', (v) => v as String),
          images: $checkedConvert(
              'images', (v) => Images.fromJson(v as Map<String, dynamic>)),
          volumes: $checkedConvert('volumes', (v) => (v as num).toInt()),
          eps: $checkedConvert('eps', (v) => (v as num).toInt()),
          totalEpisodes:
              $checkedConvert('total_episodes', (v) => (v as num?)?.toInt()),
          rating: $checkedConvert(
              'rating', (v) => Rating.fromJson(v as Map<String, dynamic>)),
          collection: $checkedConvert('collection',
              (v) => Collection.fromJson(v as Map<String, dynamic>)),
          metaTags: $checkedConvert('meta_tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
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
        'totalEpisodes': 'total_episodes',
        'metaTags': 'meta_tags'
      },
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$SubjectTypeEnumMap[instance.type]!,
      'name': instance.name,
      'name_cn': instance.nameCn,
      'summary': instance.summary,
      'series': instance.series,
      'nsfw': instance.nsfw,
      'locked': instance.locked,
      if (instance.date case final value?) 'date': value,
      'platform': instance.platform,
      'images': instance.images.toJson(),
      'volumes': instance.volumes,
      'eps': instance.eps,
      if (instance.totalEpisodes case final value?) 'total_episodes': value,
      'rating': instance.rating.toJson(),
      'collection': instance.collection.toJson(),
      'meta_tags': instance.metaTags,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
    };

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};
