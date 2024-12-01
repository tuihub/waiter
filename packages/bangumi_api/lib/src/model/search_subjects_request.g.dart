// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_subjects_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SearchSubjectsRequestSortEnum _$searchSubjectsRequestSortEnum_match =
    const SearchSubjectsRequestSortEnum._('match');
const SearchSubjectsRequestSortEnum _$searchSubjectsRequestSortEnum_heat =
    const SearchSubjectsRequestSortEnum._('heat');
const SearchSubjectsRequestSortEnum _$searchSubjectsRequestSortEnum_rank =
    const SearchSubjectsRequestSortEnum._('rank');
const SearchSubjectsRequestSortEnum _$searchSubjectsRequestSortEnum_score =
    const SearchSubjectsRequestSortEnum._('score');

SearchSubjectsRequestSortEnum _$searchSubjectsRequestSortEnumValueOf(
    String name) {
  switch (name) {
    case 'match':
      return _$searchSubjectsRequestSortEnum_match;
    case 'heat':
      return _$searchSubjectsRequestSortEnum_heat;
    case 'rank':
      return _$searchSubjectsRequestSortEnum_rank;
    case 'score':
      return _$searchSubjectsRequestSortEnum_score;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SearchSubjectsRequestSortEnum>
    _$searchSubjectsRequestSortEnumValues = new BuiltSet<
        SearchSubjectsRequestSortEnum>(const <SearchSubjectsRequestSortEnum>[
  _$searchSubjectsRequestSortEnum_match,
  _$searchSubjectsRequestSortEnum_heat,
  _$searchSubjectsRequestSortEnum_rank,
  _$searchSubjectsRequestSortEnum_score,
]);

Serializer<SearchSubjectsRequestSortEnum>
    _$searchSubjectsRequestSortEnumSerializer =
    new _$SearchSubjectsRequestSortEnumSerializer();

class _$SearchSubjectsRequestSortEnumSerializer
    implements PrimitiveSerializer<SearchSubjectsRequestSortEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'match': 'match',
    'heat': 'heat',
    'rank': 'rank',
    'score': 'score',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'match': 'match',
    'heat': 'heat',
    'rank': 'rank',
    'score': 'score',
  };

  @override
  final Iterable<Type> types = const <Type>[SearchSubjectsRequestSortEnum];
  @override
  final String wireName = 'SearchSubjectsRequestSortEnum';

  @override
  Object serialize(
          Serializers serializers, SearchSubjectsRequestSortEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SearchSubjectsRequestSortEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SearchSubjectsRequestSortEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SearchSubjectsRequest extends SearchSubjectsRequest {
  @override
  final String keyword;
  @override
  final SearchSubjectsRequestSortEnum? sort;
  @override
  final SearchSubjectsRequestFilter? filter;

  factory _$SearchSubjectsRequest(
          [void Function(SearchSubjectsRequestBuilder)? updates]) =>
      (new SearchSubjectsRequestBuilder()..update(updates))._build();

  _$SearchSubjectsRequest._({required this.keyword, this.sort, this.filter})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        keyword, r'SearchSubjectsRequest', 'keyword');
  }

  @override
  SearchSubjectsRequest rebuild(
          void Function(SearchSubjectsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchSubjectsRequestBuilder toBuilder() =>
      new SearchSubjectsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchSubjectsRequest &&
        keyword == other.keyword &&
        sort == other.sort &&
        filter == other.filter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, keyword.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, filter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchSubjectsRequest')
          ..add('keyword', keyword)
          ..add('sort', sort)
          ..add('filter', filter))
        .toString();
  }
}

class SearchSubjectsRequestBuilder
    implements Builder<SearchSubjectsRequest, SearchSubjectsRequestBuilder> {
  _$SearchSubjectsRequest? _$v;

  String? _keyword;
  String? get keyword => _$this._keyword;
  set keyword(String? keyword) => _$this._keyword = keyword;

  SearchSubjectsRequestSortEnum? _sort;
  SearchSubjectsRequestSortEnum? get sort => _$this._sort;
  set sort(SearchSubjectsRequestSortEnum? sort) => _$this._sort = sort;

  SearchSubjectsRequestFilterBuilder? _filter;
  SearchSubjectsRequestFilterBuilder get filter =>
      _$this._filter ??= new SearchSubjectsRequestFilterBuilder();
  set filter(SearchSubjectsRequestFilterBuilder? filter) =>
      _$this._filter = filter;

  SearchSubjectsRequestBuilder() {
    SearchSubjectsRequest._defaults(this);
  }

  SearchSubjectsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keyword = $v.keyword;
      _sort = $v.sort;
      _filter = $v.filter?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchSubjectsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchSubjectsRequest;
  }

  @override
  void update(void Function(SearchSubjectsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchSubjectsRequest build() => _build();

  _$SearchSubjectsRequest _build() {
    _$SearchSubjectsRequest _$result;
    try {
      _$result = _$v ??
          new _$SearchSubjectsRequest._(
              keyword: BuiltValueNullFieldError.checkNotNull(
                  keyword, r'SearchSubjectsRequest', 'keyword'),
              sort: sort,
              filter: _filter?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filter';
        _filter?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SearchSubjectsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
