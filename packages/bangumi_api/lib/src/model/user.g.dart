// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class UserBuilder {
  void replace(User other);
  void update(void Function(UserBuilder) updates);
  int? get id;
  set id(int? id);

  String? get username;
  set username(String? username);

  String? get nickname;
  set nickname(String? nickname);

  UserGroup? get userGroup;
  set userGroup(UserGroup? userGroup);

  AvatarBuilder get avatar;
  set avatar(AvatarBuilder? avatar);

  String? get sign;
  set sign(String? sign);
}

class _$$User extends $User {
  @override
  final int id;
  @override
  final String username;
  @override
  final String nickname;
  @override
  final UserGroup userGroup;
  @override
  final Avatar avatar;
  @override
  final String sign;

  factory _$$User([void Function($UserBuilder)? updates]) =>
      (new $UserBuilder()..update(updates))._build();

  _$$User._(
      {required this.id,
      required this.username,
      required this.nickname,
      required this.userGroup,
      required this.avatar,
      required this.sign})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'$User', 'id');
    BuiltValueNullFieldError.checkNotNull(username, r'$User', 'username');
    BuiltValueNullFieldError.checkNotNull(nickname, r'$User', 'nickname');
    BuiltValueNullFieldError.checkNotNull(userGroup, r'$User', 'userGroup');
    BuiltValueNullFieldError.checkNotNull(avatar, r'$User', 'avatar');
    BuiltValueNullFieldError.checkNotNull(sign, r'$User', 'sign');
  }

  @override
  $User rebuild(void Function($UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $UserBuilder toBuilder() => new $UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $User &&
        id == other.id &&
        username == other.username &&
        nickname == other.nickname &&
        userGroup == other.userGroup &&
        avatar == other.avatar &&
        sign == other.sign;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, nickname.hashCode);
    _$hash = $jc(_$hash, userGroup.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, sign.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$User')
          ..add('id', id)
          ..add('username', username)
          ..add('nickname', nickname)
          ..add('userGroup', userGroup)
          ..add('avatar', avatar)
          ..add('sign', sign))
        .toString();
  }
}

class $UserBuilder implements Builder<$User, $UserBuilder>, UserBuilder {
  _$$User? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(covariant String? username) => _$this._username = username;

  String? _nickname;
  String? get nickname => _$this._nickname;
  set nickname(covariant String? nickname) => _$this._nickname = nickname;

  UserGroup? _userGroup;
  UserGroup? get userGroup => _$this._userGroup;
  set userGroup(covariant UserGroup? userGroup) =>
      _$this._userGroup = userGroup;

  AvatarBuilder? _avatar;
  AvatarBuilder get avatar => _$this._avatar ??= new AvatarBuilder();
  set avatar(covariant AvatarBuilder? avatar) => _$this._avatar = avatar;

  String? _sign;
  String? get sign => _$this._sign;
  set sign(covariant String? sign) => _$this._sign = sign;

  $UserBuilder() {
    $User._defaults(this);
  }

  $UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _nickname = $v.nickname;
      _userGroup = $v.userGroup;
      _avatar = $v.avatar.toBuilder();
      _sign = $v.sign;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$User;
  }

  @override
  void update(void Function($UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $User build() => _build();

  _$$User _build() {
    _$$User _$result;
    try {
      _$result = _$v ??
          new _$$User._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'$User', 'id'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'$User', 'username'),
              nickname: BuiltValueNullFieldError.checkNotNull(
                  nickname, r'$User', 'nickname'),
              userGroup: BuiltValueNullFieldError.checkNotNull(
                  userGroup, r'$User', 'userGroup'),
              avatar: avatar.build(),
              sign: BuiltValueNullFieldError.checkNotNull(
                  sign, r'$User', 'sign'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'avatar';
        avatar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
