// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Person extends Person {
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
  final String shortSummary;
  @override
  final bool locked;

  factory _$Person([void Function(PersonBuilder)? updates]) =>
      (new PersonBuilder()..update(updates))._build();

  _$Person._(
      {required this.id,
      required this.name,
      required this.type,
      required this.career,
      this.images,
      required this.shortSummary,
      required this.locked})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Person', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Person', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'Person', 'type');
    BuiltValueNullFieldError.checkNotNull(career, r'Person', 'career');
    BuiltValueNullFieldError.checkNotNull(
        shortSummary, r'Person', 'shortSummary');
    BuiltValueNullFieldError.checkNotNull(locked, r'Person', 'locked');
  }

  @override
  Person rebuild(void Function(PersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonBuilder toBuilder() => new PersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Person &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        career == other.career &&
        images == other.images &&
        shortSummary == other.shortSummary &&
        locked == other.locked;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, career.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, shortSummary.hashCode);
    _$hash = $jc(_$hash, locked.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Person')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('career', career)
          ..add('images', images)
          ..add('shortSummary', shortSummary)
          ..add('locked', locked))
        .toString();
  }
}

class PersonBuilder implements Builder<Person, PersonBuilder> {
  _$Person? _$v;

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

  String? _shortSummary;
  String? get shortSummary => _$this._shortSummary;
  set shortSummary(String? shortSummary) => _$this._shortSummary = shortSummary;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  PersonBuilder() {
    Person._defaults(this);
  }

  PersonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _career = $v.career.toBuilder();
      _images = $v.images?.toBuilder();
      _shortSummary = $v.shortSummary;
      _locked = $v.locked;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Person other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Person;
  }

  @override
  void update(void Function(PersonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Person build() => _build();

  _$Person _build() {
    _$Person _$result;
    try {
      _$result = _$v ??
          new _$Person._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Person', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Person', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'Person', 'type'),
              career: career.build(),
              images: _images?.build(),
              shortSummary: BuiltValueNullFieldError.checkNotNull(
                  shortSummary, r'Person', 'shortSummary'),
              locked: BuiltValueNullFieldError.checkNotNull(
                  locked, r'Person', 'locked'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'career';
        career.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Person', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
