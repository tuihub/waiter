// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevisionExtra _$RevisionExtraFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RevisionExtra',
      json,
      ($checkedConvert) {
        final val = RevisionExtra(
          img: $checkedConvert('img', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$RevisionExtraToJson(RevisionExtra instance) =>
    <String, dynamic>{
      if (instance.img case final value?) 'img': value,
    };
