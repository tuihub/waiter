// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_revision_data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterRevisionDataItem _$CharacterRevisionDataItemFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'CharacterRevisionDataItem',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['infobox', 'summary', 'name', 'extra'],
        );
        final val = CharacterRevisionDataItem(
          infobox: $checkedConvert('infobox', (v) => v as String),
          summary: $checkedConvert('summary', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          extra: $checkedConvert('extra',
              (v) => RevisionExtra.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$CharacterRevisionDataItemToJson(
        CharacterRevisionDataItem instance) =>
    <String, dynamic>{
      'infobox': instance.infobox,
      'summary': instance.summary,
      'name': instance.name,
      'extra': instance.extra.toJson(),
    };
