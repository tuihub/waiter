// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_character.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonCharacter extends PersonCharacter {
  @override
  final int id;
  @override
  final String name;
  @override
  final CharacterType type;
  @override
  final PersonImages? images;
  @override
  final int subjectId;
  @override
  final SubjectType subjectType;
  @override
  final String subjectName;
  @override
  final String subjectNameCn;
  @override
  final String? staff;

  factory _$PersonCharacter([void Function(PersonCharacterBuilder)? updates]) =>
      (new PersonCharacterBuilder()..update(updates))._build();

  _$PersonCharacter._(
      {required this.id,
      required this.name,
      required this.type,
      this.images,
      required this.subjectId,
      required this.subjectType,
      required this.subjectName,
      required this.subjectNameCn,
      this.staff})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PersonCharacter', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'PersonCharacter', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'PersonCharacter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        subjectId, r'PersonCharacter', 'subjectId');
    BuiltValueNullFieldError.checkNotNull(
        subjectType, r'PersonCharacter', 'subjectType');
    BuiltValueNullFieldError.checkNotNull(
        subjectName, r'PersonCharacter', 'subjectName');
    BuiltValueNullFieldError.checkNotNull(
        subjectNameCn, r'PersonCharacter', 'subjectNameCn');
  }

  @override
  PersonCharacter rebuild(void Function(PersonCharacterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonCharacterBuilder toBuilder() =>
      new PersonCharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonCharacter &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        images == other.images &&
        subjectId == other.subjectId &&
        subjectType == other.subjectType &&
        subjectName == other.subjectName &&
        subjectNameCn == other.subjectNameCn &&
        staff == other.staff;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jc(_$hash, subjectType.hashCode);
    _$hash = $jc(_$hash, subjectName.hashCode);
    _$hash = $jc(_$hash, subjectNameCn.hashCode);
    _$hash = $jc(_$hash, staff.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonCharacter')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('images', images)
          ..add('subjectId', subjectId)
          ..add('subjectType', subjectType)
          ..add('subjectName', subjectName)
          ..add('subjectNameCn', subjectNameCn)
          ..add('staff', staff))
        .toString();
  }
}

class PersonCharacterBuilder
    implements Builder<PersonCharacter, PersonCharacterBuilder> {
  _$PersonCharacter? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CharacterType? _type;
  CharacterType? get type => _$this._type;
  set type(CharacterType? type) => _$this._type = type;

  PersonImagesBuilder? _images;
  PersonImagesBuilder get images =>
      _$this._images ??= new PersonImagesBuilder();
  set images(PersonImagesBuilder? images) => _$this._images = images;

  int? _subjectId;
  int? get subjectId => _$this._subjectId;
  set subjectId(int? subjectId) => _$this._subjectId = subjectId;

  SubjectType? _subjectType;
  SubjectType? get subjectType => _$this._subjectType;
  set subjectType(SubjectType? subjectType) =>
      _$this._subjectType = subjectType;

  String? _subjectName;
  String? get subjectName => _$this._subjectName;
  set subjectName(String? subjectName) => _$this._subjectName = subjectName;

  String? _subjectNameCn;
  String? get subjectNameCn => _$this._subjectNameCn;
  set subjectNameCn(String? subjectNameCn) =>
      _$this._subjectNameCn = subjectNameCn;

  String? _staff;
  String? get staff => _$this._staff;
  set staff(String? staff) => _$this._staff = staff;

  PersonCharacterBuilder() {
    PersonCharacter._defaults(this);
  }

  PersonCharacterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _images = $v.images?.toBuilder();
      _subjectId = $v.subjectId;
      _subjectType = $v.subjectType;
      _subjectName = $v.subjectName;
      _subjectNameCn = $v.subjectNameCn;
      _staff = $v.staff;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonCharacter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonCharacter;
  }

  @override
  void update(void Function(PersonCharacterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonCharacter build() => _build();

  _$PersonCharacter _build() {
    _$PersonCharacter _$result;
    try {
      _$result = _$v ??
          new _$PersonCharacter._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'PersonCharacter', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'PersonCharacter', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'PersonCharacter', 'type'),
              images: _images?.build(),
              subjectId: BuiltValueNullFieldError.checkNotNull(
                  subjectId, r'PersonCharacter', 'subjectId'),
              subjectType: BuiltValueNullFieldError.checkNotNull(
                  subjectType, r'PersonCharacter', 'subjectType'),
              subjectName: BuiltValueNullFieldError.checkNotNull(
                  subjectName, r'PersonCharacter', 'subjectName'),
              subjectNameCn: BuiltValueNullFieldError.checkNotNull(
                  subjectNameCn, r'PersonCharacter', 'subjectNameCn'),
              staff: staff);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonCharacter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
