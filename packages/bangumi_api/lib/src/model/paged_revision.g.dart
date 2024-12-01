// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedRevision extends PagedRevision {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<Revision>? data;

  factory _$PagedRevision([void Function(PagedRevisionBuilder)? updates]) =>
      (new PagedRevisionBuilder()..update(updates))._build();

  _$PagedRevision._({this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedRevision rebuild(void Function(PagedRevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedRevisionBuilder toBuilder() => new PagedRevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedRevision &&
        total == other.total &&
        limit == other.limit &&
        offset == other.offset &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagedRevision')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedRevisionBuilder
    implements Builder<PagedRevision, PagedRevisionBuilder> {
  _$PagedRevision? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<Revision>? _data;
  ListBuilder<Revision> get data =>
      _$this._data ??= new ListBuilder<Revision>();
  set data(ListBuilder<Revision>? data) => _$this._data = data;

  PagedRevisionBuilder() {
    PagedRevision._defaults(this);
  }

  PagedRevisionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _limit = $v.limit;
      _offset = $v.offset;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagedRevision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedRevision;
  }

  @override
  void update(void Function(PagedRevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedRevision build() => _build();

  _$PagedRevision _build() {
    _$PagedRevision _$result;
    try {
      _$result = _$v ??
          new _$PagedRevision._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedRevision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
