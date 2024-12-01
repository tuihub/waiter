// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DetailedRevision extends DetailedRevision {
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
  @override
  final JsonObject? data;

  factory _$DetailedRevision(
          [void Function(DetailedRevisionBuilder)? updates]) =>
      (new DetailedRevisionBuilder()..update(updates))._build();

  _$DetailedRevision._(
      {required this.id,
      required this.type,
      this.creator,
      required this.summary,
      required this.createdAt,
      this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DetailedRevision', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'DetailedRevision', 'type');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'DetailedRevision', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'DetailedRevision', 'createdAt');
  }

  @override
  DetailedRevision rebuild(void Function(DetailedRevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailedRevisionBuilder toBuilder() =>
      new DetailedRevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailedRevision &&
        id == other.id &&
        type == other.type &&
        creator == other.creator &&
        summary == other.summary &&
        createdAt == other.createdAt &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DetailedRevision')
          ..add('id', id)
          ..add('type', type)
          ..add('creator', creator)
          ..add('summary', summary)
          ..add('createdAt', createdAt)
          ..add('data', data))
        .toString();
  }
}

class DetailedRevisionBuilder
    implements Builder<DetailedRevision, DetailedRevisionBuilder> {
  _$DetailedRevision? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  CreatorBuilder? _creator;
  CreatorBuilder get creator => _$this._creator ??= new CreatorBuilder();
  set creator(CreatorBuilder? creator) => _$this._creator = creator;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  DetailedRevisionBuilder() {
    DetailedRevision._defaults(this);
  }

  DetailedRevisionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _creator = $v.creator?.toBuilder();
      _summary = $v.summary;
      _createdAt = $v.createdAt;
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailedRevision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailedRevision;
  }

  @override
  void update(void Function(DetailedRevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailedRevision build() => _build();

  _$DetailedRevision _build() {
    _$DetailedRevision _$result;
    try {
      _$result = _$v ??
          new _$DetailedRevision._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'DetailedRevision', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'DetailedRevision', 'type'),
              creator: _creator?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'DetailedRevision', 'summary'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'DetailedRevision', 'createdAt'),
              data: data);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DetailedRevision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
