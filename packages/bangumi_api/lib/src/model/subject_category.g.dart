// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubjectCategory extends SubjectCategory {
  @override
  final AnyOf anyOf;

  factory _$SubjectCategory([void Function(SubjectCategoryBuilder)? updates]) =>
      (new SubjectCategoryBuilder()..update(updates))._build();

  _$SubjectCategory._({required this.anyOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anyOf, r'SubjectCategory', 'anyOf');
  }

  @override
  SubjectCategory rebuild(void Function(SubjectCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectCategoryBuilder toBuilder() =>
      new SubjectCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubjectCategory && anyOf == other.anyOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubjectCategory')
          ..add('anyOf', anyOf))
        .toString();
  }
}

class SubjectCategoryBuilder
    implements Builder<SubjectCategory, SubjectCategoryBuilder> {
  _$SubjectCategory? _$v;

  AnyOf? _anyOf;
  AnyOf? get anyOf => _$this._anyOf;
  set anyOf(AnyOf? anyOf) => _$this._anyOf = anyOf;

  SubjectCategoryBuilder() {
    SubjectCategory._defaults(this);
  }

  SubjectCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anyOf = $v.anyOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubjectCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubjectCategory;
  }

  @override
  void update(void Function(SubjectCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubjectCategory build() => _build();

  _$SubjectCategory _build() {
    final _$result = _$v ??
        new _$SubjectCategory._(
            anyOf: BuiltValueNullFieldError.checkNotNull(
                anyOf, r'SubjectCategory', 'anyOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
