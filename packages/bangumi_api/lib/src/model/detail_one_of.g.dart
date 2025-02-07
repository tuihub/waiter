// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_one_of.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailOneOf _$DetailOneOfFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DetailOneOf',
      json,
      ($checkedConvert) {
        final val = DetailOneOf(
          error: $checkedConvert('error', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DetailOneOfToJson(DetailOneOf instance) =>
    <String, dynamic>{
      if (instance.error case final value?) 'error': value,
      if (instance.path case final value?) 'path': value,
    };
