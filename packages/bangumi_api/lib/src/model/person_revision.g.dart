// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonRevision extends PersonRevision {
  @override
  final BuiltMap<String, PersonRevisionDataItem>? data;
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

  factory _$PersonRevision([void Function(PersonRevisionBuilder)? updates]) =>
      (new PersonRevisionBuilder()..update(updates))._build();

  _$PersonRevision._(
      {this.data,
      required this.id,
      required this.type,
      this.creator,
      required this.summary,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PersonRevision', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'PersonRevision', 'type');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'PersonRevision', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'PersonRevision', 'createdAt');
  }

  @override
  PersonRevision rebuild(void Function(PersonRevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonRevisionBuilder toBuilder() =>
      new PersonRevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonRevision &&
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
    return (newBuiltValueToStringHelper(r'PersonRevision')
          ..add('data', data)
          ..add('id', id)
          ..add('type', type)
          ..add('creator', creator)
          ..add('summary', summary)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class PersonRevisionBuilder
    implements Builder<PersonRevision, PersonRevisionBuilder>, RevisionBuilder {
  _$PersonRevision? _$v;

  MapBuilder<String, PersonRevisionDataItem>? _data;
  MapBuilder<String, PersonRevisionDataItem> get data =>
      _$this._data ??= new MapBuilder<String, PersonRevisionDataItem>();
  set data(covariant MapBuilder<String, PersonRevisionDataItem>? data) =>
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

  PersonRevisionBuilder() {
    PersonRevision._defaults(this);
  }

  PersonRevisionBuilder get _$this {
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
  void replace(covariant PersonRevision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonRevision;
  }

  @override
  void update(void Function(PersonRevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonRevision build() => _build();

  _$PersonRevision _build() {
    _$PersonRevision _$result;
    try {
      _$result = _$v ??
          new _$PersonRevision._(
              data: _data?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'PersonRevision', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'PersonRevision', 'type'),
              creator: _creator?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'PersonRevision', 'summary'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'PersonRevision', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();

        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonRevision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
