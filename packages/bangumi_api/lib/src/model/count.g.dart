// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Count _$CountFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Count',
      json,
      ($checkedConvert) {
        final val = Count(
          n1: $checkedConvert('1', (v) => (v as num?)?.toInt()),
          n2: $checkedConvert('2', (v) => (v as num?)?.toInt()),
          n3: $checkedConvert('3', (v) => (v as num?)?.toInt()),
          n4: $checkedConvert('4', (v) => (v as num?)?.toInt()),
          n5: $checkedConvert('5', (v) => (v as num?)?.toInt()),
          n6: $checkedConvert('6', (v) => (v as num?)?.toInt()),
          n7: $checkedConvert('7', (v) => (v as num?)?.toInt()),
          n8: $checkedConvert('8', (v) => (v as num?)?.toInt()),
          n9: $checkedConvert('9', (v) => (v as num?)?.toInt()),
          n10: $checkedConvert('10', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'n1': '1',
        'n2': '2',
        'n3': '3',
        'n4': '4',
        'n5': '5',
        'n6': '6',
        'n7': '7',
        'n8': '8',
        'n9': '9',
        'n10': '10'
      },
    );

Map<String, dynamic> _$CountToJson(Count instance) => <String, dynamic>{
      if (instance.n1 case final value?) '1': value,
      if (instance.n2 case final value?) '2': value,
      if (instance.n3 case final value?) '3': value,
      if (instance.n4 case final value?) '4': value,
      if (instance.n5 case final value?) '5': value,
      if (instance.n6 case final value?) '6': value,
      if (instance.n7 case final value?) '7': value,
      if (instance.n8 case final value?) '8': value,
      if (instance.n9 case final value?) '9': value,
      if (instance.n10 case final value?) '10': value,
    };
