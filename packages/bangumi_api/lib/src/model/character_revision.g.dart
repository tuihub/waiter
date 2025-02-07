// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_revision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterRevision _$CharacterRevisionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CharacterRevision',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'type', 'summary', 'created_at'],
        );
        final val = CharacterRevision(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => (v as num).toInt()),
          creator: $checkedConvert(
              'creator',
              (v) => v == null
                  ? null
                  : Creator.fromJson(v as Map<String, dynamic>)),
          summary: $checkedConvert('summary', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          data: $checkedConvert(
              'data',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(
                        k,
                        CharacterRevisionDataItem.fromJson(
                            e as Map<String, dynamic>)),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$CharacterRevisionToJson(CharacterRevision instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      if (instance.creator?.toJson() case final value?) 'creator': value,
      'summary': instance.summary,
      'created_at': instance.createdAt.toIso8601String(),
      if (instance.data?.map((k, e) => MapEntry(k, e.toJson()))
          case final value?)
        'data': value,
    };
