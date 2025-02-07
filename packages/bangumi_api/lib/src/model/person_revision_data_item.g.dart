// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_revision_data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRevisionDataItem _$PersonRevisionDataItemFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonRevisionDataItem',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'prsn_infobox',
            'prsn_summary',
            'profession',
            'extra',
            'prsn_name'
          ],
        );
        final val = PersonRevisionDataItem(
          prsnInfobox: $checkedConvert('prsn_infobox', (v) => v as String),
          prsnSummary: $checkedConvert('prsn_summary', (v) => v as String),
          profession: $checkedConvert(
              'profession',
              (v) =>
                  PersonRevisionProfession.fromJson(v as Map<String, dynamic>)),
          extra: $checkedConvert('extra',
              (v) => RevisionExtra.fromJson(v as Map<String, dynamic>)),
          prsnName: $checkedConvert('prsn_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'prsnInfobox': 'prsn_infobox',
        'prsnSummary': 'prsn_summary',
        'prsnName': 'prsn_name'
      },
    );

Map<String, dynamic> _$PersonRevisionDataItemToJson(
        PersonRevisionDataItem instance) =>
    <String, dynamic>{
      'prsn_infobox': instance.prsnInfobox,
      'prsn_summary': instance.prsnSummary,
      'profession': instance.profession.toJson(),
      'extra': instance.extra.toJson(),
      'prsn_name': instance.prsnName,
    };
