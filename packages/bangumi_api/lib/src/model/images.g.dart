// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Images',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['large', 'common', 'medium', 'small', 'grid'],
        );
        final val = Images(
          large: $checkedConvert('large', (v) => v as String),
          common: $checkedConvert('common', (v) => v as String),
          medium: $checkedConvert('medium', (v) => v as String),
          small: $checkedConvert('small', (v) => v as String),
          grid: $checkedConvert('grid', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'large': instance.large,
      'common': instance.common,
      'medium': instance.medium,
      'small': instance.small,
      'grid': instance.grid,
    };
