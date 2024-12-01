// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_index_subject.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedIndexSubject extends PagedIndexSubject {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<IndexSubject>? data;

  factory _$PagedIndexSubject(
          [void Function(PagedIndexSubjectBuilder)? updates]) =>
      (new PagedIndexSubjectBuilder()..update(updates))._build();

  _$PagedIndexSubject._({this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedIndexSubject rebuild(void Function(PagedIndexSubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedIndexSubjectBuilder toBuilder() =>
      new PagedIndexSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedIndexSubject &&
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
    return (newBuiltValueToStringHelper(r'PagedIndexSubject')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedIndexSubjectBuilder
    implements Builder<PagedIndexSubject, PagedIndexSubjectBuilder> {
  _$PagedIndexSubject? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<IndexSubject>? _data;
  ListBuilder<IndexSubject> get data =>
      _$this._data ??= new ListBuilder<IndexSubject>();
  set data(ListBuilder<IndexSubject>? data) => _$this._data = data;

  PagedIndexSubjectBuilder() {
    PagedIndexSubject._defaults(this);
  }

  PagedIndexSubjectBuilder get _$this {
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
  void replace(PagedIndexSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedIndexSubject;
  }

  @override
  void update(void Function(PagedIndexSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedIndexSubject build() => _build();

  _$PagedIndexSubject _build() {
    _$PagedIndexSubject _$result;
    try {
      _$result = _$v ??
          new _$PagedIndexSubject._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedIndexSubject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
