// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject_add_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndexSubjectAddInfo _$IndexSubjectAddInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IndexSubjectAddInfo',
      json,
      ($checkedConvert) {
        final val = IndexSubjectAddInfo(
          subjectId: $checkedConvert('subject_id', (v) => (v as num?)?.toInt()),
          sort: $checkedConvert('sort', (v) => (v as num?)?.toInt()),
          comment: $checkedConvert('comment', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'subjectId': 'subject_id'},
    );

Map<String, dynamic> _$IndexSubjectAddInfoToJson(
        IndexSubjectAddInfo instance) =>
    <String, dynamic>{
      if (instance.subjectId case final value?) 'subject_id': value,
      if (instance.sort case final value?) 'sort': value,
      if (instance.comment case final value?) 'comment': value,
    };
