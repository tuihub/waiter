// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$KV extends KV {
  @override
  final String k;
  @override
  final String v;

  factory _$KV([void Function(KVBuilder)? updates]) =>
      (new KVBuilder()..update(updates))._build();

  _$KV._({required this.k, required this.v}) : super._() {
    BuiltValueNullFieldError.checkNotNull(k, r'KV', 'k');
    BuiltValueNullFieldError.checkNotNull(v, r'KV', 'v');
  }

  @override
  KV rebuild(void Function(KVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KVBuilder toBuilder() => new KVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KV && k == other.k && v == other.v;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, k.hashCode);
    _$hash = $jc(_$hash, v.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'KV')
          ..add('k', k)
          ..add('v', v))
        .toString();
  }
}

class KVBuilder implements Builder<KV, KVBuilder> {
  _$KV? _$v;

  String? _k;
  String? get k => _$this._k;
  set k(String? k) => _$this._k = k;

  String? _v;
  String? get v => _$this._v;
  set v(String? v) => _$this._v = v;

  KVBuilder() {
    KV._defaults(this);
  }

  KVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _k = $v.k;
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KV other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KV;
  }

  @override
  void update(void Function(KVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  KV build() => _build();

  _$KV _build() {
    final _$result = _$v ??
        new _$KV._(
            k: BuiltValueNullFieldError.checkNotNull(k, r'KV', 'k'),
            v: BuiltValueNullFieldError.checkNotNull(v, r'KV', 'v'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
