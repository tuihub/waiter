// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterRevision extends CharacterRevision {
  @override
  final BuiltMap<String, CharacterRevisionDataItem>? data;
  @override
  final int id;
  @override
  final int type;
  @override
  final Creator? creator;
  @override
  final String summary;
  @override
  final DateTime createdAt;

  factory _$CharacterRevision(
          [void Function(CharacterRevisionBuilder)? updates]) =>
      (new CharacterRevisionBuilder()..update(updates))._build();

  _$CharacterRevision._(
      {this.data,
      required this.id,
      required this.type,
      this.creator,
      required this.summary,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CharacterRevision', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'CharacterRevision', 'type');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'CharacterRevision', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'CharacterRevision', 'createdAt');
  }

  @override
  CharacterRevision rebuild(void Function(CharacterRevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterRevisionBuilder toBuilder() =>
      new CharacterRevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterRevision &&
        data == other.data &&
        id == other.id &&
        type == other.type &&
        creator == other.creator &&
        summary == other.summary &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterRevision')
          ..add('data', data)
          ..add('id', id)
          ..add('type', type)
          ..add('creator', creator)
          ..add('summary', summary)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class CharacterRevisionBuilder
    implements
        Builder<CharacterRevision, CharacterRevisionBuilder>,
        RevisionBuilder {
  _$CharacterRevision? _$v;

  MapBuilder<String, CharacterRevisionDataItem>? _data;
  MapBuilder<String, CharacterRevisionDataItem> get data =>
      _$this._data ??= new MapBuilder<String, CharacterRevisionDataItem>();
  set data(covariant MapBuilder<String, CharacterRevisionDataItem>? data) =>
      _$this._data = data;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(covariant int? type) => _$this._type = type;

  CreatorBuilder? _creator;
  CreatorBuilder get creator => _$this._creator ??= new CreatorBuilder();
  set creator(covariant CreatorBuilder? creator) => _$this._creator = creator;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  CharacterRevisionBuilder() {
    CharacterRevision._defaults(this);
  }

  CharacterRevisionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _id = $v.id;
      _type = $v.type;
      _creator = $v.creator?.toBuilder();
      _summary = $v.summary;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CharacterRevision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterRevision;
  }

  @override
  void update(void Function(CharacterRevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterRevision build() => _build();

  _$CharacterRevision _build() {
    _$CharacterRevision _$result;
    try {
      _$result = _$v ??
          new _$CharacterRevision._(
              data: _data?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'CharacterRevision', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'CharacterRevision', 'type'),
              creator: _creator?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'CharacterRevision', 'summary'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'CharacterRevision', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();

        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterRevision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
