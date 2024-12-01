// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_revision_data_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CharacterRevisionDataItem extends CharacterRevisionDataItem {
  @override
  final String infobox;
  @override
  final String summary;
  @override
  final String name;
  @override
  final RevisionExtra extra;

  factory _$CharacterRevisionDataItem(
          [void Function(CharacterRevisionDataItemBuilder)? updates]) =>
      (new CharacterRevisionDataItemBuilder()..update(updates))._build();

  _$CharacterRevisionDataItem._(
      {required this.infobox,
      required this.summary,
      required this.name,
      required this.extra})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        infobox, r'CharacterRevisionDataItem', 'infobox');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'CharacterRevisionDataItem', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        name, r'CharacterRevisionDataItem', 'name');
    BuiltValueNullFieldError.checkNotNull(
        extra, r'CharacterRevisionDataItem', 'extra');
  }

  @override
  CharacterRevisionDataItem rebuild(
          void Function(CharacterRevisionDataItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterRevisionDataItemBuilder toBuilder() =>
      new CharacterRevisionDataItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterRevisionDataItem &&
        infobox == other.infobox &&
        summary == other.summary &&
        name == other.name &&
        extra == other.extra;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, infobox.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, extra.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterRevisionDataItem')
          ..add('infobox', infobox)
          ..add('summary', summary)
          ..add('name', name)
          ..add('extra', extra))
        .toString();
  }
}

class CharacterRevisionDataItemBuilder
    implements
        Builder<CharacterRevisionDataItem, CharacterRevisionDataItemBuilder> {
  _$CharacterRevisionDataItem? _$v;

  String? _infobox;
  String? get infobox => _$this._infobox;
  set infobox(String? infobox) => _$this._infobox = infobox;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  RevisionExtraBuilder? _extra;
  RevisionExtraBuilder get extra =>
      _$this._extra ??= new RevisionExtraBuilder();
  set extra(RevisionExtraBuilder? extra) => _$this._extra = extra;

  CharacterRevisionDataItemBuilder() {
    CharacterRevisionDataItem._defaults(this);
  }

  CharacterRevisionDataItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _infobox = $v.infobox;
      _summary = $v.summary;
      _name = $v.name;
      _extra = $v.extra.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterRevisionDataItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CharacterRevisionDataItem;
  }

  @override
  void update(void Function(CharacterRevisionDataItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterRevisionDataItem build() => _build();

  _$CharacterRevisionDataItem _build() {
    _$CharacterRevisionDataItem _$result;
    try {
      _$result = _$v ??
          new _$CharacterRevisionDataItem._(
              infobox: BuiltValueNullFieldError.checkNotNull(
                  infobox, r'CharacterRevisionDataItem', 'infobox'),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'CharacterRevisionDataItem', 'summary'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'CharacterRevisionDataItem', 'name'),
              extra: extra.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'extra';
        extra.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CharacterRevisionDataItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
