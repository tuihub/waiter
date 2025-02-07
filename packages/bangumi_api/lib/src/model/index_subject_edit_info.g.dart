// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject_edit_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexSubjectEditInfo _$IndexSubjectEditInfoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'IndexSubjectEditInfo',
      json,
      ($checkedConvert) {
        final val = IndexSubjectEditInfo(
          sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
          comment: $checkedConvert('comment', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$IndexSubjectEditInfoToJson(
        IndexSubjectEditInfo instance) =>
    <String, dynamic>{
      if (instance.sort case final value?) 'sort': value,
      if (instance.comment case final value?) 'comment': value,
    };
