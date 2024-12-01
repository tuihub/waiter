// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_episode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagedEpisode extends PagedEpisode {
  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final BuiltList<Episode>? data;

  factory _$PagedEpisode([void Function(PagedEpisodeBuilder)? updates]) =>
      (new PagedEpisodeBuilder()..update(updates))._build();

  _$PagedEpisode._({this.total, this.limit, this.offset, this.data})
      : super._();

  @override
  PagedEpisode rebuild(void Function(PagedEpisodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagedEpisodeBuilder toBuilder() => new PagedEpisodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagedEpisode &&
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
    return (newBuiltValueToStringHelper(r'PagedEpisode')
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset)
          ..add('data', data))
        .toString();
  }
}

class PagedEpisodeBuilder
    implements Builder<PagedEpisode, PagedEpisodeBuilder> {
  _$PagedEpisode? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  ListBuilder<Episode>? _data;
  ListBuilder<Episode> get data => _$this._data ??= new ListBuilder<Episode>();
  set data(ListBuilder<Episode>? data) => _$this._data = data;

  PagedEpisodeBuilder() {
    PagedEpisode._defaults(this);
  }

  PagedEpisodeBuilder get _$this {
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
  void replace(PagedEpisode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagedEpisode;
  }

  @override
  void update(void Function(PagedEpisodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagedEpisode build() => _build();

  _$PagedEpisode _build() {
    _$PagedEpisode _$result;
    try {
      _$result = _$v ??
          new _$PagedEpisode._(
              total: total, limit: limit, offset: offset, data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PagedEpisode', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
