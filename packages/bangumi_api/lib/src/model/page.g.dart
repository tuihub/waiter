// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class PageBuilder {
  void replace(Page other);
  void update(void Function(PageBuilder) updates);
  int? get total;
  set total(int? total);

  int? get limit;
  set limit(int? limit);

  int? get offset;
  set offset(int? offset);
}

class _$$Page extends $Page {
  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;

  factory _$$Page([void Function($PageBuilder)? updates]) =>
      (new $PageBuilder()..update(updates))._build();

  _$$Page._({required this.total, required this.limit, required this.offset})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(total, r'$Page', 'total');
    BuiltValueNullFieldError.checkNotNull(limit, r'$Page', 'limit');
    BuiltValueNullFieldError.checkNotNull(offset, r'$Page', 'offset');
  }

  @override
  $Page rebuild(void Function($PageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $PageBuilder toBuilder() => new $PageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $Page &&
        total == other.total &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$Page')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class $PageBuilder implements Builder<$Page, $PageBuilder>, PageBuilder {
  _$$Page? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(covariant int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(covariant int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(covariant int? offset) => _$this._offset = offset;

  $PageBuilder() {
    $Page._defaults(this);
  }

  $PageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $Page other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$Page;
  }

  @override
  void update(void Function($PageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $Page build() => _build();

  _$$Page _build() {
    final _$result = _$v ??
        new _$$Page._(
            total:
                BuiltValueNullFieldError.checkNotNull(total, r'$Page', 'total'),
            limit:
                BuiltValueNullFieldError.checkNotNull(limit, r'$Page', 'limit'),
            offset: BuiltValueNullFieldError.checkNotNull(
                offset, r'$Page', 'offset'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
