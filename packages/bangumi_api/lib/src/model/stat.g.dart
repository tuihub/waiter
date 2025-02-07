// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Stat',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['comments', 'collects'],
        );
        final val = Stat(
          comments: $checkedConvert('comments', (v) => (v as num).toInt()),
          collects: $checkedConvert('collects', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'comments': instance.comments,
      'collects': instance.collects,
    };
