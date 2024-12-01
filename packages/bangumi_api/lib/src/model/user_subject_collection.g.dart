// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subject_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserSubjectCollection extends UserSubjectCollection {
  @override
  final int subjectId;
  @override
  final SubjectType subjectType;
  @override
  final int rate;
  @override
  final SubjectCollectionType type;
  @override
  final String? comment;
  @override
  final BuiltList<String> tags;
  @override
  final int epStatus;
  @override
  final int volStatus;
  @override
  final DateTime updatedAt;
  @override
  final bool private;
  @override
  final SlimSubject? subject;

  factory _$UserSubjectCollection(
          [void Function(UserSubjectCollectionBuilder)? updates]) =>
      (new UserSubjectCollectionBuilder()..update(updates))._build();

  _$UserSubjectCollection._(
      {required this.subjectId,
      required this.subjectType,
      required this.rate,
      required this.type,
      this.comment,
      required this.tags,
      required this.epStatus,
      required this.volStatus,
      required this.updatedAt,
      required this.private,
      this.subject})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        subjectId, r'UserSubjectCollection', 'subjectId');
    BuiltValueNullFieldError.checkNotNull(
        subjectType, r'UserSubjectCollection', 'subjectType');
    BuiltValueNullFieldError.checkNotNull(
        rate, r'UserSubjectCollection', 'rate');
    BuiltValueNullFieldError.checkNotNull(
        type, r'UserSubjectCollection', 'type');
    BuiltValueNullFieldError.checkNotNull(
        tags, r'UserSubjectCollection', 'tags');
    BuiltValueNullFieldError.checkNotNull(
        epStatus, r'UserSubjectCollection', 'epStatus');
    BuiltValueNullFieldError.checkNotNull(
        volStatus, r'UserSubjectCollection', 'volStatus');
    BuiltValueNullFieldError.checkNotNull(
        updatedAt, r'UserSubjectCollection', 'updatedAt');
    BuiltValueNullFieldError.checkNotNull(
        private, r'UserSubjectCollection', 'private');
  }

  @override
  UserSubjectCollection rebuild(
          void Function(UserSubjectCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSubjectCollectionBuilder toBuilder() =>
      new UserSubjectCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSubjectCollection &&
        subjectId == other.subjectId &&
        subjectType == other.subjectType &&
        rate == other.rate &&
        type == other.type &&
        comment == other.comment &&
        tags == other.tags &&
        epStatus == other.epStatus &&
        volStatus == other.volStatus &&
        updatedAt == other.updatedAt &&
        private == other.private &&
        subject == other.subject;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subjectId.hashCode);
    _$hash = $jc(_$hash, subjectType.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, epStatus.hashCode);
    _$hash = $jc(_$hash, volStatus.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, private.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSubjectCollection')
          ..add('subjectId', subjectId)
          ..add('subjectType', subjectType)
          ..add('rate', rate)
          ..add('type', type)
          ..add('comment', comment)
          ..add('tags', tags)
          ..add('epStatus', epStatus)
          ..add('volStatus', volStatus)
          ..add('updatedAt', updatedAt)
          ..add('private', private)
          ..add('subject', subject))
        .toString();
  }
}

class UserSubjectCollectionBuilder
    implements Builder<UserSubjectCollection, UserSubjectCollectionBuilder> {
  _$UserSubjectCollection? _$v;

  int? _subjectId;
  int? get subjectId => _$this._subjectId;
  set subjectId(int? subjectId) => _$this._subjectId = subjectId;

  SubjectType? _subjectType;
  SubjectType? get subjectType => _$this._subjectType;
  set subjectType(SubjectType? subjectType) =>
      _$this._subjectType = subjectType;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  SubjectCollectionType? _type;
  SubjectCollectionType? get type => _$this._type;
  set type(SubjectCollectionType? type) => _$this._type = type;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  int? _epStatus;
  int? get epStatus => _$this._epStatus;
  set epStatus(int? epStatus) => _$this._epStatus = epStatus;

  int? _volStatus;
  int? get volStatus => _$this._volStatus;
  set volStatus(int? volStatus) => _$this._volStatus = volStatus;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  bool? _private;
  bool? get private => _$this._private;
  set private(bool? private) => _$this._private = private;

  SlimSubjectBuilder? _subject;
  SlimSubjectBuilder get subject =>
      _$this._subject ??= new SlimSubjectBuilder();
  set subject(SlimSubjectBuilder? subject) => _$this._subject = subject;

  UserSubjectCollectionBuilder() {
    UserSubjectCollection._defaults(this);
  }

  UserSubjectCollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subjectId = $v.subjectId;
      _subjectType = $v.subjectType;
      _rate = $v.rate;
      _type = $v.type;
      _comment = $v.comment;
      _tags = $v.tags.toBuilder();
      _epStatus = $v.epStatus;
      _volStatus = $v.volStatus;
      _updatedAt = $v.updatedAt;
      _private = $v.private;
      _subject = $v.subject?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSubjectCollection other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSubjectCollection;
  }

  @override
  void update(void Function(UserSubjectCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSubjectCollection build() => _build();

  _$UserSubjectCollection _build() {
    _$UserSubjectCollection _$result;
    try {
      _$result = _$v ??
          new _$UserSubjectCollection._(
              subjectId: BuiltValueNullFieldError.checkNotNull(
                  subjectId, r'UserSubjectCollection', 'subjectId'),
              subjectType: BuiltValueNullFieldError.checkNotNull(
                  subjectType, r'UserSubjectCollection', 'subjectType'),
              rate: BuiltValueNullFieldError.checkNotNull(
                  rate, r'UserSubjectCollection', 'rate'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'UserSubjectCollection', 'type'),
              comment: comment,
              tags: tags.build(),
              epStatus: BuiltValueNullFieldError.checkNotNull(
                  epStatus, r'UserSubjectCollection', 'epStatus'),
              volStatus: BuiltValueNullFieldError.checkNotNull(
                  volStatus, r'UserSubjectCollection', 'volStatus'),
              updatedAt: BuiltValueNullFieldError.checkNotNull(
                  updatedAt, r'UserSubjectCollection', 'updatedAt'),
              private: BuiltValueNullFieldError.checkNotNull(
                  private, r'UserSubjectCollection', 'private'),
              subject: _subject?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();

        _$failedField = 'subject';
        _subject?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSubjectCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
