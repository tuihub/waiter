// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_subject.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IndexSubject extends IndexSubject {
  @override
  final int id;
  @override
  final int type;
  @override
  final String name;
  @override
  final Images? images;
  @override
  final BuiltList<Item>? infobox;
  @override
  final String? date;
  @override
  final String comment;
  @override
  final DateTime addedAt;

  factory _$IndexSubject([void Function(IndexSubjectBuilder)? updates]) =>
      (new IndexSubjectBuilder()..update(updates))._build();

  _$IndexSubject._(
      {required this.id,
      required this.type,
      required this.name,
      this.images,
      this.infobox,
      this.date,
      required this.comment,
      required this.addedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'IndexSubject', 'id');
    BuiltValueNullFieldError.checkNotNull(type, r'IndexSubject', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'IndexSubject', 'name');
    BuiltValueNullFieldError.checkNotNull(comment, r'IndexSubject', 'comment');
    BuiltValueNullFieldError.checkNotNull(addedAt, r'IndexSubject', 'addedAt');
  }

  @override
  IndexSubject rebuild(void Function(IndexSubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndexSubjectBuilder toBuilder() => new IndexSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndexSubject &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        images == other.images &&
        infobox == other.infobox &&
        date == other.date &&
        comment == other.comment &&
        addedAt == other.addedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, infobox.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, addedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndexSubject')
          ..add('id', id)
          ..add('type', type)
          ..add('name', name)
          ..add('images', images)
          ..add('infobox', infobox)
          ..add('date', date)
          ..add('comment', comment)
          ..add('addedAt', addedAt))
        .toString();
  }
}

class IndexSubjectBuilder
    implements Builder<IndexSubject, IndexSubjectBuilder> {
  _$IndexSubject? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _type;
  int? get type => _$this._type;
  set type(int? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ImagesBuilder? _images;
  ImagesBuilder get images => _$this._images ??= new ImagesBuilder();
  set images(ImagesBuilder? images) => _$this._images = images;

  ListBuilder<Item>? _infobox;
  ListBuilder<Item> get infobox => _$this._infobox ??= new ListBuilder<Item>();
  set infobox(ListBuilder<Item>? infobox) => _$this._infobox = infobox;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DateTime? _addedAt;
  DateTime? get addedAt => _$this._addedAt;
  set addedAt(DateTime? addedAt) => _$this._addedAt = addedAt;

  IndexSubjectBuilder() {
    IndexSubject._defaults(this);
  }

  IndexSubjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _name = $v.name;
      _images = $v.images?.toBuilder();
      _infobox = $v.infobox?.toBuilder();
      _date = $v.date;
      _comment = $v.comment;
      _addedAt = $v.addedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndexSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndexSubject;
  }

  @override
  void update(void Function(IndexSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndexSubject build() => _build();

  _$IndexSubject _build() {
    _$IndexSubject _$result;
    try {
      _$result = _$v ??
          new _$IndexSubject._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'IndexSubject', 'id'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'IndexSubject', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'IndexSubject', 'name'),
              images: _images?.build(),
              infobox: _infobox?.build(),
              date: date,
              comment: BuiltValueNullFieldError.checkNotNull(
                  comment, r'IndexSubject', 'comment'),
              addedAt: BuiltValueNullFieldError.checkNotNull(
                  addedAt, r'IndexSubject', 'addedAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
        _$failedField = 'infobox';
        _infobox?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IndexSubject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
