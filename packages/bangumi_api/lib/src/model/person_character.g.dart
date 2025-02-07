// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonCharacter _$PersonCharacterFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonCharacter',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'type',
            'subject_id',
            'subject_type',
            'subject_name',
            'subject_name_cn'
          ],
        );
        final val = PersonCharacter(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$CharacterTypeEnumMap, v)),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : PersonImages.fromJson(v as Map<String, dynamic>)),
          subjectId: $checkedConvert('subject_id', (v) => (v as num).toInt()),
          subjectType: $checkedConvert(
              'subject_type', (v) => $enumDecode(_$SubjectTypeEnumMap, v)),
          subjectName: $checkedConvert('subject_name', (v) => v as String),
          subjectNameCn: $checkedConvert('subject_name_cn', (v) => v as String),
          staff: $checkedConvert('staff', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'subjectId': 'subject_id',
        'subjectType': 'subject_type',
        'subjectName': 'subject_name',
        'subjectNameCn': 'subject_name_cn'
      },
    );

Map<String, dynamic> _$PersonCharacterToJson(PersonCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CharacterTypeEnumMap[instance.type]!,
      if (instance.images?.toJson() case final value?) 'images': value,
      'subject_id': instance.subjectId,
      'subject_type': _$SubjectTypeEnumMap[instance.subjectType]!,
      'subject_name': instance.subjectName,
      'subject_name_cn': instance.subjectNameCn,
      if (instance.staff case final value?) 'staff': value,
    };

const _$CharacterTypeEnumMap = {
  CharacterType.Character: 1,
  CharacterType.Mechanic: 2,
  CharacterType.Ship: 3,
  CharacterType.Organization: 4,
};

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};
