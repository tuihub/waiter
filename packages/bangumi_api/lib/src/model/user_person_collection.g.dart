// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_person_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPersonCollection _$UserPersonCollectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UserPersonCollection',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'name', 'type', 'career', 'created_at'],
        );
        final val = UserPersonCollection(
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
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$UserPersonCollectionToJson(
        UserPersonCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PersonTypeEnumMap[instance.type]!,
      'career': instance.career.map((e) => _$PersonCareerEnumMap[e]!).toList(),
      if (instance.images?.toJson() case final value?) 'images': value,
      'created_at': instance.createdAt.toIso8601String(),
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
