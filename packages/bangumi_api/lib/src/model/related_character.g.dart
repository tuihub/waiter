// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_character.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RelatedCharacter extends RelatedCharacter {
  @override
  final int id;
  @override
  final String name;
  @override
  final CharacterType type;
  @override
  final PersonImages? images;
  @override
  final String relation;
  @override
  final BuiltList<Person>? actors;

  factory _$RelatedCharacter(
          [void Function(RelatedCharacterBuilder)? updates]) =>
      (new RelatedCharacterBuilder()..update(updates))._build();

  _$RelatedCharacter._(
      {required this.id,
      required this.name,
      required this.type,
      this.images,
      required this.relation,
      this.actors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RelatedCharacter', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'RelatedCharacter', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'RelatedCharacter', 'type');
    BuiltValueNullFieldError.checkNotNull(
        relation, r'RelatedCharacter', 'relation');
  }

  @override
  RelatedCharacter rebuild(void Function(RelatedCharacterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RelatedCharacterBuilder toBuilder() =>
      new RelatedCharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RelatedCharacter &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        images == other.images &&
        relation == other.relation &&
        actors == other.actors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, relation.hashCode);
    _$hash = $jc(_$hash, actors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RelatedCharacter')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('images', images)
          ..add('relation', relation)
          ..add('actors', actors))
        .toString();
  }
}

class RelatedCharacterBuilder
    implements Builder<RelatedCharacter, RelatedCharacterBuilder> {
  _$RelatedCharacter? _$v;

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

  String? _relation;
  String? get relation => _$this._relation;
  set relation(String? relation) => _$this._relation = relation;

  ListBuilder<Person>? _actors;
  ListBuilder<Person> get actors =>
      _$this._actors ??= new ListBuilder<Person>();
  set actors(ListBuilder<Person>? actors) => _$this._actors = actors;

  RelatedCharacterBuilder() {
    RelatedCharacter._defaults(this);
  }

  RelatedCharacterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _images = $v.images?.toBuilder();
      _relation = $v.relation;
      _actors = $v.actors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RelatedCharacter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RelatedCharacter;
  }

  @override
  void update(void Function(RelatedCharacterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RelatedCharacter build() => _build();

  _$RelatedCharacter _build() {
    _$RelatedCharacter _$result;
    try {
      _$result = _$v ??
          new _$RelatedCharacter._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'RelatedCharacter', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'RelatedCharacter', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'RelatedCharacter', 'type'),
              images: _images?.build(),
              relation: BuiltValueNullFieldError.checkNotNull(
                  relation, r'RelatedCharacter', 'relation'),
              actors: _actors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'actors';
        _actors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RelatedCharacter', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
