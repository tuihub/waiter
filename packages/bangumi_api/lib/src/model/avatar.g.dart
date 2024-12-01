// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Avatar extends Avatar {
  @override
  final String large;
  @override
  final String medium;
  @override
  final String small;

  factory _$Avatar([void Function(AvatarBuilder)? updates]) =>
      (new AvatarBuilder()..update(updates))._build();

  _$Avatar._({required this.large, required this.medium, required this.small})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(large, r'Avatar', 'large');
    BuiltValueNullFieldError.checkNotNull(medium, r'Avatar', 'medium');
    BuiltValueNullFieldError.checkNotNull(small, r'Avatar', 'small');
  }

  @override
  Avatar rebuild(void Function(AvatarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvatarBuilder toBuilder() => new AvatarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Avatar &&
        large == other.large &&
        medium == other.medium &&
        small == other.small;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, large.hashCode);
    _$hash = $jc(_$hash, medium.hashCode);
    _$hash = $jc(_$hash, small.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Avatar')
          ..add('large', large)
          ..add('medium', medium)
          ..add('small', small))
        .toString();
  }
}

class AvatarBuilder implements Builder<Avatar, AvatarBuilder> {
  _$Avatar? _$v;

  String? _large;
  String? get large => _$this._large;
  set large(String? large) => _$this._large = large;

  String? _medium;
  String? get medium => _$this._medium;
  set medium(String? medium) => _$this._medium = medium;

  String? _small;
  String? get small => _$this._small;
  set small(String? small) => _$this._small = small;

  AvatarBuilder() {
    Avatar._defaults(this);
  }

  AvatarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _large = $v.large;
      _medium = $v.medium;
      _small = $v.small;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Avatar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Avatar;
  }

  @override
  void update(void Function(AvatarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Avatar build() => _build();

  _$Avatar _build() {
    final _$result = _$v ??
        new _$Avatar._(
            large: BuiltValueNullFieldError.checkNotNull(
                large, r'Avatar', 'large'),
            medium: BuiltValueNullFieldError.checkNotNull(
                medium, r'Avatar', 'medium'),
            small: BuiltValueNullFieldError.checkNotNull(
                small, r'Avatar', 'small'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
