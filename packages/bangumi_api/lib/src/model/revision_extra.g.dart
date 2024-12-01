// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_extra.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RevisionExtra extends RevisionExtra {
  @override
  final String? img;

  factory _$RevisionExtra([void Function(RevisionExtraBuilder)? updates]) =>
      (new RevisionExtraBuilder()..update(updates))._build();

  _$RevisionExtra._({this.img}) : super._();

  @override
  RevisionExtra rebuild(void Function(RevisionExtraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RevisionExtraBuilder toBuilder() => new RevisionExtraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RevisionExtra && img == other.img;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, img.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RevisionExtra')..add('img', img))
        .toString();
  }
}

class RevisionExtraBuilder
    implements Builder<RevisionExtra, RevisionExtraBuilder> {
  _$RevisionExtra? _$v;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  RevisionExtraBuilder() {
    RevisionExtra._defaults(this);
  }

  RevisionExtraBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _img = $v.img;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RevisionExtra other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RevisionExtra;
  }

  @override
  void update(void Function(RevisionExtraBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RevisionExtra build() => _build();

  _$RevisionExtra _build() {
    final _$result = _$v ?? new _$RevisionExtra._(img: img);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
