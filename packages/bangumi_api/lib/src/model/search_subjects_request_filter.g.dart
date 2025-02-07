// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subjects_request_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSubjectsRequestFilter _$SearchSubjectsRequestFilterFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchSubjectsRequestFilter',
      json,
      ($checkedConvert) {
        final val = SearchSubjectsRequestFilter(
          type: $checkedConvert(
              'type',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$SubjectTypeEnumMap, e))
                  .toList()),
          metaTags: $checkedConvert('meta_tags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          tag: $checkedConvert('tag',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          airDate: $checkedConvert('air_date',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          rating: $checkedConvert('rating',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          rank: $checkedConvert('rank',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          nsfw: $checkedConvert('nsfw', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'metaTags': 'meta_tags', 'airDate': 'air_date'},
    );

Map<String, dynamic> _$SearchSubjectsRequestFilterToJson(
        SearchSubjectsRequestFilter instance) =>
    <String, dynamic>{
      if (instance.type?.map((e) => _$SubjectTypeEnumMap[e]!).toList()
          case final value?)
        'type': value,
      if (instance.metaTags case final value?) 'meta_tags': value,
      if (instance.tag case final value?) 'tag': value,
      if (instance.airDate case final value?) 'air_date': value,
      if (instance.rating case final value?) 'rating': value,
      if (instance.rank case final value?) 'rank': value,
      if (instance.nsfw case final value?) 'nsfw': value,
    };

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};
