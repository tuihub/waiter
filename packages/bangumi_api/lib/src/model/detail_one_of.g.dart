// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_one_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DetailOneOf extends DetailOneOf {
  @override
  final String? error;
  @override
  final String? path;

  factory _$DetailOneOf([void Function(DetailOneOfBuilder)? updates]) =>
      (new DetailOneOfBuilder()..update(updates))._build();

  _$DetailOneOf._({this.error, this.path}) : super._();

  @override
  DetailOneOf rebuild(void Function(DetailOneOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailOneOfBuilder toBuilder() => new DetailOneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailOneOf && error == other.error && path == other.path;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DetailOneOf')
          ..add('error', error)
          ..add('path', path))
        .toString();
  }
}

class DetailOneOfBuilder implements Builder<DetailOneOf, DetailOneOfBuilder> {
  _$DetailOneOf? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  DetailOneOfBuilder() {
    DetailOneOf._defaults(this);
  }

  DetailOneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailOneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailOneOf;
  }

  @override
  void update(void Function(DetailOneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailOneOf build() => _build();

  _$DetailOneOf _build() {
    final _$result = _$v ?? new _$DetailOneOf._(error: error, path: path);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
