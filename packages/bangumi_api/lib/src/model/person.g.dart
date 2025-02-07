// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Person',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'type',
            'career',
            'short_summary',
            'locked'
          ],
        );
        final val = Person(
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
          shortSummary: $checkedConvert('short_summary', (v) => v as String),
          locked: $checkedConvert('locked', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'shortSummary': 'short_summary'},
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PersonTypeEnumMap[instance.type]!,
      'career': instance.career.map((e) => _$PersonCareerEnumMap[e]!).toList(),
      if (instance.images?.toJson() case final value?) 'images': value,
      'short_summary': instance.shortSummary,
      'locked': instance.locked,
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
