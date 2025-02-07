// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Revision _$RevisionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Revision',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'type', 'summary', 'created_at'],
        );
        final val = Revision(
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
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$RevisionToJson(Revision instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      if (instance.creator?.toJson() case final value?) 'creator': value,
      'summary': instance.summary,
      'created_at': instance.createdAt.toIso8601String(),
    };
