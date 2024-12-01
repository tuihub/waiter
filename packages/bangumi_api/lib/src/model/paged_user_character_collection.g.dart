// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_user_character_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedUserCharacterCollection extends PagedUserCharacterCollection {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<UserCharacterCollection>? data;

  factory _$PagedUserCharacterCollection(
          [void Function(PagedUserCharacterCollectionBuilder)? updates]) =>
      (new PagedUserCharacterCollectionBuilder()..update(updates))._build();

  _$PagedUserCharacterCollection._(
      {this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedUserCharacterCollection rebuild(
          void Function(PagedUserCharacterCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedUserCharacterCollectionBuilder toBuilder() =>
      new PagedUserCharacterCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedUserCharacterCollection &&
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
    return (newBuiltValueToStringHelper(r'PagedUserCharacterCollection')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedUserCharacterCollectionBuilder
    implements
        Builder<PagedUserCharacterCollection,
            PagedUserCharacterCollectionBuilder> {
  _$PagedUserCharacterCollection? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<UserCharacterCollection>? _data;
  ListBuilder<UserCharacterCollection> get data =>
      _$this._data ??= new ListBuilder<UserCharacterCollection>();
  set data(ListBuilder<UserCharacterCollection>? data) => _$this._data = data;

  PagedUserCharacterCollectionBuilder() {
    PagedUserCharacterCollection._defaults(this);
  }

  PagedUserCharacterCollectionBuilder get _$this {
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
  void replace(PagedUserCharacterCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedUserCharacterCollection;
  }

  @override
  void update(void Function(PagedUserCharacterCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedUserCharacterCollection build() => _build();

  _$PagedUserCharacterCollection _build() {
    _$PagedUserCharacterCollection _$result;
    try {
      _$result = _$v ??
          new _$PagedUserCharacterCollection._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedUserCharacterCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
