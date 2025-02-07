// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_characters_request_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCharactersRequestFilter _$SearchCharactersRequestFilterFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchCharactersRequestFilter',
      json,
      ($checkedConvert) {
        final val = SearchCharactersRequestFilter(
          nsfw: $checkedConvert('nsfw', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SearchCharactersRequestFilterToJson(
        SearchCharactersRequestFilter instance) =>
    <String, dynamic>{
      if (instance.nsfw case final value?) 'nsfw': value,
    };
