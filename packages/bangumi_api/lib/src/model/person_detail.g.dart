// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonDetail',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'type',
            'career',
            'summary',
            'locked',
            'last_modified',
            'stat'
          ],
        );
        final val = PersonDetail(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$PersonTypeEnumMap, v)),
          career: $checkedConvert(
              'career',
              (v) => (v as List<dynamic>)
                  .map((e) => $enumDecode(_$PersonCareerEnumMap, e))
                  .toList()),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : PersonImages.fromJson(v as Map<String, dynamic>)),
          summary: $checkedConvert('summary', (v) => v as String),
          locked: $checkedConvert('locked', (v) => v as bool),
          lastModified: $checkedConvert(
              'last_modified', (v) => DateTime.parse(v as String)),
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
        'lastModified': 'last_modified',
        'bloodType': 'blood_type',
        'birthYear': 'birth_year',
        'birthMon': 'birth_mon',
        'birthDay': 'birth_day'
      },
    );

Map<String, dynamic> _$PersonDetailToJson(PersonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PersonTypeEnumMap[instance.type]!,
      'career': instance.career.map((e) => _$PersonCareerEnumMap[e]!).toList(),
      if (instance.images?.toJson() case final value?) 'images': value,
      'summary': instance.summary,
      'locked': instance.locked,
      'last_modified': instance.lastModified.toIso8601String(),
      if (instance.infobox case final value?) 'infobox': value,
      if (instance.gender case final value?) 'gender': value,
      if (_$BloodTypeEnumMap[instance.bloodType] case final value?)
        'blood_type': value,
      if (instance.birthYear case final value?) 'birth_year': value,
      if (instance.birthMon case final value?) 'birth_mon': value,
      if (instance.birthDay case final value?) 'birth_day': value,
      'stat': instance.stat.toJson(),
    };

const _$PersonTypeEnumMap = {
  PersonType.Individual: 1,
  PersonType.Corporation: 2,
  PersonType.Association: 3,
};

const _$PersonCareerEnumMap = {
  PersonCareer.producer: 'producer',
  PersonCareer.mangaka: 'mangaka',
  PersonCareer.artist: 'artist',
  PersonCareer.seiyu: 'seiyu',
  PersonCareer.writer: 'writer',
  PersonCareer.illustrator: 'illustrator',
  PersonCareer.actor: 'actor',
};

const _$BloodTypeEnumMap = {
  BloodType.A: 1,
  BloodType.B: 2,
  BloodType.AB: 3,
  BloodType.O: 4,
};
