// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subjects_request_filter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchSubjectsRequestFilter extends SearchSubjectsRequestFilter {
  @override
  final BuiltList<SubjectType>? type;
  @override
  final BuiltList<String>? metaTags;
  @override
  final BuiltList<String>? tag;
  @override
  final BuiltList<String>? airDate;
  @override
  final BuiltList<String>? rating;
  @override
  final BuiltList<String>? rank;
  @override
  final bool? nsfw;

  factory _$SearchSubjectsRequestFilter(
          [void Function(SearchSubjectsRequestFilterBuilder)? updates]) =>
      (new SearchSubjectsRequestFilterBuilder()..update(updates))._build();

  _$SearchSubjectsRequestFilter._(
      {this.type,
      this.metaTags,
      this.tag,
      this.airDate,
      this.rating,
      this.rank,
      this.nsfw})
      : super._();

  @override
  SearchSubjectsRequestFilter rebuild(
          void Function(SearchSubjectsRequestFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchSubjectsRequestFilterBuilder toBuilder() =>
      new SearchSubjectsRequestFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchSubjectsRequestFilter &&
        type == other.type &&
        metaTags == other.metaTags &&
        tag == other.tag &&
        airDate == other.airDate &&
        rating == other.rating &&
        rank == other.rank &&
        nsfw == other.nsfw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, metaTags.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jc(_$hash, airDate.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jc(_$hash, nsfw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchSubjectsRequestFilter')
          ..add('type', type)
          ..add('metaTags', metaTags)
          ..add('tag', tag)
          ..add('airDate', airDate)
          ..add('rating', rating)
          ..add('rank', rank)
          ..add('nsfw', nsfw))
        .toString();
  }
}

class SearchSubjectsRequestFilterBuilder
    implements
        Builder<SearchSubjectsRequestFilter,
            SearchSubjectsRequestFilterBuilder> {
  _$SearchSubjectsRequestFilter? _$v;

  ListBuilder<SubjectType>? _type;
  ListBuilder<SubjectType> get type =>
      _$this._type ??= new ListBuilder<SubjectType>();
  set type(ListBuilder<SubjectType>? type) => _$this._type = type;

  ListBuilder<String>? _metaTags;
  ListBuilder<String> get metaTags =>
      _$this._metaTags ??= new ListBuilder<String>();
  set metaTags(ListBuilder<String>? metaTags) => _$this._metaTags = metaTags;

  ListBuilder<String>? _tag;
  ListBuilder<String> get tag => _$this._tag ??= new ListBuilder<String>();
  set tag(ListBuilder<String>? tag) => _$this._tag = tag;

  ListBuilder<String>? _airDate;
  ListBuilder<String> get airDate =>
      _$this._airDate ??= new ListBuilder<String>();
  set airDate(ListBuilder<String>? airDate) => _$this._airDate = airDate;

  ListBuilder<String>? _rating;
  ListBuilder<String> get rating =>
      _$this._rating ??= new ListBuilder<String>();
  set rating(ListBuilder<String>? rating) => _$this._rating = rating;

  ListBuilder<String>? _rank;
  ListBuilder<String> get rank => _$this._rank ??= new ListBuilder<String>();
  set rank(ListBuilder<String>? rank) => _$this._rank = rank;

  bool? _nsfw;
  bool? get nsfw => _$this._nsfw;
  set nsfw(bool? nsfw) => _$this._nsfw = nsfw;

  SearchSubjectsRequestFilterBuilder() {
    SearchSubjectsRequestFilter._defaults(this);
  }

  SearchSubjectsRequestFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type?.toBuilder();
      _metaTags = $v.metaTags?.toBuilder();
      _tag = $v.tag?.toBuilder();
      _airDate = $v.airDate?.toBuilder();
      _rating = $v.rating?.toBuilder();
      _rank = $v.rank?.toBuilder();
      _nsfw = $v.nsfw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchSubjectsRequestFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchSubjectsRequestFilter;
  }

  @override
  void update(void Function(SearchSubjectsRequestFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchSubjectsRequestFilter build() => _build();

  _$SearchSubjectsRequestFilter _build() {
    _$SearchSubjectsRequestFilter _$result;
    try {
      _$result = _$v ??
          new _$SearchSubjectsRequestFilter._(
              type: _type?.build(),
              metaTags: _metaTags?.build(),
              tag: _tag?.build(),
              airDate: _airDate?.build(),
              rating: _rating?.build(),
              rank: _rank?.build(),
              nsfw: nsfw);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
        _$failedField = 'metaTags';
        _metaTags?.build();
        _$failedField = 'tag';
        _tag?.build();
        _$failedField = 'airDate';
        _airDate?.build();
        _$failedField = 'rating';
        _rating?.build();
        _$failedField = 'rank';
        _rank?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchSubjectsRequestFilter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
