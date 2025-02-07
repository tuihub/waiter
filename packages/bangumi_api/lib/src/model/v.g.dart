// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

V _$VFromJson(Map<String, dynamic> json) => $checkedCreate(
      'V',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['v'],
        );
        final val = V(
          v: $checkedConvert('v', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$VToJson(V instance) => <String, dynamic>{
      'v': instance.v,
    };
