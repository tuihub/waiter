// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonDetail extends PersonDetail {
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
  final String summary;
  @override
  final bool locked;
  @override
  final DateTime lastModified;
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

  factory _$PersonDetail([void Function(PersonDetailBuilder)? updates]) =>
      (new PersonDetailBuilder()..update(updates))._build();

  _$PersonDetail._(
      {required this.id,
      required this.name,
      required this.type,
      required this.career,
      this.images,
      required this.summary,
      required this.locked,
      required this.lastModified,
      this.infobox,
      this.gender,
      this.bloodType,
      this.birthYear,
      this.birthMon,
      this.birthDay,
      required this.stat})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PersonDetail', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'PersonDetail', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'PersonDetail', 'type');
    BuiltValueNullFieldError.checkNotNull(career, r'PersonDetail', 'career');
    BuiltValueNullFieldError.checkNotNull(summary, r'PersonDetail', 'summary');
    BuiltValueNullFieldError.checkNotNull(locked, r'PersonDetail', 'locked');
    BuiltValueNullFieldError.checkNotNull(
        lastModified, r'PersonDetail', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(stat, r'PersonDetail', 'stat');
  }

  @override
  PersonDetail rebuild(void Function(PersonDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonDetailBuilder toBuilder() => new PersonDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonDetail &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        career == other.career &&
        images == other.images &&
        summary == other.summary &&
        locked == other.locked &&
        lastModified == other.lastModified &&
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
    _$hash = $jc(_$hash, career.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, locked.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
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
    return (newBuiltValueToStringHelper(r'PersonDetail')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('career', career)
          ..add('images', images)
          ..add('summary', summary)
          ..add('locked', locked)
          ..add('lastModified', lastModified)
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

class PersonDetailBuilder
    implements Builder<PersonDetail, PersonDetailBuilder> {
  _$PersonDetail? _$v;

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

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  bool? _locked;
  bool? get locked => _$this._locked;
  set locked(bool? locked) => _$this._locked = locked;

  DateTime? _lastModified;
  DateTime? get lastModified => _$this._lastModified;
  set lastModified(DateTime? lastModified) =>
      _$this._lastModified = lastModified;

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

  PersonDetailBuilder() {
    PersonDetail._defaults(this);
  }

  PersonDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _career = $v.career.toBuilder();
      _images = $v.images?.toBuilder();
      _summary = $v.summary;
      _locked = $v.locked;
      _lastModified = $v.lastModified;
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
  void replace(PersonDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonDetail;
  }

  @override
  void update(void Function(PersonDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonDetail build() => _build();

  _$PersonDetail _build() {
    _$PersonDetail _$result;
    try {
      _$result = _$v ??
          new _$PersonDetail._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'PersonDetail', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'PersonDetail', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'PersonDetail', 'type'),
              career: career.build(),
              images: _images?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'PersonDetail', 'summary'),
              locked: BuiltValueNullFieldError.checkNotNull(
                  locked, r'PersonDetail', 'locked'),
              lastModified: BuiltValueNullFieldError.checkNotNull(
                  lastModified, r'PersonDetail', 'lastModified'),
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
        _$failedField = 'career';
        career.build();
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'infobox';
        _infobox?.build();

        _$failedField = 'stat';
        stat.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
