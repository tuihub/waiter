// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexSubject _$IndexSubjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IndexSubject',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'type', 'name', 'comment', 'added_at'],
        );
        final val = IndexSubject(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          images: $checkedConvert(
              'images',
              (v) => v == null
                  ? null
                  : Images.fromJson(v as Map<String, dynamic>)),
          infobox: $checkedConvert(
              'infobox',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
                  .toList()),
          date: $checkedConvert('date', (v) => v as String?),
          comment: $checkedConvert('comment', (v) => v as String),
          addedAt:
              $checkedConvert('added_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'addedAt': 'added_at'},
    );

Map<String, dynamic> _$IndexSubjectToJson(IndexSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      if (instance.images?.toJson() case final value?) 'images': value,
      if (instance.infobox?.map((e) => e.toJson()).toList() case final value?)
        'infobox': value,
      if (instance.date case final value?) 'date': value,
      'comment': instance.comment,
      'added_at': instance.addedAt.toIso8601String(),
    };
