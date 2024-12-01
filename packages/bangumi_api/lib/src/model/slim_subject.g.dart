// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slim_subject.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SlimSubject extends SlimSubject {
  @override
  final int id;
  @override
  final SubjectType type;
  @override
  final String name;
  @override
  final String nameCn;
  @override
  final String shortSummary;
  @override
  final String? date;
  @override
  final Images images;
  @override
  final int volumes;
  @override
  final int eps;
  @override
  final int collectionTotal;
  @override
  final num score;
  @override
  final int rank;
  @override
  final BuiltList<Tag> tags;

  factory _$SlimSubject([void Function(SlimSubjectBuilder)? updates]) =>
      (new SlimSubjectBuilder()..update(updates))._build();

  _$SlimSubject._(
      {required this.id,
      required this.type,
      required this.name,
      required this.nameCn,
      required this.shortSummary,
      this.date,
      required this.images,
      required this.volumes,
      required this.eps,
      required this.collectionTotal,
      required this.score,
      required this.rank,
      required this.tags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SlimSubject', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'SlimSubject', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'SlimSubject', 'name');
    BuiltValueNullFieldError.checkNotNull(nameCn, r'SlimSubject', 'nameCn');
    BuiltValueNullFieldError.checkNotNull(
        shortSummary, r'SlimSubject', 'shortSummary');
    BuiltValueNullFieldError.checkNotNull(images, r'SlimSubject', 'images');
    BuiltValueNullFieldError.checkNotNull(volumes, r'SlimSubject', 'volumes');
    BuiltValueNullFieldError.checkNotNull(eps, r'SlimSubject', 'eps');
    BuiltValueNullFieldError.checkNotNull(
        collectionTotal, r'SlimSubject', 'collectionTotal');
    BuiltValueNullFieldError.checkNotNull(score, r'SlimSubject', 'score');
    BuiltValueNullFieldError.checkNotNull(rank, r'SlimSubject', 'rank');
    BuiltValueNullFieldError.checkNotNull(tags, r'SlimSubject', 'tags');
  }

  @override
  SlimSubject rebuild(void Function(SlimSubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SlimSubjectBuilder toBuilder() => new SlimSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SlimSubject &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        nameCn == other.nameCn &&
        shortSummary == other.shortSummary &&
        date == other.date &&
        images == other.images &&
        volumes == other.volumes &&
        eps == other.eps &&
        collectionTotal == other.collectionTotal &&
        score == other.score &&
        rank == other.rank &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameCn.hashCode);
    _$hash = $jc(_$hash, shortSummary.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, volumes.hashCode);
    _$hash = $jc(_$hash, eps.hashCode);
    _$hash = $jc(_$hash, collectionTotal.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SlimSubject')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('nameCn', nameCn)
          ..add('shortSummary', shortSummary)
          ..add('date', date)
          ..add('images', images)
          ..add('volumes', volumes)
          ..add('eps', eps)
          ..add('collectionTotal', collectionTotal)
          ..add('score', score)
          ..add('rank', rank)
          ..add('tags', tags))
        .toString();
  }
}

class SlimSubjectBuilder implements Builder<SlimSubject, SlimSubjectBuilder> {
  _$SlimSubject? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  SubjectType? _type;
  SubjectType? get type => _$this._type;
  set type(SubjectType? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameCn;
  String? get nameCn => _$this._nameCn;
  set nameCn(String? nameCn) => _$this._nameCn = nameCn;

  String? _shortSummary;
  String? get shortSummary => _$this._shortSummary;
  set shortSummary(String? shortSummary) => _$this._shortSummary = shortSummary;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ImagesBuilder? _images;
  ImagesBuilder get images => _$this._images ??= new ImagesBuilder();
  set images(ImagesBuilder? images) => _$this._images = images;

  int? _volumes;
  int? get volumes => _$this._volumes;
  set volumes(int? volumes) => _$this._volumes = volumes;

  int? _eps;
  int? get eps => _$this._eps;
  set eps(int? eps) => _$this._eps = eps;

  int? _collectionTotal;
  int? get collectionTotal => _$this._collectionTotal;
  set collectionTotal(int? collectionTotal) =>
      _$this._collectionTotal = collectionTotal;

  num? _score;
  num? get score => _$this._score;
  set score(num? score) => _$this._score = score;

  int? _rank;
  int? get rank => _$this._rank;
  set rank(int? rank) => _$this._rank = rank;

  ListBuilder<Tag>? _tags;
  ListBuilder<Tag> get tags => _$this._tags ??= new ListBuilder<Tag>();
  set tags(ListBuilder<Tag>? tags) => _$this._tags = tags;

  SlimSubjectBuilder() {
    SlimSubject._defaults(this);
  }

  SlimSubjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _nameCn = $v.nameCn;
      _shortSummary = $v.shortSummary;
      _date = $v.date;
      _images = $v.images.toBuilder();
      _volumes = $v.volumes;
      _eps = $v.eps;
      _collectionTotal = $v.collectionTotal;
      _score = $v.score;
      _rank = $v.rank;
      _tags = $v.tags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SlimSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SlimSubject;
  }

  @override
  void update(void Function(SlimSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SlimSubject build() => _build();

  _$SlimSubject _build() {
    _$SlimSubject _$result;
    try {
      _$result = _$v ??
          new _$SlimSubject._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'SlimSubject', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'SlimSubject', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'SlimSubject', 'name'),
              nameCn: BuiltValueNullFieldError.checkNotNull(
                  nameCn, r'SlimSubject', 'nameCn'),
              shortSummary: BuiltValueNullFieldError.checkNotNull(
                  shortSummary, r'SlimSubject', 'shortSummary'),
              date: date,
              images: images.build(),
              volumes: BuiltValueNullFieldError.checkNotNull(
                  volumes, r'SlimSubject', 'volumes'),
              eps: BuiltValueNullFieldError.checkNotNull(
                  eps, r'SlimSubject', 'eps'),
              collectionTotal: BuiltValueNullFieldError.checkNotNull(
                  collectionTotal, r'SlimSubject', 'collectionTotal'),
              score: BuiltValueNullFieldError.checkNotNull(
                  score, r'SlimSubject', 'score'),
              rank: BuiltValueNullFieldError.checkNotNull(
                  rank, r'SlimSubject', 'rank'),
              tags: tags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();

        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SlimSubject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
