// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubjectRevision extends SubjectRevision {
  @override
  final SubjectRevisionData? data;
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

  factory _$SubjectRevision([void Function(SubjectRevisionBuilder)? updates]) =>
      (new SubjectRevisionBuilder()..update(updates))._build();

  _$SubjectRevision._(
      {this.data,
      required this.id,
      required this.type,
      this.creator,
      required this.summary,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SubjectRevision', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'SubjectRevision', 'type');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'SubjectRevision', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'SubjectRevision', 'createdAt');
  }

  @override
  SubjectRevision rebuild(void Function(SubjectRevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectRevisionBuilder toBuilder() =>
      new SubjectRevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubjectRevision &&
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
    return (newBuiltValueToStringHelper(r'SubjectRevision')
          ..add('data', data)
          ..add('id', id)
          ..add('type', type)
          ..add('creator', creator)
          ..add('summary', summary)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class SubjectRevisionBuilder
    implements
        Builder<SubjectRevision, SubjectRevisionBuilder>,
        RevisionBuilder {
  _$SubjectRevision? _$v;

  SubjectRevisionDataBuilder? _data;
  SubjectRevisionDataBuilder get data =>
      _$this._data ??= new SubjectRevisionDataBuilder();
  set data(covariant SubjectRevisionDataBuilder? data) => _$this._data = data;

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

  SubjectRevisionBuilder() {
    SubjectRevision._defaults(this);
  }

  SubjectRevisionBuilder get _$this {
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
  void replace(covariant SubjectRevision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubjectRevision;
  }

  @override
  void update(void Function(SubjectRevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubjectRevision build() => _build();

  _$SubjectRevision _build() {
    _$SubjectRevision _$result;
    try {
      _$result = _$v ??
          new _$SubjectRevision._(
              data: _data?.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'SubjectRevision', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'SubjectRevision', 'type'),
              creator: _creator?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'SubjectRevision', 'summary'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'SubjectRevision', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();

        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubjectRevision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
