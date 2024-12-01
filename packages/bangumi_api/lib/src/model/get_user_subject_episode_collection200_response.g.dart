// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_subject_episode_collection200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUserSubjectEpisodeCollection200Response
    extends GetUserSubjectEpisodeCollection200Response {
  @override
  final BuiltList<UserEpisodeCollection>? data;
  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;

  factory _$GetUserSubjectEpisodeCollection200Response(
          [void Function(GetUserSubjectEpisodeCollection200ResponseBuilder)?
              updates]) =>
      (new GetUserSubjectEpisodeCollection200ResponseBuilder()..update(updates))
          ._build();

  _$GetUserSubjectEpisodeCollection200Response._(
      {this.data,
      required this.total,
      required this.limit,
      required this.offset})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        total, r'GetUserSubjectEpisodeCollection200Response', 'total');
    BuiltValueNullFieldError.checkNotNull(
        limit, r'GetUserSubjectEpisodeCollection200Response', 'limit');
    BuiltValueNullFieldError.checkNotNull(
        offset, r'GetUserSubjectEpisodeCollection200Response', 'offset');
  }

  @override
  GetUserSubjectEpisodeCollection200Response rebuild(
          void Function(GetUserSubjectEpisodeCollection200ResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserSubjectEpisodeCollection200ResponseBuilder toBuilder() =>
      new GetUserSubjectEpisodeCollection200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserSubjectEpisodeCollection200Response &&
        data == other.data &&
        total == other.total &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GetUserSubjectEpisodeCollection200Response')
          ..add('data', data)
          ..add('total', total)
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class GetUserSubjectEpisodeCollection200ResponseBuilder
    implements
        Builder<GetUserSubjectEpisodeCollection200Response,
            GetUserSubjectEpisodeCollection200ResponseBuilder>,
        PageBuilder {
  _$GetUserSubjectEpisodeCollection200Response? _$v;

  ListBuilder<UserEpisodeCollection>? _data;
  ListBuilder<UserEpisodeCollection> get data =>
      _$this._data ??= new ListBuilder<UserEpisodeCollection>();
  set data(covariant ListBuilder<UserEpisodeCollection>? data) =>
      _$this._data = data;

  int? _total;
  int? get total => _$this._total;
  set total(covariant int? total) => _$this._total = total;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(covariant int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(covariant int? offset) => _$this._offset = offset;

  GetUserSubjectEpisodeCollection200ResponseBuilder() {
    GetUserSubjectEpisodeCollection200Response._defaults(this);
  }

  GetUserSubjectEpisodeCollection200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _total = $v.total;
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GetUserSubjectEpisodeCollection200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUserSubjectEpisodeCollection200Response;
  }

  @override
  void update(
      void Function(GetUserSubjectEpisodeCollection200ResponseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUserSubjectEpisodeCollection200Response build() => _build();

  _$GetUserSubjectEpisodeCollection200Response _build() {
    _$GetUserSubjectEpisodeCollection200Response _$result;
    try {
      _$result = _$v ??
          new _$GetUserSubjectEpisodeCollection200Response._(
              data: _data?.build(),
              total: BuiltValueNullFieldError.checkNotNull(total,
                  r'GetUserSubjectEpisodeCollection200Response', 'total'),
              limit: BuiltValueNullFieldError.checkNotNull(limit,
                  r'GetUserSubjectEpisodeCollection200Response', 'limit'),
              offset: BuiltValueNullFieldError.checkNotNull(offset,
                  r'GetUserSubjectEpisodeCollection200Response', 'offset'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetUserSubjectEpisodeCollection200Response',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
