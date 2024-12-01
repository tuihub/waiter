// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_user_episode_collection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PutUserEpisodeCollectionRequest
    extends PutUserEpisodeCollectionRequest {
  @override
  final EpisodeCollectionType type;

  factory _$PutUserEpisodeCollectionRequest(
          [void Function(PutUserEpisodeCollectionRequestBuilder)? updates]) =>
      (new PutUserEpisodeCollectionRequestBuilder()..update(updates))._build();

  _$PutUserEpisodeCollectionRequest._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        type, r'PutUserEpisodeCollectionRequest', 'type');
  }

  @override
  PutUserEpisodeCollectionRequest rebuild(
          void Function(PutUserEpisodeCollectionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutUserEpisodeCollectionRequestBuilder toBuilder() =>
      new PutUserEpisodeCollectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutUserEpisodeCollectionRequest && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PutUserEpisodeCollectionRequest')
          ..add('type', type))
        .toString();
  }
}

class PutUserEpisodeCollectionRequestBuilder
    implements
        Builder<PutUserEpisodeCollectionRequest,
            PutUserEpisodeCollectionRequestBuilder> {
  _$PutUserEpisodeCollectionRequest? _$v;

  EpisodeCollectionType? _type;
  EpisodeCollectionType? get type => _$this._type;
  set type(EpisodeCollectionType? type) => _$this._type = type;

  PutUserEpisodeCollectionRequestBuilder() {
    PutUserEpisodeCollectionRequest._defaults(this);
  }

  PutUserEpisodeCollectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PutUserEpisodeCollectionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutUserEpisodeCollectionRequest;
  }

  @override
  void update(void Function(PutUserEpisodeCollectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutUserEpisodeCollectionRequest build() => _build();

  _$PutUserEpisodeCollectionRequest _build() {
    final _$result = _$v ??
        new _$PutUserEpisodeCollectionRequest._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'PutUserEpisodeCollectionRequest', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
