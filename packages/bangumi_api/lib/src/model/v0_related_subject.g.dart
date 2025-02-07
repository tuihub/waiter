// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v0_related_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V0RelatedSubject _$V0RelatedSubjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'V0RelatedSubject',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'type', 'staff', 'name', 'name_cn'],
        );
        final val = V0RelatedSubject(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$SubjectTypeEnumMap, v)),
          staff: $checkedConvert('staff', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          nameCn: $checkedConvert('name_cn', (v) => v as String),
          image: $checkedConvert('image', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'nameCn': 'name_cn'},
    );

Map<String, dynamic> _$V0RelatedSubjectToJson(V0RelatedSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SubjectTypeEnumMap[instance.type]!,
      'staff': instance.staff,
      'name': instance.name,
      'name_cn': instance.nameCn,
      if (instance.image case final value?) 'image': value,
    };

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};
