// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Detail',
      json,
      ($checkedConvert) {
        final val = Detail(
          error: $checkedConvert('error', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      if (instance.error case final value?) 'error': value,
      if (instance.path case final value?) 'path': value,
    };
