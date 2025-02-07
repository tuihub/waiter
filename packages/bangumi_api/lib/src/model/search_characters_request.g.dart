// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_characters_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCharactersRequest _$SearchCharactersRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchCharactersRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['keyword'],
        );
        final val = SearchCharactersRequest(
          keyword: $checkedConvert('keyword', (v) => v as String),
          filter: $checkedConvert(
              'filter',
              (v) => v == null
                  ? null
                  : SearchCharactersRequestFilter.fromJson(
                      v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchCharactersRequestToJson(
        SearchCharactersRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      if (instance.filter?.toJson() case final value?) 'filter': value,
    };
