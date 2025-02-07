// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_user_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedUserCollection _$PagedUserCollectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PagedUserCollection',
      json,
      ($checkedConvert) {
        final val = PagedUserCollection(
          total: $checkedConvert('total', (v) => (v as num?)?.toInt() ?? 0),
          limit: $checkedConvert('limit', (v) => (v as num?)?.toInt() ?? 0),
          offset: $checkedConvert('offset', (v) => (v as num?)?.toInt() ?? 0),
          data: $checkedConvert(
              'data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => UserSubjectCollection.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  []),
        );
        return val;
      },
    );

Map<String, dynamic> _$PagedUserCollectionToJson(
        PagedUserCollection instance) =>
    <String, dynamic>{
      if (instance.total case final value?) 'total': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
