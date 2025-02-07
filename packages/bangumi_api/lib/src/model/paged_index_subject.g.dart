// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_index_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedIndexSubject _$PagedIndexSubjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PagedIndexSubject',
      json,
      ($checkedConvert) {
        final val = PagedIndexSubject(
          total: $checkedConvert('total', (v) => (v as num?)?.toInt() ?? 0),
          limit: $checkedConvert('limit', (v) => (v as num?)?.toInt() ?? 0),
          offset: $checkedConvert('offset', (v) => (v as num?)?.toInt() ?? 0),
          data: $checkedConvert(
              'data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          IndexSubject.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  []),
        );
        return val;
      },
    );

Map<String, dynamic> _$PagedIndexSubjectToJson(PagedIndexSubject instance) =>
    <String, dynamic>{
      if (instance.total case final value?) 'total': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
