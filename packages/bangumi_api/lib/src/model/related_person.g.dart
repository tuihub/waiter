// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedPerson _$RelatedPersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RelatedPerson',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'type',
            'career',
            'relation',
            'eps'
          ],
        );
        final val = RelatedPerson(
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
          relation: $checkedConvert('relation', (v) => v as String),
          eps: $checkedConvert('eps', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RelatedPersonToJson(RelatedPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PersonTypeEnumMap[instance.type]!,
      'career': instance.career.map((e) => _$PersonCareerEnumMap[e]!).toList(),
      if (instance.images?.toJson() case final value?) 'images': value,
      'relation': instance.relation,
      'eps': instance.eps,
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
