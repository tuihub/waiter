// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Detail extends Detail {
  @override
  final OneOf oneOf;

  factory _$Detail([void Function(DetailBuilder)? updates]) =>
      (new DetailBuilder()..update(updates))._build();

  _$Detail._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(oneOf, r'Detail', 'oneOf');
  }

  @override
  Detail rebuild(void Function(DetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailBuilder toBuilder() => new DetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Detail && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Detail')..add('oneOf', oneOf))
        .toString();
  }
}

class DetailBuilder implements Builder<Detail, DetailBuilder> {
  _$Detail? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  DetailBuilder() {
    Detail._defaults(this);
  }

  DetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Detail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Detail;
  }

  @override
  void update(void Function(DetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Detail build() => _build();

  _$Detail _build() {
    final _$result = _$v ??
        new _$Detail._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'Detail', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
