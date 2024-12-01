// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject_add_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndexSubjectAddInfo extends IndexSubjectAddInfo {
  @override
  final int? subjectId;
  @override
  final int? sort;
  @override
  final String? comment;

  factory _$IndexSubjectAddInfo(
          [void Function(IndexSubjectAddInfoBuilder)? updates]) =>
      (new IndexSubjectAddInfoBuilder()..update(updates))._build();

  _$IndexSubjectAddInfo._({this.subjectId, this.sort, this.comment})
      : super._();

  @override
  IndexSubjectAddInfo rebuild(
          void Function(IndexSubjectAddInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndexSubjectAddInfoBuilder toBuilder() =>
      new IndexSubjectAddInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndexSubjectAddInfo &&
        subjectId == other.subjectId &&
        sort == other.sort &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndexSubjectAddInfo')
          ..add('subjectId', subjectId)
          ..add('sort', sort)
          ..add('comment', comment))
        .toString();
  }
}

class IndexSubjectAddInfoBuilder
    implements Builder<IndexSubjectAddInfo, IndexSubjectAddInfoBuilder> {
  _$IndexSubjectAddInfo? _$v;

  int? _subjectId;
  int? get subjectId => _$this._subjectId;
  set subjectId(int? subjectId) => _$this._subjectId = subjectId;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  IndexSubjectAddInfoBuilder() {
    IndexSubjectAddInfo._defaults(this);
  }

  IndexSubjectAddInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subjectId = $v.subjectId;
      _sort = $v.sort;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndexSubjectAddInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndexSubjectAddInfo;
  }

  @override
  void update(void Function(IndexSubjectAddInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndexSubjectAddInfo build() => _build();

  _$IndexSubjectAddInfo _build() {
    final _$result = _$v ??
        new _$IndexSubjectAddInfo._(
            subjectId: subjectId, sort: sort, comment: comment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
