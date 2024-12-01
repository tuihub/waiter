// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_person.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterPerson extends CharacterPerson {
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

  factory _$CharacterPerson([void Function(CharacterPersonBuilder)? updates]) =>
      (new CharacterPersonBuilder()..update(updates))._build();

  _$CharacterPerson._(
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
    BuiltValueNullFieldError.checkNotNull(id, r'CharacterPerson', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'CharacterPerson', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'CharacterPerson', 'type');
    BuiltValueNullFieldError.checkNotNull(
        subjectId, r'CharacterPerson', 'subjectId');
    BuiltValueNullFieldError.checkNotNull(
        subjectType, r'CharacterPerson', 'subjectType');
    BuiltValueNullFieldError.checkNotNull(
        subjectName, r'CharacterPerson', 'subjectName');
    BuiltValueNullFieldError.checkNotNull(
        subjectNameCn, r'CharacterPerson', 'subjectNameCn');
  }

  @override
  CharacterPerson rebuild(void Function(CharacterPersonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterPersonBuilder toBuilder() =>
      new CharacterPersonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterPerson &&
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
    return (newBuiltValueToStringHelper(r'CharacterPerson')
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

class CharacterPersonBuilder
    implements Builder<CharacterPerson, CharacterPersonBuilder> {
  _$CharacterPerson? _$v;

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

  CharacterPersonBuilder() {
    CharacterPerson._defaults(this);
  }

  CharacterPersonBuilder get _$this {
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
  void replace(CharacterPerson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterPerson;
  }

  @override
  void update(void Function(CharacterPersonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterPerson build() => _build();

  _$CharacterPerson _build() {
    _$CharacterPerson _$result;
    try {
      _$result = _$v ??
          new _$CharacterPerson._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'CharacterPerson', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CharacterPerson', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'CharacterPerson', 'type'),
              images: _images?.build(),
              subjectId: BuiltValueNullFieldError.checkNotNull(
                  subjectId, r'CharacterPerson', 'subjectId'),
              subjectType: BuiltValueNullFieldError.checkNotNull(
                  subjectType, r'CharacterPerson', 'subjectType'),
              subjectName: BuiltValueNullFieldError.checkNotNull(
                  subjectName, r'CharacterPerson', 'subjectName'),
              subjectNameCn: BuiltValueNullFieldError.checkNotNull(
                  subjectNameCn, r'CharacterPerson', 'subjectNameCn'),
              staff: staff);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterPerson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
