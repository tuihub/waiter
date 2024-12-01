// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Index extends Index {
  @override
  final int id;
  @override
  final String title;
  @override
  final String desc;
  @override
  final int? total;
  @override
  final Stat stat;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final Creator creator;
  @override
  final bool ban;
  @override
  final bool nsfw;

  factory _$Index([void Function(IndexBuilder)? updates]) =>
      (new IndexBuilder()..update(updates))._build();

  _$Index._(
      {required this.id,
      required this.title,
      required this.desc,
      this.total,
      required this.stat,
      required this.createdAt,
      required this.updatedAt,
      required this.creator,
      required this.ban,
      required this.nsfw})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Index', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'Index', 'title');
    BuiltValueNullFieldError.checkNotNull(desc, r'Index', 'desc');
    BuiltValueNullFieldError.checkNotNull(stat, r'Index', 'stat');
    BuiltValueNullFieldError.checkNotNull(createdAt, r'Index', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(updatedAt, r'Index', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(creator, r'Index', 'creator');
    BuiltValueNullFieldError.checkNotNull(ban, r'Index', 'ban');
    BuiltValueNullFieldError.checkNotNull(nsfw, r'Index', 'nsfw');
  }

  @override
  Index rebuild(void Function(IndexBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndexBuilder toBuilder() => new IndexBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Index &&
        id == other.id &&
        title == other.title &&
        desc == other.desc &&
        total == other.total &&
        stat == other.stat &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        creator == other.creator &&
        ban == other.ban &&
        nsfw == other.nsfw;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, desc.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, stat.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, ban.hashCode);
    _$hash = $jc(_$hash, nsfw.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Index')
          ..add('id', id)
          ..add('title', title)
          ..add('desc', desc)
          ..add('total', total)
          ..add('stat', stat)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('creator', creator)
          ..add('ban', ban)
          ..add('nsfw', nsfw))
        .toString();
  }
}

class IndexBuilder implements Builder<Index, IndexBuilder> {
  _$Index? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  StatBuilder? _stat;
  StatBuilder get stat => _$this._stat ??= new StatBuilder();
  set stat(StatBuilder? stat) => _$this._stat = stat;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  CreatorBuilder? _creator;
  CreatorBuilder get creator => _$this._creator ??= new CreatorBuilder();
  set creator(CreatorBuilder? creator) => _$this._creator = creator;

  bool? _ban;
  bool? get ban => _$this._ban;
  set ban(bool? ban) => _$this._ban = ban;

  bool? _nsfw;
  bool? get nsfw => _$this._nsfw;
  set nsfw(bool? nsfw) => _$this._nsfw = nsfw;

  IndexBuilder() {
    Index._defaults(this);
  }

  IndexBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _desc = $v.desc;
      _total = $v.total;
      _stat = $v.stat.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _creator = $v.creator.toBuilder();
      _ban = $v.ban;
      _nsfw = $v.nsfw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Index other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Index;
  }

  @override
  void update(void Function(IndexBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Index build() => _build();

  _$Index _build() {
    _$Index _$result;
    try {
      _$result = _$v ??
          new _$Index._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Index', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'Index', 'title'),
              desc:
                  BuiltValueNullFieldError.checkNotNull(desc, r'Index', 'desc'),
              total: total,
              stat: stat.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'Index', 'createdAt'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(
                  updatedAt, r'Index', 'updatedAt'),
              creator: creator.build(),
              ban: BuiltValueNullFieldError.checkNotNull(ban, r'Index', 'ban'),
              nsfw: BuiltValueNullFieldError.checkNotNull(
                  nsfw, r'Index', 'nsfw'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stat';
        stat.build();

        _$failedField = 'creator';
        creator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Index', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
