// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Collection',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'wish',
            'collect',
            'doing',
            'on_hold',
            'dropped'
          ],
        );
        final val = Collection(
          wish: $checkedConvert('wish', (v) => (v as num).toInt()),
          collect: $checkedConvert('collect', (v) => (v as num).toInt()),
          doing: $checkedConvert('doing', (v) => (v as num).toInt()),
          onHold: $checkedConvert('on_hold', (v) => (v as num).toInt()),
          dropped: $checkedConvert('dropped', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'onHold': 'on_hold'},
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'wish': instance.wish,
      'collect': instance.collect,
      'doing': instance.doing,
      'on_hold': instance.onHold,
      'dropped': instance.dropped,
    };
