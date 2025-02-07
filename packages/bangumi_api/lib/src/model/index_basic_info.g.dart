// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_basic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexBasicInfo _$IndexBasicInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IndexBasicInfo',
      json,
      ($checkedConvert) {
        final val = IndexBasicInfo(
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$IndexBasicInfoToJson(IndexBasicInfo instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.description case final value?) 'description': value,
    };
