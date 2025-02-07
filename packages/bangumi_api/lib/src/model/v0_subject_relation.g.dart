// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v0_subject_relation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V0SubjectRelation _$V0SubjectRelationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'V0SubjectRelation',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'type', 'name', 'name_cn', 'relation'],
        );
        final val = V0SubjectRelation(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : Images.fromJson(v as Map<String, dynamic>)),
          relation: $checkedConvert('relation', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'nameCn': 'name_cn'},
    );

Map<String, dynamic> _$V0SubjectRelationToJson(V0SubjectRelation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'name_cn': instance.nameCn,
      if (instance.images?.toJson() case final value?) 'images': value,
      'relation': instance.relation,
    };
