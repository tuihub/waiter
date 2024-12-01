// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_images.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonImages extends PersonImages {
  @override
  final String large;
  @override
  final String medium;
  @override
  final String small;
  @override
  final String grid;

  factory _$PersonImages([void Function(PersonImagesBuilder)? updates]) =>
      (new PersonImagesBuilder()..update(updates))._build();

  _$PersonImages._(
      {required this.large,
      required this.medium,
      required this.small,
      required this.grid})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(large, r'PersonImages', 'large');
    BuiltValueNullFieldError.checkNotNull(medium, r'PersonImages', 'medium');
    BuiltValueNullFieldError.checkNotNull(small, r'PersonImages', 'small');
    BuiltValueNullFieldError.checkNotNull(grid, r'PersonImages', 'grid');
  }

  @override
  PersonImages rebuild(void Function(PersonImagesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonImagesBuilder toBuilder() => new PersonImagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonImages &&
        large == other.large &&
        medium == other.medium &&
        small == other.small &&
        grid == other.grid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, large.hashCode);
    _$hash = $jc(_$hash, medium.hashCode);
    _$hash = $jc(_$hash, small.hashCode);
    _$hash = $jc(_$hash, grid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonImages')
          ..add('large', large)
          ..add('medium', medium)
          ..add('small', small)
          ..add('grid', grid))
        .toString();
  }
}

class PersonImagesBuilder
    implements Builder<PersonImages, PersonImagesBuilder> {
  _$PersonImages? _$v;

  String? _large;
  String? get large => _$this._large;
  set large(String? large) => _$this._large = large;

  String? _medium;
  String? get medium => _$this._medium;
  set medium(String? medium) => _$this._medium = medium;

  String? _small;
  String? get small => _$this._small;
  set small(String? small) => _$this._small = small;

  String? _grid;
  String? get grid => _$this._grid;
  set grid(String? grid) => _$this._grid = grid;

  PersonImagesBuilder() {
    PersonImages._defaults(this);
  }

  PersonImagesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _large = $v.large;
      _medium = $v.medium;
      _small = $v.small;
      _grid = $v.grid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonImages other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonImages;
  }

  @override
  void update(void Function(PersonImagesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonImages build() => _build();

  _$PersonImages _build() {
    final _$result = _$v ??
        new _$PersonImages._(
            large: BuiltValueNullFieldError.checkNotNull(
                large, r'PersonImages', 'large'),
            medium: BuiltValueNullFieldError.checkNotNull(
                medium, r'PersonImages', 'medium'),
            small: BuiltValueNullFieldError.checkNotNull(
                small, r'PersonImages', 'small'),
            grid: BuiltValueNullFieldError.checkNotNull(
                grid, r'PersonImages', 'grid'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
