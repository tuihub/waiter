// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Episode extends Episode {
  @override
  final int id;
  @override
  final int type;
  @override
  final String name;
  @override
  final String nameCn;
  @override
  final num sort;
  @override
  final num? ep;
  @override
  final String airdate;
  @override
  final int comment;
  @override
  final String duration;
  @override
  final String desc;
  @override
  final int disc;
  @override
  final int? durationSeconds;

  factory _$Episode([void Function(EpisodeBuilder)? updates]) =>
      (new EpisodeBuilder()..update(updates))._build();

  _$Episode._(
      {required this.id,
      required this.type,
      required this.name,
      required this.nameCn,
      required this.sort,
      this.ep,
      required this.airdate,
      required this.comment,
      required this.duration,
      required this.desc,
      required this.disc,
      this.durationSeconds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Episode', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'Episode', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'Episode', 'name');
    BuiltValueNullFieldError.checkNotNull(nameCn, r'Episode', 'nameCn');
    BuiltValueNullFieldError.checkNotNull(sort, r'Episode', 'sort');
    BuiltValueNullFieldError.checkNotNull(airdate, r'Episode', 'airdate');
    BuiltValueNullFieldError.checkNotNull(comment, r'Episode', 'comment');
    BuiltValueNullFieldError.checkNotNull(duration, r'Episode', 'duration');
    BuiltValueNullFieldError.checkNotNull(desc, r'Episode', 'desc');
    BuiltValueNullFieldError.checkNotNull(disc, r'Episode', 'disc');
  }

  @override
  Episode rebuild(void Function(EpisodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodeBuilder toBuilder() => new EpisodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Episode &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        nameCn == other.nameCn &&
        sort == other.sort &&
        ep == other.ep &&
        airdate == other.airdate &&
        comment == other.comment &&
        duration == other.duration &&
        desc == other.desc &&
        disc == other.disc &&
        durationSeconds == other.durationSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameCn.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, ep.hashCode);
    _$hash = $jc(_$hash, airdate.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, desc.hashCode);
    _$hash = $jc(_$hash, disc.hashCode);
    _$hash = $jc(_$hash, durationSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Episode')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('nameCn', nameCn)
          ..add('sort', sort)
          ..add('ep', ep)
          ..add('airdate', airdate)
          ..add('comment', comment)
          ..add('duration', duration)
          ..add('desc', desc)
          ..add('disc', disc)
          ..add('durationSeconds', durationSeconds))
        .toString();
  }
}

class EpisodeBuilder implements Builder<Episode, EpisodeBuilder> {
  _$Episode? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameCn;
  String? get nameCn => _$this._nameCn;
  set nameCn(String? nameCn) => _$this._nameCn = nameCn;

  num? _sort;
  num? get sort => _$this._sort;
  set sort(num? sort) => _$this._sort = sort;

  num? _ep;
  num? get ep => _$this._ep;
  set ep(num? ep) => _$this._ep = ep;

  String? _airdate;
  String? get airdate => _$this._airdate;
  set airdate(String? airdate) => _$this._airdate = airdate;

  int? _comment;
  int? get comment => _$this._comment;
  set comment(int? comment) => _$this._comment = comment;

  String? _duration;
  String? get duration => _$this._duration;
  set duration(String? duration) => _$this._duration = duration;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  int? _disc;
  int? get disc => _$this._disc;
  set disc(int? disc) => _$this._disc = disc;

  int? _durationSeconds;
  int? get durationSeconds => _$this._durationSeconds;
  set durationSeconds(int? durationSeconds) =>
      _$this._durationSeconds = durationSeconds;

  EpisodeBuilder() {
    Episode._defaults(this);
  }

  EpisodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _nameCn = $v.nameCn;
      _sort = $v.sort;
      _ep = $v.ep;
      _airdate = $v.airdate;
      _comment = $v.comment;
      _duration = $v.duration;
      _desc = $v.desc;
      _disc = $v.disc;
      _durationSeconds = $v.durationSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Episode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Episode;
  }

  @override
  void update(void Function(EpisodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Episode build() => _build();

  _$Episode _build() {
    final _$result = _$v ??
        new _$Episode._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Episode', 'id'),
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'Episode', 'type'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Episode', 'name'),
            nameCn: BuiltValueNullFieldError.checkNotNull(
                nameCn, r'Episode', 'nameCn'),
            sort:
                BuiltValueNullFieldError.checkNotNull(sort, r'Episode', 'sort'),
            ep: ep,
            airdate: BuiltValueNullFieldError.checkNotNull(
                airdate, r'Episode', 'airdate'),
            comment: BuiltValueNullFieldError.checkNotNull(
                comment, r'Episode', 'comment'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'Episode', 'duration'),
            desc:
                BuiltValueNullFieldError.checkNotNull(desc, r'Episode', 'desc'),
            disc:
                BuiltValueNullFieldError.checkNotNull(disc, r'Episode', 'disc'),
            durationSeconds: durationSeconds);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
