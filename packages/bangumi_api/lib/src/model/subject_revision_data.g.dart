// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_revision_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectRevisionData _$SubjectRevisionDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SubjectRevisionData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'field_eps',
            'field_infobox',
            'field_summary',
            'name',
            'name_cn',
            'platform',
            'subject_id',
            'type',
            'type_id',
            'vote_field'
          ],
        );
        final val = SubjectRevisionData(
          fieldEps: $checkedConvert('field_eps', (v) => (v as num).toInt()),
          fieldInfobox: $checkedConvert('field_infobox', (v) => v as String),
          fieldSummary: $checkedConvert('field_summary', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          platform: $checkedConvert('platform', (v) => (v as num).toInt()),
          subjectId: $checkedConvert('subject_id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => (v as num).toInt()),
          typeId: $checkedConvert('type_id', (v) => (v as num).toInt()),
          voteField: $checkedConvert('vote_field', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'fieldEps': 'field_eps',
        'fieldInfobox': 'field_infobox',
        'fieldSummary': 'field_summary',
        'nameCn': 'name_cn',
        'subjectId': 'subject_id',
        'typeId': 'type_id',
        'voteField': 'vote_field'
      },
    );

Map<String, dynamic> _$SubjectRevisionDataToJson(
        SubjectRevisionData instance) =>
    <String, dynamic>{
      'field_eps': instance.fieldEps,
      'field_infobox': instance.fieldInfobox,
      'field_summary': instance.fieldSummary,
      'name': instance.name,
      'name_cn': instance.nameCn,
      'platform': instance.platform,
      'subject_id': instance.subjectId,
      'type': instance.type,
      'type_id': instance.typeId,
      'vote_field': instance.voteField,
    };
