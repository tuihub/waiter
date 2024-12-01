// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Value extends Value {
  @override
  final AnyOf anyOf;

  factory _$Value([void Function(ValueBuilder)? updates]) =>
      (new ValueBuilder()..update(updates))._build();

  _$Value._({required this.anyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anyOf, r'Value', 'anyOf');
  }

  @override
  Value rebuild(void Function(ValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueBuilder toBuilder() => new ValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Value && anyOf == other.anyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Value')..add('anyOf', anyOf))
        .toString();
  }
}

class ValueBuilder implements Builder<Value, ValueBuilder> {
  _$Value? _$v;

  AnyOf? _anyOf;
  AnyOf? get anyOf => _$this._anyOf;
  set anyOf(AnyOf? anyOf) => _$this._anyOf = anyOf;

  ValueBuilder() {
    Value._defaults(this);
  }

  ValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anyOf = $v.anyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Value other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Value;
  }

  @override
  void update(void Function(ValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Value build() => _build();

  _$Value _build() {
    final _$result = _$v ??
        new _$Value._(
            anyOf: BuiltValueNullFieldError.checkNotNull(
                anyOf, r'Value', 'anyOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
