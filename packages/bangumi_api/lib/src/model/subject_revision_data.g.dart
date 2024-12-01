// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_revision_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubjectRevisionData extends SubjectRevisionData {
  @override
  final int fieldEps;
  @override
  final String fieldInfobox;
  @override
  final String fieldSummary;
  @override
  final String name;
  @override
  final String nameCn;
  @override
  final int platform;
  @override
  final int subjectId;
  @override
  final int type;
  @override
  final int typeId;
  @override
  final String voteField;

  factory _$SubjectRevisionData(
          [void Function(SubjectRevisionDataBuilder)? updates]) =>
      (new SubjectRevisionDataBuilder()..update(updates))._build();

  _$SubjectRevisionData._(
      {required this.fieldEps,
      required this.fieldInfobox,
      required this.fieldSummary,
      required this.name,
      required this.nameCn,
      required this.platform,
      required this.subjectId,
      required this.type,
      required this.typeId,
      required this.voteField})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fieldEps, r'SubjectRevisionData', 'fieldEps');
    BuiltValueNullFieldError.checkNotNull(
        fieldInfobox, r'SubjectRevisionData', 'fieldInfobox');
    BuiltValueNullFieldError.checkNotNull(
        fieldSummary, r'SubjectRevisionData', 'fieldSummary');
    BuiltValueNullFieldError.checkNotNull(name, r'SubjectRevisionData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        nameCn, r'SubjectRevisionData', 'nameCn');
    BuiltValueNullFieldError.checkNotNull(
        platform, r'SubjectRevisionData', 'platform');
    BuiltValueNullFieldError.checkNotNull(
        subjectId, r'SubjectRevisionData', 'subjectId');
    BuiltValueNullFieldError.checkNotNull(type, r'SubjectRevisionData', 'type');
    BuiltValueNullFieldError.checkNotNull(
        typeId, r'SubjectRevisionData', 'typeId');
    BuiltValueNullFieldError.checkNotNull(
        voteField, r'SubjectRevisionData', 'voteField');
  }

  @override
  SubjectRevisionData rebuild(
          void Function(SubjectRevisionDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubjectRevisionDataBuilder toBuilder() =>
      new SubjectRevisionDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubjectRevisionData &&
        fieldEps == other.fieldEps &&
        fieldInfobox == other.fieldInfobox &&
        fieldSummary == other.fieldSummary &&
        name == other.name &&
        nameCn == other.nameCn &&
        platform == other.platform &&
        subjectId == other.subjectId &&
        type == other.type &&
        typeId == other.typeId &&
        voteField == other.voteField;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fieldEps.hashCode);
    _$hash = $jc(_$hash, fieldInfobox.hashCode);
    _$hash = $jc(_$hash, fieldSummary.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameCn.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, typeId.hashCode);
    _$hash = $jc(_$hash, voteField.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubjectRevisionData')
          ..add('fieldEps', fieldEps)
          ..add('fieldInfobox', fieldInfobox)
          ..add('fieldSummary', fieldSummary)
          ..add('name', name)
          ..add('nameCn', nameCn)
          ..add('platform', platform)
          ..add('subjectId', subjectId)
          ..add('type', type)
          ..add('typeId', typeId)
          ..add('voteField', voteField))
        .toString();
  }
}

class SubjectRevisionDataBuilder
    implements Builder<SubjectRevisionData, SubjectRevisionDataBuilder> {
  _$SubjectRevisionData? _$v;

  int? _fieldEps;
  int? get fieldEps => _$this._fieldEps;
  set fieldEps(int? fieldEps) => _$this._fieldEps = fieldEps;

  String? _fieldInfobox;
  String? get fieldInfobox => _$this._fieldInfobox;
  set fieldInfobox(String? fieldInfobox) => _$this._fieldInfobox = fieldInfobox;

  String? _fieldSummary;
  String? get fieldSummary => _$this._fieldSummary;
  set fieldSummary(String? fieldSummary) => _$this._fieldSummary = fieldSummary;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameCn;
  String? get nameCn => _$this._nameCn;
  set nameCn(String? nameCn) => _$this._nameCn = nameCn;

  int? _platform;
  int? get platform => _$this._platform;
  set platform(int? platform) => _$this._platform = platform;

  int? _subjectId;
  int? get subjectId => _$this._subjectId;
  set subjectId(int? subjectId) => _$this._subjectId = subjectId;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  int? _typeId;
  int? get typeId => _$this._typeId;
  set typeId(int? typeId) => _$this._typeId = typeId;

  String? _voteField;
  String? get voteField => _$this._voteField;
  set voteField(String? voteField) => _$this._voteField = voteField;

  SubjectRevisionDataBuilder() {
    SubjectRevisionData._defaults(this);
  }

  SubjectRevisionDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fieldEps = $v.fieldEps;
      _fieldInfobox = $v.fieldInfobox;
      _fieldSummary = $v.fieldSummary;
      _name = $v.name;
      _nameCn = $v.nameCn;
      _platform = $v.platform;
      _subjectId = $v.subjectId;
      _type = $v.type;
      _typeId = $v.typeId;
      _voteField = $v.voteField;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubjectRevisionData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubjectRevisionData;
  }

  @override
  void update(void Function(SubjectRevisionDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubjectRevisionData build() => _build();

  _$SubjectRevisionData _build() {
    final _$result = _$v ??
        new _$SubjectRevisionData._(
            fieldEps: BuiltValueNullFieldError.checkNotNull(
                fieldEps, r'SubjectRevisionData', 'fieldEps'),
            fieldInfobox: BuiltValueNullFieldError.checkNotNull(
                fieldInfobox, r'SubjectRevisionData', 'fieldInfobox'),
            fieldSummary: BuiltValueNullFieldError.checkNotNull(
                fieldSummary, r'SubjectRevisionData', 'fieldSummary'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SubjectRevisionData', 'name'),
            nameCn: BuiltValueNullFieldError.checkNotNull(
                nameCn, r'SubjectRevisionData', 'nameCn'),
            platform: BuiltValueNullFieldError.checkNotNull(
                platform, r'SubjectRevisionData', 'platform'),
            subjectId: BuiltValueNullFieldError.checkNotNull(
                subjectId, r'SubjectRevisionData', 'subjectId'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'SubjectRevisionData', 'type'),
            typeId:
                BuiltValueNullFieldError.checkNotNull(typeId, r'SubjectRevisionData', 'typeId'),
            voteField: BuiltValueNullFieldError.checkNotNull(voteField, r'SubjectRevisionData', 'voteField'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
