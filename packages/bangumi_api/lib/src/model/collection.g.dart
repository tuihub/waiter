// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Collection extends Collection {
  @override
  final int wish;
  @override
  final int collect;
  @override
  final int doing;
  @override
  final int onHold;
  @override
  final int dropped;

  factory _$Collection([void Function(CollectionBuilder)? updates]) =>
      (new CollectionBuilder()..update(updates))._build();

  _$Collection._(
      {required this.wish,
      required this.collect,
      required this.doing,
      required this.onHold,
      required this.dropped})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(wish, r'Collection', 'wish');
    BuiltValueNullFieldError.checkNotNull(collect, r'Collection', 'collect');
    BuiltValueNullFieldError.checkNotNull(doing, r'Collection', 'doing');
    BuiltValueNullFieldError.checkNotNull(onHold, r'Collection', 'onHold');
    BuiltValueNullFieldError.checkNotNull(dropped, r'Collection', 'dropped');
  }

  @override
  Collection rebuild(void Function(CollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionBuilder toBuilder() => new CollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collection &&
        wish == other.wish &&
        collect == other.collect &&
        doing == other.doing &&
        onHold == other.onHold &&
        dropped == other.dropped;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, wish.hashCode);
    _$hash = $jc(_$hash, collect.hashCode);
    _$hash = $jc(_$hash, doing.hashCode);
    _$hash = $jc(_$hash, onHold.hashCode);
    _$hash = $jc(_$hash, dropped.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Collection')
          ..add('wish', wish)
          ..add('collect', collect)
          ..add('doing', doing)
          ..add('onHold', onHold)
          ..add('dropped', dropped))
        .toString();
  }
}

class CollectionBuilder implements Builder<Collection, CollectionBuilder> {
  _$Collection? _$v;

  int? _wish;
  int? get wish => _$this._wish;
  set wish(int? wish) => _$this._wish = wish;

  int? _collect;
  int? get collect => _$this._collect;
  set collect(int? collect) => _$this._collect = collect;

  int? _doing;
  int? get doing => _$this._doing;
  set doing(int? doing) => _$this._doing = doing;

  int? _onHold;
  int? get onHold => _$this._onHold;
  set onHold(int? onHold) => _$this._onHold = onHold;

  int? _dropped;
  int? get dropped => _$this._dropped;
  set dropped(int? dropped) => _$this._dropped = dropped;

  CollectionBuilder() {
    Collection._defaults(this);
  }

  CollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _wish = $v.wish;
      _collect = $v.collect;
      _doing = $v.doing;
      _onHold = $v.onHold;
      _dropped = $v.dropped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Collection;
  }

  @override
  void update(void Function(CollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Collection build() => _build();

  _$Collection _build() {
    final _$result = _$v ??
        new _$Collection._(
            wish: BuiltValueNullFieldError.checkNotNull(
                wish, r'Collection', 'wish'),
            collect: BuiltValueNullFieldError.checkNotNull(
                collect, r'Collection', 'collect'),
            doing: BuiltValueNullFieldError.checkNotNull(
                doing, r'Collection', 'doing'),
            onHold: BuiltValueNullFieldError.checkNotNull(
                onHold, r'Collection', 'onHold'),
            dropped: BuiltValueNullFieldError.checkNotNull(
                dropped, r'Collection', 'dropped'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
