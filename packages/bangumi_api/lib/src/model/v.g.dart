// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$V extends V {
  @override
  final String v;

  factory _$V([void Function(VBuilder)? updates]) =>
      (new VBuilder()..update(updates))._build();

  _$V._({required this.v}) : super._() {
    BuiltValueNullFieldError.checkNotNull(v, r'V', 'v');
  }

  @override
  V rebuild(void Function(VBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VBuilder toBuilder() => new VBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is V && v == other.v;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, v.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'V')..add('v', v)).toString();
  }
}

class VBuilder implements Builder<V, VBuilder> {
  _$V? _$v;

  String? _v;
  String? get v => _$this._v;
  set v(String? v) => _$this._v = v;

  VBuilder() {
    V._defaults(this);
  }

  VBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _v = $v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(V other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$V;
  }

  @override
  void update(void Function(VBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  V build() => _build();

  _$V _build() {
    final _$result = _$v ??
        new _$V._(v: BuiltValueNullFieldError.checkNotNull(v, r'V', 'v'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
