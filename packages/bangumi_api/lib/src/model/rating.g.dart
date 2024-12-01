// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Rating extends Rating {
  @override
  final int rank;
  @override
  final int total;
  @override
  final Count count;
  @override
  final num score;

  factory _$Rating([void Function(RatingBuilder)? updates]) =>
      (new RatingBuilder()..update(updates))._build();

  _$Rating._(
      {required this.rank,
      required this.total,
      required this.count,
      required this.score})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(rank, r'Rating', 'rank');
    BuiltValueNullFieldError.checkNotNull(total, r'Rating', 'total');
    BuiltValueNullFieldError.checkNotNull(count, r'Rating', 'count');
    BuiltValueNullFieldError.checkNotNull(score, r'Rating', 'score');
  }

  @override
  Rating rebuild(void Function(RatingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingBuilder toBuilder() => new RatingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Rating &&
        rank == other.rank &&
        total == other.total &&
        count == other.count &&
        score == other.score;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rank.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, score.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Rating')
          ..add('rank', rank)
          ..add('total', total)
          ..add('count', count)
          ..add('score', score))
        .toString();
  }
}

class RatingBuilder implements Builder<Rating, RatingBuilder> {
  _$Rating? _$v;

  int? _rank;
  int? get rank => _$this._rank;
  set rank(int? rank) => _$this._rank = rank;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CountBuilder? _count;
  CountBuilder get count => _$this._count ??= new CountBuilder();
  set count(CountBuilder? count) => _$this._count = count;

  num? _score;
  num? get score => _$this._score;
  set score(num? score) => _$this._score = score;

  RatingBuilder() {
    Rating._defaults(this);
  }

  RatingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rank = $v.rank;
      _total = $v.total;
      _count = $v.count.toBuilder();
      _score = $v.score;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Rating other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Rating;
  }

  @override
  void update(void Function(RatingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Rating build() => _build();

  _$Rating _build() {
    _$Rating _$result;
    try {
      _$result = _$v ??
          new _$Rating._(
              rank: BuiltValueNullFieldError.checkNotNull(
                  rank, r'Rating', 'rank'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'Rating', 'total'),
              count: count.build(),
              score: BuiltValueNullFieldError.checkNotNull(
                  score, r'Rating', 'score'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'count';
        count.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Rating', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
