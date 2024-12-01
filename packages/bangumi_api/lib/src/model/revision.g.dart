// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class RevisionBuilder {
  void replace(Revision other);
  void update(void Function(RevisionBuilder) updates);
  int? get id;
  set id(int? id);

  int? get type;
  set type(int? type);

  CreatorBuilder get creator;
  set creator(CreatorBuilder? creator);

  String? get summary;
  set summary(String? summary);

  DateTime? get createdAt;
  set createdAt(DateTime? createdAt);
}

class _$$Revision extends $Revision {
  @override
  final int id;
  @override
  final int type;
  @override
  final Creator? creator;
  @override
  final String summary;
  @override
  final DateTime createdAt;

  factory _$$Revision([void Function($RevisionBuilder)? updates]) =>
      (new $RevisionBuilder()..update(updates))._build();

  _$$Revision._(
      {required this.id,
      required this.type,
      this.creator,
      required this.summary,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'$Revision', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'$Revision', 'type');
    BuiltValueNullFieldError.checkNotNull(summary, r'$Revision', 'summary');
    BuiltValueNullFieldError.checkNotNull(createdAt, r'$Revision', 'createdAt');
  }

  @override
  $Revision rebuild(void Function($RevisionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $RevisionBuilder toBuilder() => new $RevisionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $Revision &&
        id == other.id &&
        type == other.type &&
        creator == other.creator &&
        summary == other.summary &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, creator.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$Revision')
          ..add('id', id)
          ..add('type', type)
          ..add('creator', creator)
          ..add('summary', summary)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class $RevisionBuilder
    implements Builder<$Revision, $RevisionBuilder>, RevisionBuilder {
  _$$Revision? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(covariant int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(covariant int? type) => _$this._type = type;

  CreatorBuilder? _creator;
  CreatorBuilder get creator => _$this._creator ??= new CreatorBuilder();
  set creator(covariant CreatorBuilder? creator) => _$this._creator = creator;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(covariant String? summary) => _$this._summary = summary;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  $RevisionBuilder() {
    $Revision._defaults(this);
  }

  $RevisionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _creator = $v.creator?.toBuilder();
      _summary = $v.summary;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $Revision other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$Revision;
  }

  @override
  void update(void Function($RevisionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $Revision build() => _build();

  _$$Revision _build() {
    _$$Revision _$result;
    try {
      _$result = _$v ??
          new _$$Revision._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'$Revision', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'$Revision', 'type'),
              creator: _creator?.build(),
              summary: BuiltValueNullFieldError.checkNotNull(
                  summary, r'$Revision', 'summary'),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, r'$Revision', 'createdAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'creator';
        _creator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$Revision', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
