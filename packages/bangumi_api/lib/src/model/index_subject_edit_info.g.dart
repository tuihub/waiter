// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject_edit_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndexSubjectEditInfo extends IndexSubjectEditInfo {
  @override
  final int? sort;
  @override
  final String? comment;

  factory _$IndexSubjectEditInfo(
          [void Function(IndexSubjectEditInfoBuilder)? updates]) =>
      (new IndexSubjectEditInfoBuilder()..update(updates))._build();

  _$IndexSubjectEditInfo._({this.sort, this.comment}) : super._();

  @override
  IndexSubjectEditInfo rebuild(
          void Function(IndexSubjectEditInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndexSubjectEditInfoBuilder toBuilder() =>
      new IndexSubjectEditInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndexSubjectEditInfo &&
        sort == other.sort &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndexSubjectEditInfo')
          ..add('sort', sort)
          ..add('comment', comment))
        .toString();
  }
}

class IndexSubjectEditInfoBuilder
    implements Builder<IndexSubjectEditInfo, IndexSubjectEditInfoBuilder> {
  _$IndexSubjectEditInfo? _$v;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  IndexSubjectEditInfoBuilder() {
    IndexSubjectEditInfo._defaults(this);
  }

  IndexSubjectEditInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sort = $v.sort;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndexSubjectEditInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndexSubjectEditInfo;
  }

  @override
  void update(void Function(IndexSubjectEditInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndexSubjectEditInfo build() => _build();

  _$IndexSubjectEditInfo _build() {
    final _$result =
        _$v ?? new _$IndexSubjectEditInfo._(sort: sort, comment: comment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
