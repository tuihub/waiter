// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterDetail extends CharacterDetail {
  @override
  final int id;
  @override
  final String name;
  @override
  final CharacterType type;
  @override
  final PersonImages? images;
  @override
  final String summary;
  @override
  final bool locked;
  @override
  final BuiltList<JsonObject>? infobox;
  @override
  final String? gender;
  @override
  final BloodType? bloodType;
  @override
  final int? birthYear;
  @override
  final int? birthMon;
  @override
  final int? birthDay;
  @override
  final Stat stat;

  factory _$CharacterDetail([void Function(CharacterDetailBuilder)? updates]) =>
      (new CharacterDetailBuilder()..update(updates))._build();

  _$CharacterDetail._(
      {required this.id,
      required this.name,
      required this.type,
      this.images,
      required this.summary,
      required this.locked,
      this.infobox,
      this.gender,
      this.bloodType,
      this.birthYear,
      this.birthMon,
      this.birthDay,
      required this.stat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CharacterDetail', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'CharacterDetail', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'CharacterDetail', 'type');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'CharacterDetail', 'summary');
    BuiltValueNullFieldError.checkNotNull(locked, r'CharacterDetail', 'locked');
    BuiltValueNullFieldError.checkNotNull(stat, r'CharacterDetail', 'stat');
  }

  @override
  CharacterDetail rebuild(void Function(CharacterDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterDetailBuilder toBuilder() =>
      new CharacterDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterDetail &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        images == other.images &&
        summary == other.summary &&
        locked == other.locked &&
        infobox == other.infobox &&
        gender == other.gender &&
        bloodType == other.bloodType &&
        birthYear == other.birthYear &&
        birthMon == other.birthMon &&
        birthDay == other.birthDay &&
        stat == other.stat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, locked.hashCode);
    _$hash = $jc(_$hash, infobox.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, bloodType.hashCode);
    _$hash = $jc(_$hash, birthYear.hashCode);
    _$hash = $jc(_$hash, birthMon.hashCode);
    _$hash = $jc(_$hash, birthDay.hashCode);
    _$hash = $jc(_$hash, stat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterDetail')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('images', images)
          ..add('summary', summary)
          ..add('locked', locked)
          ..add('infobox', infobox)
          ..add('gender', gender)
          ..add('bloodType', bloodType)
          ..add('birthYear', birthYear)
          ..add('birthMon', birthMon)
          ..add('birthDay', birthDay)
          ..add('stat', stat))
        .toString();
  }
}

class CharacterDetailBuilder
    implements Builder<CharacterDetail, CharacterDetailBuilder> {
  _$CharacterDetail? _$v;

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

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  ListBuilder<JsonObject>? _infobox;
  ListBuilder<JsonObject> get infobox =>
      _$this._infobox ??= new ListBuilder<JsonObject>();
  set infobox(ListBuilder<JsonObject>? infobox) => _$this._infobox = infobox;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  BloodType? _bloodType;
  BloodType? get bloodType => _$this._bloodType;
  set bloodType(BloodType? bloodType) => _$this._bloodType = bloodType;

  int? _birthYear;
  int? get birthYear => _$this._birthYear;
  set birthYear(int? birthYear) => _$this._birthYear = birthYear;

  int? _birthMon;
  int? get birthMon => _$this._birthMon;
  set birthMon(int? birthMon) => _$this._birthMon = birthMon;

  int? _birthDay;
  int? get birthDay => _$this._birthDay;
  set birthDay(int? birthDay) => _$this._birthDay = birthDay;

  StatBuilder? _stat;
  StatBuilder get stat => _$this._stat ??= new StatBuilder();
  set stat(StatBuilder? stat) => _$this._stat = stat;

  CharacterDetailBuilder() {
    CharacterDetail._defaults(this);
  }

  CharacterDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _images = $v.images?.toBuilder();
      _summary = $v.summary;
      _locked = $v.locked;
      _infobox = $v.infobox?.toBuilder();
      _gender = $v.gender;
      _bloodType = $v.bloodType;
      _birthYear = $v.birthYear;
      _birthMon = $v.birthMon;
      _birthDay = $v.birthDay;
      _stat = $v.stat.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterDetail;
  }

  @override
  void update(void Function(CharacterDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterDetail build() => _build();

  _$CharacterDetail _build() {
    _$CharacterDetail _$result;
    try {
      _$result = _$v ??
          new _$CharacterDetail._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'CharacterDetail', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CharacterDetail', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'CharacterDetail', 'type'),
              images: _images?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'CharacterDetail', 'summary'),
              locked: BuiltValueNullFieldError.checkNotNull(
                  locked, r'CharacterDetail', 'locked'),
              infobox: _infobox?.build(),
              gender: gender,
              bloodType: bloodType,
              birthYear: birthYear,
              birthMon: birthMon,
              birthDay: birthDay,
              stat: stat.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'infobox';
        _infobox?.build();

        _$failedField = 'stat';
        stat.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
