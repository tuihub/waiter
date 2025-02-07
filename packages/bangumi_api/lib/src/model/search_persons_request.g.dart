// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_persons_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPersonsRequest _$SearchPersonsRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchPersonsRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['keyword'],
        );
        final val = SearchPersonsRequest(
          keyword: $checkedConvert('keyword', (v) => v as String),
          filter: $checkedConvert(
              'filter',
              (v) => v == null
                  ? null
                  : SearchPersonsRequestFilter.fromJson(
                      v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchPersonsRequestToJson(
        SearchPersonsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      if (instance.filter?.toJson() case final value?) 'filter': value,
    };
