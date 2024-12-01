// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_myself200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetMyself200Response extends GetMyself200Response {
  @override
  final int? timeOffset;
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

  factory _$GetMyself200Response(
          [void Function(GetMyself200ResponseBuilder)? updates]) =>
      (new GetMyself200ResponseBuilder()..update(updates))._build();

  _$GetMyself200Response._(
      {this.timeOffset,
      required this.id,
      required this.username,
      required this.nickname,
      required this.userGroup,
      required this.avatar,
      required this.sign})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GetMyself200Response', 'id');
    BuiltValueNullFieldError.checkNotNull(
        username, r'GetMyself200Response', 'username');
    BuiltValueNullFieldError.checkNotNull(
        nickname, r'GetMyself200Response', 'nickname');
    BuiltValueNullFieldError.checkNotNull(
        userGroup, r'GetMyself200Response', 'userGroup');
    BuiltValueNullFieldError.checkNotNull(
        avatar, r'GetMyself200Response', 'avatar');
    BuiltValueNullFieldError.checkNotNull(
        sign, r'GetMyself200Response', 'sign');
  }

  @override
  GetMyself200Response rebuild(
          void Function(GetMyself200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyself200ResponseBuilder toBuilder() =>
      new GetMyself200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyself200Response &&
        timeOffset == other.timeOffset &&
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
    _$hash = $jc(_$hash, timeOffset.hashCode);
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
    return (newBuiltValueToStringHelper(r'GetMyself200Response')
          ..add('timeOffset', timeOffset)
          ..add('id', id)
          ..add('username', username)
          ..add('nickname', nickname)
          ..add('userGroup', userGroup)
          ..add('avatar', avatar)
          ..add('sign', sign))
        .toString();
  }
}

class GetMyself200ResponseBuilder
    implements
        Builder<GetMyself200Response, GetMyself200ResponseBuilder>,
        UserBuilder {
  _$GetMyself200Response? _$v;

  int? _timeOffset;
  int? get timeOffset => _$this._timeOffset;
  set timeOffset(covariant int? timeOffset) => _$this._timeOffset = timeOffset;

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

  GetMyself200ResponseBuilder() {
    GetMyself200Response._defaults(this);
  }

  GetMyself200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _timeOffset = $v.timeOffset;
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
  void replace(covariant GetMyself200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyself200Response;
  }

  @override
  void update(void Function(GetMyself200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyself200Response build() => _build();

  _$GetMyself200Response _build() {
    _$GetMyself200Response _$result;
    try {
      _$result = _$v ??
          new _$GetMyself200Response._(
              timeOffset: timeOffset,
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GetMyself200Response', 'id'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'GetMyself200Response', 'username'),
              nickname: BuiltValueNullFieldError.checkNotNull(
                  nickname, r'GetMyself200Response', 'nickname'),
              userGroup: BuiltValueNullFieldError.checkNotNull(
                  userGroup, r'GetMyself200Response', 'userGroup'),
              avatar: avatar.build(),
              sign: BuiltValueNullFieldError.checkNotNull(
                  sign, r'GetMyself200Response', 'sign'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'avatar';
        avatar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetMyself200Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
