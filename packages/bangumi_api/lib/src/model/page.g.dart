// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Page',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['total', 'limit', 'offset'],
        );
        final val = Page(
          total: $checkedConvert('total', (v) => (v as num).toInt()),
          limit: $checkedConvert('limit', (v) => (v as num).toInt()),
          offset: $checkedConvert('offset', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };
