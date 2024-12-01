// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Creator extends Creator {
  @override
  final String username;
  @override
  final String nickname;

  factory _$Creator([void Function(CreatorBuilder)? updates]) =>
      (new CreatorBuilder()..update(updates))._build();

  _$Creator._({required this.username, required this.nickname}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, r'Creator', 'username');
    BuiltValueNullFieldError.checkNotNull(nickname, r'Creator', 'nickname');
  }

  @override
  Creator rebuild(void Function(CreatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatorBuilder toBuilder() => new CreatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Creator &&
        username == other.username &&
        nickname == other.nickname;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, nickname.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Creator')
          ..add('username', username)
          ..add('nickname', nickname))
        .toString();
  }
}

class CreatorBuilder implements Builder<Creator, CreatorBuilder> {
  _$Creator? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _nickname;
  String? get nickname => _$this._nickname;
  set nickname(String? nickname) => _$this._nickname = nickname;

  CreatorBuilder() {
    Creator._defaults(this);
  }

  CreatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _nickname = $v.nickname;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Creator other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Creator;
  }

  @override
  void update(void Function(CreatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Creator build() => _build();

  _$Creator _build() {
    final _$result = _$v ??
        new _$Creator._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'Creator', 'username'),
            nickname: BuiltValueNullFieldError.checkNotNull(
                nickname, r'Creator', 'nickname'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
