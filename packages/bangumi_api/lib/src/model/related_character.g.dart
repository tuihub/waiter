// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedCharacter _$RelatedCharacterFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RelatedCharacter',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'name', 'type', 'relation'],
        );
        final val = RelatedCharacter(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$CharacterTypeEnumMap, v)),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : PersonImages.fromJson(v as Map<String, dynamic>)),
          relation: $checkedConvert('relation', (v) => v as String),
          actors: $checkedConvert(
              'actors',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
        );
        return val;
      },
    );

Map<String, dynamic> _$RelatedCharacterToJson(RelatedCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CharacterTypeEnumMap[instance.type]!,
      if (instance.images?.toJson() case final value?) 'images': value,
      'relation': instance.relation,
      if (instance.actors?.map((e) => e.toJson()).toList() case final value?)
        'actors': value,
    };

const _$CharacterTypeEnumMap = {
  CharacterType.Character: 1,
  CharacterType.Mechanic: 2,
  CharacterType.Ship: 3,
  CharacterType.Organization: 4,
};
