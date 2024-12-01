// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_character_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserCharacterCollection extends UserCharacterCollection {
  @override
  final int id;
  @override
  final String name;
  @override
  final CharacterType type;
  @override
  final PersonImages? images;
  @override
  final DateTime createdAt;

  factory _$UserCharacterCollection(
          [void Function(UserCharacterCollectionBuilder)? updates]) =>
      (new UserCharacterCollectionBuilder()..update(updates))._build();

  _$UserCharacterCollection._(
      {required this.id,
      required this.name,
      required this.type,
      this.images,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UserCharacterCollection', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'UserCharacterCollection', 'name');
    BuiltValueNullFieldError.checkNotNull(
        type, r'UserCharacterCollection', 'type');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'UserCharacterCollection', 'createdAt');
  }

  @override
  UserCharacterCollection rebuild(
          void Function(UserCharacterCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCharacterCollectionBuilder toBuilder() =>
      new UserCharacterCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCharacterCollection &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        images == other.images &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCharacterCollection')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('images', images)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class UserCharacterCollectionBuilder
    implements
        Builder<UserCharacterCollection, UserCharacterCollectionBuilder> {
  _$UserCharacterCollection? _$v;

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

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  UserCharacterCollectionBuilder() {
    UserCharacterCollection._defaults(this);
  }

  UserCharacterCollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _images = $v.images?.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCharacterCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCharacterCollection;
  }

  @override
  void update(void Function(UserCharacterCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCharacterCollection build() => _build();

  _$UserCharacterCollection _build() {
    _$UserCharacterCollection _$result;
    try {
      _$result = _$v ??
          new _$UserCharacterCollection._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'UserCharacterCollection', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserCharacterCollection', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'UserCharacterCollection', 'type'),
              images: _images?.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'UserCharacterCollection', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserCharacterCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
