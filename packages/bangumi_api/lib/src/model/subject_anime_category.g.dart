// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_anime_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectAnimeCategory _$Other = const SubjectAnimeCategory._('Other');
const SubjectAnimeCategory _$TV = const SubjectAnimeCategory._('TV');
const SubjectAnimeCategory _$OVA = const SubjectAnimeCategory._('OVA');
const SubjectAnimeCategory _$Movie = const SubjectAnimeCategory._('Movie');
const SubjectAnimeCategory _$WEB = const SubjectAnimeCategory._('WEB');

SubjectAnimeCategory _$valueOf(String name) {
  switch (name) {
    case 'Other':
      return _$Other;
    case 'TV':
      return _$TV;
    case 'OVA':
      return _$OVA;
    case 'Movie':
      return _$Movie;
    case 'WEB':
      return _$WEB;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectAnimeCategory> _$values =
    new BuiltSet<SubjectAnimeCategory>(const <SubjectAnimeCategory>[
  _$Other,
  _$TV,
  _$OVA,
  _$Movie,
  _$WEB,
]);

class _$SubjectAnimeCategoryMeta {
  const _$SubjectAnimeCategoryMeta();
  SubjectAnimeCategory get Other => _$Other;
  SubjectAnimeCategory get TV => _$TV;
  SubjectAnimeCategory get OVA => _$OVA;
  SubjectAnimeCategory get Movie => _$Movie;
  SubjectAnimeCategory get WEB => _$WEB;
  SubjectAnimeCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectAnimeCategory> get values => _$values;
}

abstract class _$SubjectAnimeCategoryMixin {
  // ignore: non_constant_identifier_names
  _$SubjectAnimeCategoryMeta get SubjectAnimeCategory =>
      const _$SubjectAnimeCategoryMeta();
}

Serializer<SubjectAnimeCategory> _$subjectAnimeCategorySerializer =
    new _$SubjectAnimeCategorySerializer();

class _$SubjectAnimeCategorySerializer
    implements PrimitiveSerializer<SubjectAnimeCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Other': 0,
    'TV': 1,
    'OVA': 2,
    'Movie': 3,
    'WEB': 5,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'Other',
    1: 'TV',
    2: 'OVA',
    3: 'Movie',
    5: 'WEB',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectAnimeCategory];
  @override
  final String wireName = 'SubjectAnimeCategory';

  @override
  Object serialize(Serializers serializers, SubjectAnimeCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectAnimeCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectAnimeCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
