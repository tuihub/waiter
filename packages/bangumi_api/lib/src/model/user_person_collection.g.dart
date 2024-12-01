// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_person_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserPersonCollection extends UserPersonCollection {
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
  final DateTime createdAt;

  factory _$UserPersonCollection(
          [void Function(UserPersonCollectionBuilder)? updates]) =>
      (new UserPersonCollectionBuilder()..update(updates))._build();

  _$UserPersonCollection._(
      {required this.id,
      required this.name,
      required this.type,
      required this.career,
      this.images,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserPersonCollection', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'UserPersonCollection', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, r'UserPersonCollection', 'type');
    BuiltValueNullFieldError.checkNotNull(
        career, r'UserPersonCollection', 'career');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'UserPersonCollection', 'createdAt');
  }

  @override
  UserPersonCollection rebuild(
          void Function(UserPersonCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPersonCollectionBuilder toBuilder() =>
      new UserPersonCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPersonCollection &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        career == other.career &&
        images == other.images &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, career.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserPersonCollection')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('career', career)
          ..add('images', images)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class UserPersonCollectionBuilder
    implements Builder<UserPersonCollection, UserPersonCollectionBuilder> {
  _$UserPersonCollection? _$v;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  UserPersonCollectionBuilder() {
    UserPersonCollection._defaults(this);
  }

  UserPersonCollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _career = $v.career.toBuilder();
      _images = $v.images?.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPersonCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserPersonCollection;
  }

  @override
  void update(void Function(UserPersonCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserPersonCollection build() => _build();

  _$UserPersonCollection _build() {
    _$UserPersonCollection _$result;
    try {
      _$result = _$v ??
          new _$UserPersonCollection._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'UserPersonCollection', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserPersonCollection', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'UserPersonCollection', 'type'),
              career: career.build(),
              images: _images?.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'UserPersonCollection', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'career';
        career.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserPersonCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
