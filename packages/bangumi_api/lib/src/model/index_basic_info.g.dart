// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_basic_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndexBasicInfo extends IndexBasicInfo {
  @override
  final String? title;
  @override
  final String? description;

  factory _$IndexBasicInfo([void Function(IndexBasicInfoBuilder)? updates]) =>
      (new IndexBasicInfoBuilder()..update(updates))._build();

  _$IndexBasicInfo._({this.title, this.description}) : super._();

  @override
  IndexBasicInfo rebuild(void Function(IndexBasicInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndexBasicInfoBuilder toBuilder() =>
      new IndexBasicInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndexBasicInfo &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndexBasicInfo')
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class IndexBasicInfoBuilder
    implements Builder<IndexBasicInfo, IndexBasicInfoBuilder> {
  _$IndexBasicInfo? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  IndexBasicInfoBuilder() {
    IndexBasicInfo._defaults(this);
  }

  IndexBasicInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndexBasicInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndexBasicInfo;
  }

  @override
  void update(void Function(IndexBasicInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndexBasicInfo build() => _build();

  _$IndexBasicInfo _build() {
    final _$result =
        _$v ?? new _$IndexBasicInfo._(title: title, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
