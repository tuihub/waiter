// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KV _$KVFromJson(Map<String, dynamic> json) => $checkedCreate(
      'KV',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['k', 'v'],
        );
        final val = KV(
          k: $checkedConvert('k', (v) => v as String),
          v: $checkedConvert('v', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$KVToJson(KV instance) => <String, dynamic>{
      'k': instance.k,
      'v': instance.v,
    };
