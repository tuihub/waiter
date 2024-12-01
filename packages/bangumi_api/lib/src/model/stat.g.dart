// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Stat extends Stat {
  @override
  final int comments;
  @override
  final int collects;

  factory _$Stat([void Function(StatBuilder)? updates]) =>
      (new StatBuilder()..update(updates))._build();

  _$Stat._({required this.comments, required this.collects}) : super._() {
    BuiltValueNullFieldError.checkNotNull(comments, r'Stat', 'comments');
    BuiltValueNullFieldError.checkNotNull(collects, r'Stat', 'collects');
  }

  @override
  Stat rebuild(void Function(StatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatBuilder toBuilder() => new StatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stat &&
        comments == other.comments &&
        collects == other.collects;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, collects.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Stat')
          ..add('comments', comments)
          ..add('collects', collects))
        .toString();
  }
}

class StatBuilder implements Builder<Stat, StatBuilder> {
  _$Stat? _$v;

  int? _comments;
  int? get comments => _$this._comments;
  set comments(int? comments) => _$this._comments = comments;

  int? _collects;
  int? get collects => _$this._collects;
  set collects(int? collects) => _$this._collects = collects;

  StatBuilder() {
    Stat._defaults(this);
  }

  StatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comments = $v.comments;
      _collects = $v.collects;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Stat;
  }

  @override
  void update(void Function(StatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Stat build() => _build();

  _$Stat _build() {
    final _$result = _$v ??
        new _$Stat._(
            comments: BuiltValueNullFieldError.checkNotNull(
                comments, r'Stat', 'comments'),
            collects: BuiltValueNullFieldError.checkNotNull(
                collects, r'Stat', 'collects'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
