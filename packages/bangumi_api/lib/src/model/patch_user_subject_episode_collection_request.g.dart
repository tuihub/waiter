// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_user_subject_episode_collection_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PatchUserSubjectEpisodeCollectionRequest
    extends PatchUserSubjectEpisodeCollectionRequest {
  @override
  final BuiltList<int> episodeId;
  @override
  final EpisodeCollectionType type;

  factory _$PatchUserSubjectEpisodeCollectionRequest(
          [void Function(PatchUserSubjectEpisodeCollectionRequestBuilder)?
              updates]) =>
      (new PatchUserSubjectEpisodeCollectionRequestBuilder()..update(updates))
          ._build();

  _$PatchUserSubjectEpisodeCollectionRequest._(
      {required this.episodeId, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episodeId, r'PatchUserSubjectEpisodeCollectionRequest', 'episodeId');
    BuiltValueNullFieldError.checkNotNull(
        type, r'PatchUserSubjectEpisodeCollectionRequest', 'type');
  }

  @override
  PatchUserSubjectEpisodeCollectionRequest rebuild(
          void Function(PatchUserSubjectEpisodeCollectionRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatchUserSubjectEpisodeCollectionRequestBuilder toBuilder() =>
      new PatchUserSubjectEpisodeCollectionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatchUserSubjectEpisodeCollectionRequest &&
        episodeId == other.episodeId &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episodeId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'PatchUserSubjectEpisodeCollectionRequest')
          ..add('episodeId', episodeId)
          ..add('type', type))
        .toString();
  }
}

class PatchUserSubjectEpisodeCollectionRequestBuilder
    implements
        Builder<PatchUserSubjectEpisodeCollectionRequest,
            PatchUserSubjectEpisodeCollectionRequestBuilder> {
  _$PatchUserSubjectEpisodeCollectionRequest? _$v;

  ListBuilder<int>? _episodeId;
  ListBuilder<int> get episodeId =>
      _$this._episodeId ??= new ListBuilder<int>();
  set episodeId(ListBuilder<int>? episodeId) => _$this._episodeId = episodeId;

  EpisodeCollectionType? _type;
  EpisodeCollectionType? get type => _$this._type;
  set type(EpisodeCollectionType? type) => _$this._type = type;

  PatchUserSubjectEpisodeCollectionRequestBuilder() {
    PatchUserSubjectEpisodeCollectionRequest._defaults(this);
  }

  PatchUserSubjectEpisodeCollectionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episodeId = $v.episodeId.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatchUserSubjectEpisodeCollectionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatchUserSubjectEpisodeCollectionRequest;
  }

  @override
  void update(
      void Function(PatchUserSubjectEpisodeCollectionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatchUserSubjectEpisodeCollectionRequest build() => _build();

  _$PatchUserSubjectEpisodeCollectionRequest _build() {
    _$PatchUserSubjectEpisodeCollectionRequest _$result;
    try {
      _$result = _$v ??
          new _$PatchUserSubjectEpisodeCollectionRequest._(
              episodeId: episodeId.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'PatchUserSubjectEpisodeCollectionRequest', 'type'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'episodeId';
        episodeId.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatchUserSubjectEpisodeCollectionRequest',
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
