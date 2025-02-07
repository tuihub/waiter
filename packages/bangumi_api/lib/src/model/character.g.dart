// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Character',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'type',
            'summary',
            'locked',
            'stat'
          ],
        );
        final val = Character(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$CharacterTypeEnumMap, v)),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : PersonImages.fromJson(v as Map<String, dynamic>)),
          summary: $checkedConvert('summary', (v) => v as String),
          locked: $checkedConvert('locked', (v) => v as bool),
          infobox: $checkedConvert('infobox',
              (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList()),
          gender: $checkedConvert('gender', (v) => v as String?),
          bloodType: $checkedConvert(
              'blood_type', (v) => $enumDecodeNullable(_$BloodTypeEnumMap, v)),
          birthYear: $checkedConvert('birth_year', (v) => (v as num?)?.toInt()),
          birthMon: $checkedConvert('birth_mon', (v) => (v as num?)?.toInt()),
          birthDay: $checkedConvert('birth_day', (v) => (v as num?)?.toInt()),
          stat: $checkedConvert(
              'stat', (v) => Stat.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'bloodType': 'blood_type',
        'birthYear': 'birth_year',
        'birthMon': 'birth_mon',
        'birthDay': 'birth_day'
      },
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CharacterTypeEnumMap[instance.type]!,
      if (instance.images?.toJson() case final value?) 'images': value,
      'summary': instance.summary,
      'locked': instance.locked,
      if (instance.infobox case final value?) 'infobox': value,
      if (instance.gender case final value?) 'gender': value,
      if (_$BloodTypeEnumMap[instance.bloodType] case final value?)
        'blood_type': value,
      if (instance.birthYear case final value?) 'birth_year': value,
      if (instance.birthMon case final value?) 'birth_mon': value,
      if (instance.birthDay case final value?) 'birth_day': value,
      'stat': instance.stat.toJson(),
    };

const _$CharacterTypeEnumMap = {
  CharacterType.Character: 1,
  CharacterType.Mechanic: 2,
  CharacterType.Ship: 3,
  CharacterType.Organization: 4,
};

const _$BloodTypeEnumMap = {
  BloodType.A: 1,
  BloodType.B: 2,
  BloodType.AB: 3,
  BloodType.O: 4,
};
