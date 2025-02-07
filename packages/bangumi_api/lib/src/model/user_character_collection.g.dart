// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_character_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCharacterCollection _$UserCharacterCollectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UserCharacterCollection',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'name', 'type', 'created_at'],
        );
        final val = UserCharacterCollection(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$CharacterTypeEnumMap, v)),
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

Map<String, dynamic> _$UserCharacterCollectionToJson(
        UserCharacterCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CharacterTypeEnumMap[instance.type]!,
      if (instance.images?.toJson() case final value?) 'images': value,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$CharacterTypeEnumMap = {
  CharacterType.Character: 1,
  CharacterType.Mechanic: 2,
  CharacterType.Ship: 3,
  CharacterType.Organization: 4,
};
