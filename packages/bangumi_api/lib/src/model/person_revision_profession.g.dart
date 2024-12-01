// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_revision_profession.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonRevisionProfession extends PersonRevisionProfession {
  @override
  final String? producer;
  @override
  final String? mangaka;
  @override
  final String? artist;
  @override
  final String? seiyu;
  @override
  final String? writer;
  @override
  final String? illustrator;
  @override
  final String? actor;

  factory _$PersonRevisionProfession(
          [void Function(PersonRevisionProfessionBuilder)? updates]) =>
      (new PersonRevisionProfessionBuilder()..update(updates))._build();

  _$PersonRevisionProfession._(
      {this.producer,
      this.mangaka,
      this.artist,
      this.seiyu,
      this.writer,
      this.illustrator,
      this.actor})
      : super._();

  @override
  PersonRevisionProfession rebuild(
          void Function(PersonRevisionProfessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonRevisionProfessionBuilder toBuilder() =>
      new PersonRevisionProfessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonRevisionProfession &&
        producer == other.producer &&
        mangaka == other.mangaka &&
        artist == other.artist &&
        seiyu == other.seiyu &&
        writer == other.writer &&
        illustrator == other.illustrator &&
        actor == other.actor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, producer.hashCode);
    _$hash = $jc(_$hash, mangaka.hashCode);
    _$hash = $jc(_$hash, artist.hashCode);
    _$hash = $jc(_$hash, seiyu.hashCode);
    _$hash = $jc(_$hash, writer.hashCode);
    _$hash = $jc(_$hash, illustrator.hashCode);
    _$hash = $jc(_$hash, actor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonRevisionProfession')
          ..add('producer', producer)
          ..add('mangaka', mangaka)
          ..add('artist', artist)
          ..add('seiyu', seiyu)
          ..add('writer', writer)
          ..add('illustrator', illustrator)
          ..add('actor', actor))
        .toString();
  }
}

class PersonRevisionProfessionBuilder
    implements
        Builder<PersonRevisionProfession, PersonRevisionProfessionBuilder> {
  _$PersonRevisionProfession? _$v;

  String? _producer;
  String? get producer => _$this._producer;
  set producer(String? producer) => _$this._producer = producer;

  String? _mangaka;
  String? get mangaka => _$this._mangaka;
  set mangaka(String? mangaka) => _$this._mangaka = mangaka;

  String? _artist;
  String? get artist => _$this._artist;
  set artist(String? artist) => _$this._artist = artist;

  String? _seiyu;
  String? get seiyu => _$this._seiyu;
  set seiyu(String? seiyu) => _$this._seiyu = seiyu;

  String? _writer;
  String? get writer => _$this._writer;
  set writer(String? writer) => _$this._writer = writer;

  String? _illustrator;
  String? get illustrator => _$this._illustrator;
  set illustrator(String? illustrator) => _$this._illustrator = illustrator;

  String? _actor;
  String? get actor => _$this._actor;
  set actor(String? actor) => _$this._actor = actor;

  PersonRevisionProfessionBuilder() {
    PersonRevisionProfession._defaults(this);
  }

  PersonRevisionProfessionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _producer = $v.producer;
      _mangaka = $v.mangaka;
      _artist = $v.artist;
      _seiyu = $v.seiyu;
      _writer = $v.writer;
      _illustrator = $v.illustrator;
      _actor = $v.actor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonRevisionProfession other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonRevisionProfession;
  }

  @override
  void update(void Function(PersonRevisionProfessionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonRevisionProfession build() => _build();

  _$PersonRevisionProfession _build() {
    final _$result = _$v ??
        new _$PersonRevisionProfession._(
            producer: producer,
            mangaka: mangaka,
            artist: artist,
            seiyu: seiyu,
            writer: writer,
            illustrator: illustrator,
            actor: actor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
