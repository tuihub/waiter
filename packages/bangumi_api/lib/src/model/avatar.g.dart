// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatar _$AvatarFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Avatar',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['large', 'medium', 'small'],
        );
        final val = Avatar(
          large: $checkedConvert('large', (v) => v as String),
          medium: $checkedConvert('medium', (v) => v as String),
          small: $checkedConvert('small', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
