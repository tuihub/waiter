// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonImages _$PersonImagesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PersonImages',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['large', 'medium', 'small', 'grid'],
        );
        final val = PersonImages(
          large: $checkedConvert('large', (v) => v as String),
          medium: $checkedConvert('medium', (v) => v as String),
          small: $checkedConvert('small', (v) => v as String),
          grid: $checkedConvert('grid', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PersonImagesToJson(PersonImages instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'grid': instance.grid,
    };
