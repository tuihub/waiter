// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_persons_request_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPersonsRequestFilter _$SearchPersonsRequestFilterFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchPersonsRequestFilter',
      json,
      ($checkedConvert) {
        final val = SearchPersonsRequestFilter(
          career: $checkedConvert('career',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchPersonsRequestFilterToJson(
        SearchPersonsRequestFilter instance) =>
    <String, dynamic>{
      if (instance.career case final value?) 'career': value,
    };
