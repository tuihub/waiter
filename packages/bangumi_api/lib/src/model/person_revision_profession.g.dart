// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_revision_profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRevisionProfession _$PersonRevisionProfessionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonRevisionProfession',
      json,
      ($checkedConvert) {
        final val = PersonRevisionProfession(
          producer: $checkedConvert('producer', (v) => v as String?),
          mangaka: $checkedConvert('mangaka', (v) => v as String?),
          artist: $checkedConvert('artist', (v) => v as String?),
          seiyu: $checkedConvert('seiyu', (v) => v as String?),
          writer: $checkedConvert('writer', (v) => v as String?),
          illustrator: $checkedConvert('illustrator', (v) => v as String?),
          actor: $checkedConvert('actor', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PersonRevisionProfessionToJson(
        PersonRevisionProfession instance) =>
    <String, dynamic>{
      if (instance.producer case final value?) 'producer': value,
      if (instance.mangaka case final value?) 'mangaka': value,
      if (instance.artist case final value?) 'artist': value,
      if (instance.seiyu case final value?) 'seiyu': value,
      if (instance.writer case final value?) 'writer': value,
      if (instance.illustrator case final value?) 'illustrator': value,
      if (instance.actor case final value?) 'actor': value,
    };
