// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedCharacter _$PagedCharacterFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PagedCharacter',
      json,
      ($checkedConvert) {
        final val = PagedCharacter(
          total: $checkedConvert('total', (v) => (v as num?)?.toInt() ?? 0),
          limit: $checkedConvert('limit', (v) => (v as num?)?.toInt() ?? 0),
          offset: $checkedConvert('offset', (v) => (v as num?)?.toInt() ?? 0),
          data: $checkedConvert(
              'data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => Character.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
        );
        return val;
      },
    );

Map<String, dynamic> _$PagedCharacterToJson(PagedCharacter instance) =>
    <String, dynamic>{
      if (instance.total case final value?) 'total': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
