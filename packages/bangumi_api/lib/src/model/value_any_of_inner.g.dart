// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_any_of_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValueAnyOfInner _$ValueAnyOfInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ValueAnyOfInner',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['k', 'v'],
        );
        final val = ValueAnyOfInner(
          k: $checkedConvert('k', (v) => v as String),
          v: $checkedConvert('v', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ValueAnyOfInnerToJson(ValueAnyOfInner instance) =>
    <String, dynamic>{
      'k': instance.k,
      'v': instance.v,
    };
