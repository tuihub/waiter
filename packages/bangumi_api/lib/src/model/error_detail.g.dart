// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ErrorDetail extends ErrorDetail {
  @override
  final String title;
  @override
  final String description;
  @override
  final Detail? details;

  factory _$ErrorDetail([void Function(ErrorDetailBuilder)? updates]) =>
      (new ErrorDetailBuilder()..update(updates))._build();

  _$ErrorDetail._(
      {required this.title, required this.description, this.details})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'ErrorDetail', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ErrorDetail', 'description');
  }

  @override
  ErrorDetail rebuild(void Function(ErrorDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorDetailBuilder toBuilder() => new ErrorDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorDetail &&
        title == other.title &&
        description == other.description &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ErrorDetail')
          ..add('title', title)
          ..add('description', description)
          ..add('details', details))
        .toString();
  }
}

class ErrorDetailBuilder implements Builder<ErrorDetail, ErrorDetailBuilder> {
  _$ErrorDetail? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DetailBuilder? _details;
  DetailBuilder get details => _$this._details ??= new DetailBuilder();
  set details(DetailBuilder? details) => _$this._details = details;

  ErrorDetailBuilder() {
    ErrorDetail._defaults(this);
  }

  ErrorDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _details = $v.details?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ErrorDetail;
  }

  @override
  void update(void Function(ErrorDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ErrorDetail build() => _build();

  _$ErrorDetail _build() {
    _$ErrorDetail _$result;
    try {
      _$result = _$v ??
          new _$ErrorDetail._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'ErrorDetail', 'title'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'ErrorDetail', 'description'),
              details: _details?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        _details?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ErrorDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
