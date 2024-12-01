// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Images extends Images {
  @override
  final String large;
  @override
  final String common;
  @override
  final String medium;
  @override
  final String small;
  @override
  final String grid;

  factory _$Images([void Function(ImagesBuilder)? updates]) =>
      (new ImagesBuilder()..update(updates))._build();

  _$Images._(
      {required this.large,
      required this.common,
      required this.medium,
      required this.small,
      required this.grid})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(large, r'Images', 'large');
    BuiltValueNullFieldError.checkNotNull(common, r'Images', 'common');
    BuiltValueNullFieldError.checkNotNull(medium, r'Images', 'medium');
    BuiltValueNullFieldError.checkNotNull(small, r'Images', 'small');
    BuiltValueNullFieldError.checkNotNull(grid, r'Images', 'grid');
  }

  @override
  Images rebuild(void Function(ImagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImagesBuilder toBuilder() => new ImagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Images &&
        large == other.large &&
        common == other.common &&
        medium == other.medium &&
        small == other.small &&
        grid == other.grid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, large.hashCode);
    _$hash = $jc(_$hash, common.hashCode);
    _$hash = $jc(_$hash, medium.hashCode);
    _$hash = $jc(_$hash, small.hashCode);
    _$hash = $jc(_$hash, grid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Images')
          ..add('large', large)
          ..add('common', common)
          ..add('medium', medium)
          ..add('small', small)
          ..add('grid', grid))
        .toString();
  }
}

class ImagesBuilder implements Builder<Images, ImagesBuilder> {
  _$Images? _$v;

  String? _large;
  String? get large => _$this._large;
  set large(String? large) => _$this._large = large;

  String? _common;
  String? get common => _$this._common;
  set common(String? common) => _$this._common = common;

  String? _medium;
  String? get medium => _$this._medium;
  set medium(String? medium) => _$this._medium = medium;

  String? _small;
  String? get small => _$this._small;
  set small(String? small) => _$this._small = small;

  String? _grid;
  String? get grid => _$this._grid;
  set grid(String? grid) => _$this._grid = grid;

  ImagesBuilder() {
    Images._defaults(this);
  }

  ImagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _large = $v.large;
      _common = $v.common;
      _medium = $v.medium;
      _small = $v.small;
      _grid = $v.grid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Images other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Images;
  }

  @override
  void update(void Function(ImagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Images build() => _build();

  _$Images _build() {
    final _$result = _$v ??
        new _$Images._(
            large: BuiltValueNullFieldError.checkNotNull(
                large, r'Images', 'large'),
            common: BuiltValueNullFieldError.checkNotNull(
                common, r'Images', 'common'),
            medium: BuiltValueNullFieldError.checkNotNull(
                medium, r'Images', 'medium'),
            small: BuiltValueNullFieldError.checkNotNull(
                small, r'Images', 'small'),
            grid:
                BuiltValueNullFieldError.checkNotNull(grid, r'Images', 'grid'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
