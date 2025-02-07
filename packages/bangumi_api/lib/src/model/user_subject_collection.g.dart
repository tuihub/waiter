// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subject_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubjectCollection _$UserSubjectCollectionFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UserSubjectCollection',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'subject_id',
            'subject_type',
            'rate',
            'type',
            'tags',
            'ep_status',
            'vol_status',
            'updated_at',
            'private'
          ],
        );
        final val = UserSubjectCollection(
          subjectId: $checkedConvert('subject_id', (v) => (v as num).toInt()),
          subjectType: $checkedConvert(
              'subject_type', (v) => $enumDecode(_$SubjectTypeEnumMap, v)),
          rate: $checkedConvert('rate', (v) => (v as num).toInt()),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$SubjectCollectionTypeEnumMap, v)),
          comment: $checkedConvert('comment', (v) => v as String?),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          epStatus: $checkedConvert('ep_status', (v) => (v as num).toInt()),
          volStatus: $checkedConvert('vol_status', (v) => (v as num).toInt()),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
          private: $checkedConvert('private', (v) => v as bool),
          subject: $checkedConvert(
              'subject',
              (v) => v == null
                  ? null
                  : SlimSubject.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'subjectId': 'subject_id',
        'subjectType': 'subject_type',
        'epStatus': 'ep_status',
        'volStatus': 'vol_status',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$UserSubjectCollectionToJson(
        UserSubjectCollection instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'subject_type': _$SubjectTypeEnumMap[instance.subjectType]!,
      'rate': instance.rate,
      'type': _$SubjectCollectionTypeEnumMap[instance.type]!,
      if (instance.comment case final value?) 'comment': value,
      'tags': instance.tags,
      'ep_status': instance.epStatus,
      'vol_status': instance.volStatus,
      'updated_at': instance.updatedAt.toIso8601String(),
      'private': instance.private,
      if (instance.subject?.toJson() case final value?) 'subject': value,
    };

const _$SubjectTypeEnumMap = {
  SubjectType.Book: 1,
  SubjectType.Anime: 2,
  SubjectType.Music: 3,
  SubjectType.Game: 4,
  SubjectType.Real: 6,
};

const _$SubjectCollectionTypeEnumMap = {
  SubjectCollectionType.Wish: 1,
  SubjectCollectionType.Done: 2,
  SubjectCollectionType.Doing: 3,
  SubjectCollectionType.OnHold: 4,
  SubjectCollectionType.Dropped: 5,
};
