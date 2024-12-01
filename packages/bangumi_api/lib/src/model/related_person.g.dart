// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_person.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RelatedPerson extends RelatedPerson {
  @override
  final int id;
  @override
  final String name;
  @override
  final PersonType type;
  @override
  final BuiltList<PersonCareer> career;
  @override
  final PersonImages? images;
  @override
  final String relation;
  @override
  final String eps;

  factory _$RelatedPerson([void Function(RelatedPersonBuilder)? updates]) =>
      (new RelatedPersonBuilder()..update(updates))._build();

  _$RelatedPerson._(
      {required this.id,
      required this.name,
      required this.type,
      required this.career,
      this.images,
      required this.relation,
      required this.eps})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RelatedPerson', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'RelatedPerson', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'RelatedPerson', 'type');
    BuiltValueNullFieldError.checkNotNull(career, r'RelatedPerson', 'career');
    BuiltValueNullFieldError.checkNotNull(
        relation, r'RelatedPerson', 'relation');
    BuiltValueNullFieldError.checkNotNull(eps, r'RelatedPerson', 'eps');
  }

  @override
  RelatedPerson rebuild(void Function(RelatedPersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RelatedPersonBuilder toBuilder() => new RelatedPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RelatedPerson &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        career == other.career &&
        images == other.images &&
        relation == other.relation &&
        eps == other.eps;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, career.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, relation.hashCode);
    _$hash = $jc(_$hash, eps.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RelatedPerson')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('career', career)
          ..add('images', images)
          ..add('relation', relation)
          ..add('eps', eps))
        .toString();
  }
}

class RelatedPersonBuilder
    implements Builder<RelatedPerson, RelatedPersonBuilder> {
  _$RelatedPerson? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PersonType? _type;
  PersonType? get type => _$this._type;
  set type(PersonType? type) => _$this._type = type;

  ListBuilder<PersonCareer>? _career;
  ListBuilder<PersonCareer> get career =>
      _$this._career ??= new ListBuilder<PersonCareer>();
  set career(ListBuilder<PersonCareer>? career) => _$this._career = career;

  PersonImagesBuilder? _images;
  PersonImagesBuilder get images =>
      _$this._images ??= new PersonImagesBuilder();
  set images(PersonImagesBuilder? images) => _$this._images = images;

  String? _relation;
  String? get relation => _$this._relation;
  set relation(String? relation) => _$this._relation = relation;

  String? _eps;
  String? get eps => _$this._eps;
  set eps(String? eps) => _$this._eps = eps;

  RelatedPersonBuilder() {
    RelatedPerson._defaults(this);
  }

  RelatedPersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _career = $v.career.toBuilder();
      _images = $v.images?.toBuilder();
      _relation = $v.relation;
      _eps = $v.eps;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RelatedPerson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RelatedPerson;
  }

  @override
  void update(void Function(RelatedPersonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RelatedPerson build() => _build();

  _$RelatedPerson _build() {
    _$RelatedPerson _$result;
    try {
      _$result = _$v ??
          new _$RelatedPerson._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'RelatedPerson', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'RelatedPerson', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'RelatedPerson', 'type'),
              career: career.build(),
              images: _images?.build(),
              relation: BuiltValueNullFieldError.checkNotNull(
                  relation, r'RelatedPerson', 'relation'),
              eps: BuiltValueNullFieldError.checkNotNull(
                  eps, r'RelatedPerson', 'eps'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'career';
        career.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RelatedPerson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
