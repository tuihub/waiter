// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_real_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectRealCategory _$Other = const SubjectRealCategory._('Other');
const SubjectRealCategory _$JP = const SubjectRealCategory._('JP');
const SubjectRealCategory _$EN = const SubjectRealCategory._('EN');
const SubjectRealCategory _$CN = const SubjectRealCategory._('CN');
const SubjectRealCategory _$TV = const SubjectRealCategory._('TV');
const SubjectRealCategory _$Movie = const SubjectRealCategory._('Movie');
const SubjectRealCategory _$Live = const SubjectRealCategory._('Live');
const SubjectRealCategory _$Show = const SubjectRealCategory._('Show');

SubjectRealCategory _$valueOf(String name) {
  switch (name) {
    case 'Other':
      return _$Other;
    case 'JP':
      return _$JP;
    case 'EN':
      return _$EN;
    case 'CN':
      return _$CN;
    case 'TV':
      return _$TV;
    case 'Movie':
      return _$Movie;
    case 'Live':
      return _$Live;
    case 'Show':
      return _$Show;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectRealCategory> _$values =
    new BuiltSet<SubjectRealCategory>(const <SubjectRealCategory>[
  _$Other,
  _$JP,
  _$EN,
  _$CN,
  _$TV,
  _$Movie,
  _$Live,
  _$Show,
]);

class _$SubjectRealCategoryMeta {
  const _$SubjectRealCategoryMeta();
  SubjectRealCategory get Other => _$Other;
  SubjectRealCategory get JP => _$JP;
  SubjectRealCategory get EN => _$EN;
  SubjectRealCategory get CN => _$CN;
  SubjectRealCategory get TV => _$TV;
  SubjectRealCategory get Movie => _$Movie;
  SubjectRealCategory get Live => _$Live;
  SubjectRealCategory get Show => _$Show;
  SubjectRealCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectRealCategory> get values => _$values;
}

abstract class _$SubjectRealCategoryMixin {
  // ignore: non_constant_identifier_names
  _$SubjectRealCategoryMeta get SubjectRealCategory =>
      const _$SubjectRealCategoryMeta();
}

Serializer<SubjectRealCategory> _$subjectRealCategorySerializer =
    new _$SubjectRealCategorySerializer();

class _$SubjectRealCategorySerializer
    implements PrimitiveSerializer<SubjectRealCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Other': 0,
    'JP': 1,
    'EN': 2,
    'CN': 3,
    'TV': 6001,
    'Movie': 6002,
    'Live': 6003,
    'Show': 6004,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'Other',
    1: 'JP',
    2: 'EN',
    3: 'CN',
    6001: 'TV',
    6002: 'Movie',
    6003: 'Live',
    6004: 'Show',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectRealCategory];
  @override
  final String wireName = 'SubjectRealCategory';

  @override
  Object serialize(Serializers serializers, SubjectRealCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectRealCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectRealCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
