// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_any_of_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueAnyOfInner extends ValueAnyOfInner {
  @override
  final AnyOf anyOf;

  factory _$ValueAnyOfInner([void Function(ValueAnyOfInnerBuilder)? updates]) =>
      (new ValueAnyOfInnerBuilder()..update(updates))._build();

  _$ValueAnyOfInner._({required this.anyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anyOf, r'ValueAnyOfInner', 'anyOf');
  }

  @override
  ValueAnyOfInner rebuild(void Function(ValueAnyOfInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueAnyOfInnerBuilder toBuilder() =>
      new ValueAnyOfInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueAnyOfInner && anyOf == other.anyOf;
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
    return (newBuiltValueToStringHelper(r'ValueAnyOfInner')
          ..add('anyOf', anyOf))
        .toString();
  }
}

class ValueAnyOfInnerBuilder
    implements Builder<ValueAnyOfInner, ValueAnyOfInnerBuilder> {
  _$ValueAnyOfInner? _$v;

  AnyOf? _anyOf;
  AnyOf? get anyOf => _$this._anyOf;
  set anyOf(AnyOf? anyOf) => _$this._anyOf = anyOf;

  ValueAnyOfInnerBuilder() {
    ValueAnyOfInner._defaults(this);
  }

  ValueAnyOfInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anyOf = $v.anyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueAnyOfInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueAnyOfInner;
  }

  @override
  void update(void Function(ValueAnyOfInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueAnyOfInner build() => _build();

  _$ValueAnyOfInner _build() {
    final _$result = _$v ??
        new _$ValueAnyOfInner._(
            anyOf: BuiltValueNullFieldError.checkNotNull(
                anyOf, r'ValueAnyOfInner', 'anyOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
