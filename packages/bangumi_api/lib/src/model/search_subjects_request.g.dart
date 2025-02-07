// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subjects_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSubjectsRequest _$SearchSubjectsRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchSubjectsRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['keyword'],
        );
        final val = SearchSubjectsRequest(
          keyword: $checkedConvert('keyword', (v) => v as String),
          sort: $checkedConvert(
              'sort',
              (v) =>
                  $enumDecodeNullable(
                      _$SearchSubjectsRequestSortEnumEnumMap, v) ??
                  SearchSubjectsRequestSortEnum.match),
          filter: $checkedConvert(
              'filter',
              (v) => v == null
                  ? null
                  : SearchSubjectsRequestFilter.fromJson(
                      v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchSubjectsRequestToJson(
        SearchSubjectsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      if (_$SearchSubjectsRequestSortEnumEnumMap[instance.sort]
          case final value?)
        'sort': value,
      if (instance.filter?.toJson() case final value?) 'filter': value,
    };

const _$SearchSubjectsRequestSortEnumEnumMap = {
  SearchSubjectsRequestSortEnum.match: 'match',
  SearchSubjectsRequestSortEnum.heat: 'heat',
  SearchSubjectsRequestSortEnum.rank: 'rank',
  SearchSubjectsRequestSortEnum.score: 'score',
};
