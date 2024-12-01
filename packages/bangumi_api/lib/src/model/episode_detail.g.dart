// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EpisodeDetail extends EpisodeDetail {
  @override
  final int id;
  @override
  final EpType type;
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
  final int subjectId;

  factory _$EpisodeDetail([void Function(EpisodeDetailBuilder)? updates]) =>
      (new EpisodeDetailBuilder()..update(updates))._build();

  _$EpisodeDetail._(
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
      required this.subjectId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EpisodeDetail', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'EpisodeDetail', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'EpisodeDetail', 'name');
    BuiltValueNullFieldError.checkNotNull(nameCn, r'EpisodeDetail', 'nameCn');
    BuiltValueNullFieldError.checkNotNull(sort, r'EpisodeDetail', 'sort');
    BuiltValueNullFieldError.checkNotNull(airdate, r'EpisodeDetail', 'airdate');
    BuiltValueNullFieldError.checkNotNull(comment, r'EpisodeDetail', 'comment');
    BuiltValueNullFieldError.checkNotNull(
        duration, r'EpisodeDetail', 'duration');
    BuiltValueNullFieldError.checkNotNull(desc, r'EpisodeDetail', 'desc');
    BuiltValueNullFieldError.checkNotNull(disc, r'EpisodeDetail', 'disc');
    BuiltValueNullFieldError.checkNotNull(
        subjectId, r'EpisodeDetail', 'subjectId');
  }

  @override
  EpisodeDetail rebuild(void Function(EpisodeDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodeDetailBuilder toBuilder() => new EpisodeDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EpisodeDetail &&
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
        subjectId == other.subjectId;
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
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EpisodeDetail')
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
          ..add('subjectId', subjectId))
        .toString();
  }
}

class EpisodeDetailBuilder
    implements Builder<EpisodeDetail, EpisodeDetailBuilder> {
  _$EpisodeDetail? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  EpType? _type;
  EpType? get type => _$this._type;
  set type(EpType? type) => _$this._type = type;

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

  int? _subjectId;
  int? get subjectId => _$this._subjectId;
  set subjectId(int? subjectId) => _$this._subjectId = subjectId;

  EpisodeDetailBuilder() {
    EpisodeDetail._defaults(this);
  }

  EpisodeDetailBuilder get _$this {
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
      _subjectId = $v.subjectId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EpisodeDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EpisodeDetail;
  }

  @override
  void update(void Function(EpisodeDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EpisodeDetail build() => _build();

  _$EpisodeDetail _build() {
    final _$result = _$v ??
        new _$EpisodeDetail._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'EpisodeDetail', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'EpisodeDetail', 'type'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'EpisodeDetail', 'name'),
            nameCn: BuiltValueNullFieldError.checkNotNull(
                nameCn, r'EpisodeDetail', 'nameCn'),
            sort: BuiltValueNullFieldError.checkNotNull(
                sort, r'EpisodeDetail', 'sort'),
            ep: ep,
            airdate: BuiltValueNullFieldError.checkNotNull(
                airdate, r'EpisodeDetail', 'airdate'),
            comment: BuiltValueNullFieldError.checkNotNull(
                comment, r'EpisodeDetail', 'comment'),
            duration: BuiltValueNullFieldError.checkNotNull(
                duration, r'EpisodeDetail', 'duration'),
            desc: BuiltValueNullFieldError.checkNotNull(
                desc, r'EpisodeDetail', 'desc'),
            disc: BuiltValueNullFieldError.checkNotNull(
                disc, r'EpisodeDetail', 'disc'),
            subjectId: BuiltValueNullFieldError.checkNotNull(
                subjectId, r'EpisodeDetail', 'subjectId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
