// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserGroup _$Admin = const UserGroup._('Admin');
const UserGroup _$BangumiAdmin = const UserGroup._('BangumiAdmin');
const UserGroup _$DoujinAdmin = const UserGroup._('DoujinAdmin');
const UserGroup _$MutedUser = const UserGroup._('MutedUser');
const UserGroup _$BlockedUser = const UserGroup._('BlockedUser');
const UserGroup _$PersonAdmin = const UserGroup._('PersonAdmin');
const UserGroup _$WikiAdmin = const UserGroup._('WikiAdmin');
const UserGroup _$User = const UserGroup._('User');
const UserGroup _$WikiUser = const UserGroup._('WikiUser');

UserGroup _$valueOf(String name) {
  switch (name) {
    case 'Admin':
      return _$Admin;
    case 'BangumiAdmin':
      return _$BangumiAdmin;
    case 'DoujinAdmin':
      return _$DoujinAdmin;
    case 'MutedUser':
      return _$MutedUser;
    case 'BlockedUser':
      return _$BlockedUser;
    case 'PersonAdmin':
      return _$PersonAdmin;
    case 'WikiAdmin':
      return _$WikiAdmin;
    case 'User':
      return _$User;
    case 'WikiUser':
      return _$WikiUser;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserGroup> _$values = new BuiltSet<UserGroup>(const <UserGroup>[
  _$Admin,
  _$BangumiAdmin,
  _$DoujinAdmin,
  _$MutedUser,
  _$BlockedUser,
  _$PersonAdmin,
  _$WikiAdmin,
  _$User,
  _$WikiUser,
]);

class _$UserGroupMeta {
  const _$UserGroupMeta();
  UserGroup get Admin => _$Admin;
  UserGroup get BangumiAdmin => _$BangumiAdmin;
  UserGroup get DoujinAdmin => _$DoujinAdmin;
  UserGroup get MutedUser => _$MutedUser;
  UserGroup get BlockedUser => _$BlockedUser;
  UserGroup get PersonAdmin => _$PersonAdmin;
  UserGroup get WikiAdmin => _$WikiAdmin;
  UserGroup get User => _$User;
  UserGroup get WikiUser => _$WikiUser;
  UserGroup valueOf(String name) => _$valueOf(name);
  BuiltSet<UserGroup> get values => _$values;
}

abstract class _$UserGroupMixin {
  // ignore: non_constant_identifier_names
  _$UserGroupMeta get UserGroup => const _$UserGroupMeta();
}

Serializer<UserGroup> _$userGroupSerializer = new _$UserGroupSerializer();

class _$UserGroupSerializer implements PrimitiveSerializer<UserGroup> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Admin': 1,
    'BangumiAdmin': 2,
    'DoujinAdmin': 3,
    'MutedUser': 4,
    'BlockedUser': 5,
    'PersonAdmin': 8,
    'WikiAdmin': 9,
    'User': 10,
    'WikiUser': 11,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Admin',
    2: 'BangumiAdmin',
    3: 'DoujinAdmin',
    4: 'MutedUser',
    5: 'BlockedUser',
    8: 'PersonAdmin',
    9: 'WikiAdmin',
    10: 'User',
    11: 'WikiUser',
  };

  @override
  final Iterable<Type> types = const <Type>[UserGroup];
  @override
  final String wireName = 'UserGroup';

  @override
  Object serialize(Serializers serializers, UserGroup object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserGroup deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserGroup.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
