// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_user_person_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedUserPersonCollection extends PagedUserPersonCollection {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<UserPersonCollection>? data;

  factory _$PagedUserPersonCollection(
          [void Function(PagedUserPersonCollectionBuilder)? updates]) =>
      (new PagedUserPersonCollectionBuilder()..update(updates))._build();

  _$PagedUserPersonCollection._(
      {this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedUserPersonCollection rebuild(
          void Function(PagedUserPersonCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedUserPersonCollectionBuilder toBuilder() =>
      new PagedUserPersonCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedUserPersonCollection &&
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
    return (newBuiltValueToStringHelper(r'PagedUserPersonCollection')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedUserPersonCollectionBuilder
    implements
        Builder<PagedUserPersonCollection, PagedUserPersonCollectionBuilder> {
  _$PagedUserPersonCollection? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<UserPersonCollection>? _data;
  ListBuilder<UserPersonCollection> get data =>
      _$this._data ??= new ListBuilder<UserPersonCollection>();
  set data(ListBuilder<UserPersonCollection>? data) => _$this._data = data;

  PagedUserPersonCollectionBuilder() {
    PagedUserPersonCollection._defaults(this);
  }

  PagedUserPersonCollectionBuilder get _$this {
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
  void replace(PagedUserPersonCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedUserPersonCollection;
  }

  @override
  void update(void Function(PagedUserPersonCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedUserPersonCollection build() => _build();

  _$PagedUserPersonCollection _build() {
    _$PagedUserPersonCollection _$result;
    try {
      _$result = _$v ??
          new _$PagedUserPersonCollection._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedUserPersonCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
