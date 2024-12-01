// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_revision_data_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PersonRevisionDataItem extends PersonRevisionDataItem {
  @override
  final String prsnInfobox;
  @override
  final String prsnSummary;
  @override
  final PersonRevisionProfession profession;
  @override
  final RevisionExtra extra;
  @override
  final String prsnName;

  factory _$PersonRevisionDataItem(
          [void Function(PersonRevisionDataItemBuilder)? updates]) =>
      (new PersonRevisionDataItemBuilder()..update(updates))._build();

  _$PersonRevisionDataItem._(
      {required this.prsnInfobox,
      required this.prsnSummary,
      required this.profession,
      required this.extra,
      required this.prsnName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        prsnInfobox, r'PersonRevisionDataItem', 'prsnInfobox');
    BuiltValueNullFieldError.checkNotNull(
        prsnSummary, r'PersonRevisionDataItem', 'prsnSummary');
    BuiltValueNullFieldError.checkNotNull(
        profession, r'PersonRevisionDataItem', 'profession');
    BuiltValueNullFieldError.checkNotNull(
        extra, r'PersonRevisionDataItem', 'extra');
    BuiltValueNullFieldError.checkNotNull(
        prsnName, r'PersonRevisionDataItem', 'prsnName');
  }

  @override
  PersonRevisionDataItem rebuild(
          void Function(PersonRevisionDataItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonRevisionDataItemBuilder toBuilder() =>
      new PersonRevisionDataItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PersonRevisionDataItem &&
        prsnInfobox == other.prsnInfobox &&
        prsnSummary == other.prsnSummary &&
        profession == other.profession &&
        extra == other.extra &&
        prsnName == other.prsnName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, prsnInfobox.hashCode);
    _$hash = $jc(_$hash, prsnSummary.hashCode);
    _$hash = $jc(_$hash, profession.hashCode);
    _$hash = $jc(_$hash, extra.hashCode);
    _$hash = $jc(_$hash, prsnName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PersonRevisionDataItem')
          ..add('prsnInfobox', prsnInfobox)
          ..add('prsnSummary', prsnSummary)
          ..add('profession', profession)
          ..add('extra', extra)
          ..add('prsnName', prsnName))
        .toString();
  }
}

class PersonRevisionDataItemBuilder
    implements Builder<PersonRevisionDataItem, PersonRevisionDataItemBuilder> {
  _$PersonRevisionDataItem? _$v;

  String? _prsnInfobox;
  String? get prsnInfobox => _$this._prsnInfobox;
  set prsnInfobox(String? prsnInfobox) => _$this._prsnInfobox = prsnInfobox;

  String? _prsnSummary;
  String? get prsnSummary => _$this._prsnSummary;
  set prsnSummary(String? prsnSummary) => _$this._prsnSummary = prsnSummary;

  PersonRevisionProfessionBuilder? _profession;
  PersonRevisionProfessionBuilder get profession =>
      _$this._profession ??= new PersonRevisionProfessionBuilder();
  set profession(PersonRevisionProfessionBuilder? profession) =>
      _$this._profession = profession;

  RevisionExtraBuilder? _extra;
  RevisionExtraBuilder get extra =>
      _$this._extra ??= new RevisionExtraBuilder();
  set extra(RevisionExtraBuilder? extra) => _$this._extra = extra;

  String? _prsnName;
  String? get prsnName => _$this._prsnName;
  set prsnName(String? prsnName) => _$this._prsnName = prsnName;

  PersonRevisionDataItemBuilder() {
    PersonRevisionDataItem._defaults(this);
  }

  PersonRevisionDataItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prsnInfobox = $v.prsnInfobox;
      _prsnSummary = $v.prsnSummary;
      _profession = $v.profession.toBuilder();
      _extra = $v.extra.toBuilder();
      _prsnName = $v.prsnName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonRevisionDataItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PersonRevisionDataItem;
  }

  @override
  void update(void Function(PersonRevisionDataItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PersonRevisionDataItem build() => _build();

  _$PersonRevisionDataItem _build() {
    _$PersonRevisionDataItem _$result;
    try {
      _$result = _$v ??
          new _$PersonRevisionDataItem._(
              prsnInfobox: BuiltValueNullFieldError.checkNotNull(
                  prsnInfobox, r'PersonRevisionDataItem', 'prsnInfobox'),
              prsnSummary: BuiltValueNullFieldError.checkNotNull(
                  prsnSummary, r'PersonRevisionDataItem', 'prsnSummary'),
              profession: profession.build(),
              extra: extra.build(),
              prsnName: BuiltValueNullFieldError.checkNotNull(
                  prsnName, r'PersonRevisionDataItem', 'prsnName'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'profession';
        profession.build();
        _$failedField = 'extra';
        extra.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PersonRevisionDataItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
