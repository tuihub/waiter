// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_user_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedUserCollection extends PagedUserCollection {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<UserSubjectCollection>? data;

  factory _$PagedUserCollection(
          [void Function(PagedUserCollectionBuilder)? updates]) =>
      (new PagedUserCollectionBuilder()..update(updates))._build();

  _$PagedUserCollection._({this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedUserCollection rebuild(
          void Function(PagedUserCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedUserCollectionBuilder toBuilder() =>
      new PagedUserCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedUserCollection &&
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
    return (newBuiltValueToStringHelper(r'PagedUserCollection')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedUserCollectionBuilder
    implements Builder<PagedUserCollection, PagedUserCollectionBuilder> {
  _$PagedUserCollection? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<UserSubjectCollection>? _data;
  ListBuilder<UserSubjectCollection> get data =>
      _$this._data ??= new ListBuilder<UserSubjectCollection>();
  set data(ListBuilder<UserSubjectCollection>? data) => _$this._data = data;

  PagedUserCollectionBuilder() {
    PagedUserCollection._defaults(this);
  }

  PagedUserCollectionBuilder get _$this {
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
  void replace(PagedUserCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedUserCollection;
  }

  @override
  void update(void Function(PagedUserCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedUserCollection build() => _build();

  _$PagedUserCollection _build() {
    _$PagedUserCollection _$result;
    try {
      _$result = _$v ??
          new _$PagedUserCollection._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedUserCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
