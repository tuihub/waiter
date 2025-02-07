// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Creator',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['username', 'nickname'],
        );
        final val = Creator(
          username: $checkedConvert('username', (v) => v as String),
          nickname: $checkedConvert('nickname', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'username': instance.username,
      'nickname': instance.nickname,
    };
