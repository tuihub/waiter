// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
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
            'sign'
          ],
        );
        final val = User(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          username: $checkedConvert('username', (v) => v as String),
          nickname: $checkedConvert('nickname', (v) => v as String),
          userGroup: $checkedConvert(
              'user_group', (v) => $enumDecode(_$UserGroupEnumMap, v)),
          avatar: $checkedConvert(
              'avatar', (v) => Avatar.fromJson(v as Map<String, dynamic>)),
          sign: $checkedConvert('sign', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'userGroup': 'user_group'},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'user_group': _$UserGroupEnumMap[instance.userGroup]!,
      'avatar': instance.avatar.toJson(),
      'sign': instance.sign,
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
