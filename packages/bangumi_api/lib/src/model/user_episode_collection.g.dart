// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_episode_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserEpisodeCollection extends UserEpisodeCollection {
  @override
  final Episode episode;
  @override
  final EpisodeCollectionType type;

  factory _$UserEpisodeCollection(
          [void Function(UserEpisodeCollectionBuilder)? updates]) =>
      (new UserEpisodeCollectionBuilder()..update(updates))._build();

  _$UserEpisodeCollection._({required this.episode, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        episode, r'UserEpisodeCollection', 'episode');
    BuiltValueNullFieldError.checkNotNull(
        type, r'UserEpisodeCollection', 'type');
  }

  @override
  UserEpisodeCollection rebuild(
          void Function(UserEpisodeCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserEpisodeCollectionBuilder toBuilder() =>
      new UserEpisodeCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEpisodeCollection &&
        episode == other.episode &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserEpisodeCollection')
          ..add('episode', episode)
          ..add('type', type))
        .toString();
  }
}

class UserEpisodeCollectionBuilder
    implements Builder<UserEpisodeCollection, UserEpisodeCollectionBuilder> {
  _$UserEpisodeCollection? _$v;

  EpisodeBuilder? _episode;
  EpisodeBuilder get episode => _$this._episode ??= new EpisodeBuilder();
  set episode(EpisodeBuilder? episode) => _$this._episode = episode;

  EpisodeCollectionType? _type;
  EpisodeCollectionType? get type => _$this._type;
  set type(EpisodeCollectionType? type) => _$this._type = type;

  UserEpisodeCollectionBuilder() {
    UserEpisodeCollection._defaults(this);
  }

  UserEpisodeCollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _episode = $v.episode.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserEpisodeCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserEpisodeCollection;
  }

  @override
  void update(void Function(UserEpisodeCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserEpisodeCollection build() => _build();

  _$UserEpisodeCollection _build() {
    _$UserEpisodeCollection _$result;
    try {
      _$result = _$v ??
          new _$UserEpisodeCollection._(
              episode: episode.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'UserEpisodeCollection', 'type'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'episode';
        episode.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserEpisodeCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
