// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subject_collection_modify_payload.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserSubjectCollectionModifyPayload
    extends UserSubjectCollectionModifyPayload {
  @override
  final SubjectCollectionType? type;
  @override
  final int? rate;
  @override
  final int? epStatus;
  @override
  final int? volStatus;
  @override
  final String? comment;
  @override
  final bool? private;
  @override
  final BuiltList<String>? tags;

  factory _$UserSubjectCollectionModifyPayload(
          [void Function(UserSubjectCollectionModifyPayloadBuilder)?
              updates]) =>
      (new UserSubjectCollectionModifyPayloadBuilder()..update(updates))
          ._build();

  _$UserSubjectCollectionModifyPayload._(
      {this.type,
      this.rate,
      this.epStatus,
      this.volStatus,
      this.comment,
      this.private,
      this.tags})
      : super._();

  @override
  UserSubjectCollectionModifyPayload rebuild(
          void Function(UserSubjectCollectionModifyPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSubjectCollectionModifyPayloadBuilder toBuilder() =>
      new UserSubjectCollectionModifyPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSubjectCollectionModifyPayload &&
        type == other.type &&
        rate == other.rate &&
        epStatus == other.epStatus &&
        volStatus == other.volStatus &&
        comment == other.comment &&
        private == other.private &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, epStatus.hashCode);
    _$hash = $jc(_$hash, volStatus.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, private.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserSubjectCollectionModifyPayload')
          ..add('type', type)
          ..add('rate', rate)
          ..add('epStatus', epStatus)
          ..add('volStatus', volStatus)
          ..add('comment', comment)
          ..add('private', private)
          ..add('tags', tags))
        .toString();
  }
}

class UserSubjectCollectionModifyPayloadBuilder
    implements
        Builder<UserSubjectCollectionModifyPayload,
            UserSubjectCollectionModifyPayloadBuilder> {
  _$UserSubjectCollectionModifyPayload? _$v;

  SubjectCollectionType? _type;
  SubjectCollectionType? get type => _$this._type;
  set type(SubjectCollectionType? type) => _$this._type = type;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  int? _epStatus;
  int? get epStatus => _$this._epStatus;
  set epStatus(int? epStatus) => _$this._epStatus = epStatus;

  int? _volStatus;
  int? get volStatus => _$this._volStatus;
  set volStatus(int? volStatus) => _$this._volStatus = volStatus;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  bool? _private;
  bool? get private => _$this._private;
  set private(bool? private) => _$this._private = private;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  UserSubjectCollectionModifyPayloadBuilder() {
    UserSubjectCollectionModifyPayload._defaults(this);
  }

  UserSubjectCollectionModifyPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _rate = $v.rate;
      _epStatus = $v.epStatus;
      _volStatus = $v.volStatus;
      _comment = $v.comment;
      _private = $v.private;
      _tags = $v.tags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSubjectCollectionModifyPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserSubjectCollectionModifyPayload;
  }

  @override
  void update(
      void Function(UserSubjectCollectionModifyPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserSubjectCollectionModifyPayload build() => _build();

  _$UserSubjectCollectionModifyPayload _build() {
    _$UserSubjectCollectionModifyPayload _$result;
    try {
      _$result = _$v ??
          new _$UserSubjectCollectionModifyPayload._(
              type: type,
              rate: rate,
              epStatus: epStatus,
              volStatus: volStatus,
              comment: comment,
              private: private,
              tags: _tags?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserSubjectCollectionModifyPayload', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
