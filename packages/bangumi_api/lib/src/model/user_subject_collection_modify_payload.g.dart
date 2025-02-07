// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subject_collection_modify_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubjectCollectionModifyPayload _$UserSubjectCollectionModifyPayloadFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UserSubjectCollectionModifyPayload',
      json,
      ($checkedConvert) {
        final val = UserSubjectCollectionModifyPayload(
          type: $checkedConvert('type',
              (v) => $enumDecodeNullable(_$SubjectCollectionTypeEnumMap, v)),
          rate: $checkedConvert('rate', (v) => (v as num?)?.toInt()),
          epStatus: $checkedConvert('ep_status', (v) => (v as num?)?.toInt()),
          volStatus: $checkedConvert('vol_status', (v) => (v as num?)?.toInt()),
          comment: $checkedConvert('comment', (v) => v as String?),
          private: $checkedConvert('private', (v) => v as bool?),
          tags: $checkedConvert('tags',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'epStatus': 'ep_status', 'volStatus': 'vol_status'},
    );

Map<String, dynamic> _$UserSubjectCollectionModifyPayloadToJson(
        UserSubjectCollectionModifyPayload instance) =>
    <String, dynamic>{
      if (_$SubjectCollectionTypeEnumMap[instance.type] case final value?)
        'type': value,
      if (instance.rate case final value?) 'rate': value,
      if (instance.epStatus case final value?) 'ep_status': value,
      if (instance.volStatus case final value?) 'vol_status': value,
      if (instance.comment case final value?) 'comment': value,
      if (instance.private case final value?) 'private': value,
      if (instance.tags case final value?) 'tags': value,
    };

const _$SubjectCollectionTypeEnumMap = {
  SubjectCollectionType.Wish: 1,
  SubjectCollectionType.Done: 2,
  SubjectCollectionType.Doing: 3,
  SubjectCollectionType.OnHold: 4,
  SubjectCollectionType.Dropped: 5,
};
