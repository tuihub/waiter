// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v0_subject_relation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$V0SubjectRelation extends V0SubjectRelation {
  @override
  final int id;
  @override
  final int type;
  @override
  final String name;
  @override
  final String nameCn;
  @override
  final Images? images;
  @override
  final String relation;

  factory _$V0SubjectRelation(
          [void Function(V0SubjectRelationBuilder)? updates]) =>
      (new V0SubjectRelationBuilder()..update(updates))._build();

  _$V0SubjectRelation._(
      {required this.id,
      required this.type,
      required this.name,
      required this.nameCn,
      this.images,
      required this.relation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'V0SubjectRelation', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'V0SubjectRelation', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'V0SubjectRelation', 'name');
    BuiltValueNullFieldError.checkNotNull(
        nameCn, r'V0SubjectRelation', 'nameCn');
    BuiltValueNullFieldError.checkNotNull(
        relation, r'V0SubjectRelation', 'relation');
  }

  @override
  V0SubjectRelation rebuild(void Function(V0SubjectRelationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  V0SubjectRelationBuilder toBuilder() =>
      new V0SubjectRelationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is V0SubjectRelation &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        nameCn == other.nameCn &&
        images == other.images &&
        relation == other.relation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameCn.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, relation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'V0SubjectRelation')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('nameCn', nameCn)
          ..add('images', images)
          ..add('relation', relation))
        .toString();
  }
}

class V0SubjectRelationBuilder
    implements Builder<V0SubjectRelation, V0SubjectRelationBuilder> {
  _$V0SubjectRelation? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameCn;
  String? get nameCn => _$this._nameCn;
  set nameCn(String? nameCn) => _$this._nameCn = nameCn;

  ImagesBuilder? _images;
  ImagesBuilder get images => _$this._images ??= new ImagesBuilder();
  set images(ImagesBuilder? images) => _$this._images = images;

  String? _relation;
  String? get relation => _$this._relation;
  set relation(String? relation) => _$this._relation = relation;

  V0SubjectRelationBuilder() {
    V0SubjectRelation._defaults(this);
  }

  V0SubjectRelationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _nameCn = $v.nameCn;
      _images = $v.images?.toBuilder();
      _relation = $v.relation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(V0SubjectRelation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$V0SubjectRelation;
  }

  @override
  void update(void Function(V0SubjectRelationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  V0SubjectRelation build() => _build();

  _$V0SubjectRelation _build() {
    _$V0SubjectRelation _$result;
    try {
      _$result = _$v ??
          new _$V0SubjectRelation._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'V0SubjectRelation', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'V0SubjectRelation', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'V0SubjectRelation', 'name'),
              nameCn: BuiltValueNullFieldError.checkNotNull(
                  nameCn, r'V0SubjectRelation', 'nameCn'),
              images: _images?.build(),
              relation: BuiltValueNullFieldError.checkNotNull(
                  relation, r'V0SubjectRelation', 'relation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'V0SubjectRelation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
