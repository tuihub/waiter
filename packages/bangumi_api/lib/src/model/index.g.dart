// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Index _$IndexFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Index',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'title',
            'desc',
            'stat',
            'created_at',
            'updated_at',
            'creator',
            'ban',
            'nsfw'
          ],
        );
        final val = Index(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          desc: $checkedConvert('desc', (v) => v as String),
          total: $checkedConvert('total', (v) => (v as num?)?.toInt() ?? 0),
          stat: $checkedConvert(
              'stat', (v) => Stat.fromJson(v as Map<String, dynamic>)),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
          creator: $checkedConvert(
              'creator', (v) => Creator.fromJson(v as Map<String, dynamic>)),
          ban: $checkedConvert('ban', (v) => v as bool),
          nsfw: $checkedConvert('nsfw', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at', 'updatedAt': 'updated_at'},
    );

Map<String, dynamic> _$IndexToJson(Index instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      if (instance.total case final value?) 'total': value,
      'stat': instance.stat.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'creator': instance.creator.toJson(),
      'ban': instance.ban,
      'nsfw': instance.nsfw,
    };
