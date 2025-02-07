// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_myself200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyself200Response _$GetMyself200ResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetMyself200Response',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'username',
            'nickname',
            'user_group',
            'avatar',
            'sign',
            'email',
            'reg_time'
          ],
        );
        final val = GetMyself200Response(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          username: $checkedConvert('username', (v) => v as String),
          nickname: $checkedConvert('nickname', (v) => v as String),
          userGroup: $checkedConvert(
              'user_group', (v) => $enumDecode(_$UserGroupEnumMap, v)),
          avatar: $checkedConvert(
              'avatar', (v) => Avatar.fromJson(v as Map<String, dynamic>)),
          sign: $checkedConvert('sign', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          regTime:
              $checkedConvert('reg_time', (v) => DateTime.parse(v as String)),
          timeOffset:
              $checkedConvert('time_offset', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'userGroup': 'user_group',
        'regTime': 'reg_time',
        'timeOffset': 'time_offset'
      },
    );

Map<String, dynamic> _$GetMyself200ResponseToJson(
        GetMyself200Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'user_group': _$UserGroupEnumMap[instance.userGroup]!,
      'avatar': instance.avatar.toJson(),
      'sign': instance.sign,
      'email': instance.email,
      'reg_time': instance.regTime.toIso8601String(),
      if (instance.timeOffset case final value?) 'time_offset': value,
    };

const _$UserGroupEnumMap = {
  UserGroup.Admin: 1,
  UserGroup.BangumiAdmin: 2,
  UserGroup.DoujinAdmin: 3,
  UserGroup.MutedUser: 4,
  UserGroup.BlockedUser: 5,
  UserGroup.PersonAdmin: 8,
  UserGroup.WikiAdmin: 9,
  UserGroup.User: 10,
  UserGroup.WikiUser: 11,
};
