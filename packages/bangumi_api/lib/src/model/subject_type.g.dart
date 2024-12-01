// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectType _$Book = const SubjectType._('Book');
const SubjectType _$Anime = const SubjectType._('Anime');
const SubjectType _$Music = const SubjectType._('Music');
const SubjectType _$Game = const SubjectType._('Game');
const SubjectType _$Real = const SubjectType._('Real');

SubjectType _$valueOf(String name) {
  switch (name) {
    case 'Book':
      return _$Book;
    case 'Anime':
      return _$Anime;
    case 'Music':
      return _$Music;
    case 'Game':
      return _$Game;
    case 'Real':
      return _$Real;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectType> _$values =
    new BuiltSet<SubjectType>(const <SubjectType>[
  _$Book,
  _$Anime,
  _$Music,
  _$Game,
  _$Real,
]);

class _$SubjectTypeMeta {
  const _$SubjectTypeMeta();
  SubjectType get Book => _$Book;
  SubjectType get Anime => _$Anime;
  SubjectType get Music => _$Music;
  SubjectType get Game => _$Game;
  SubjectType get Real => _$Real;
  SubjectType valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectType> get values => _$values;
}

abstract class _$SubjectTypeMixin {
  // ignore: non_constant_identifier_names
  _$SubjectTypeMeta get SubjectType => const _$SubjectTypeMeta();
}

Serializer<SubjectType> _$subjectTypeSerializer = new _$SubjectTypeSerializer();

class _$SubjectTypeSerializer implements PrimitiveSerializer<SubjectType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Book': 1,
    'Anime': 2,
    'Music': 3,
    'Game': 4,
    'Real': 6,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Book',
    2: 'Anime',
    3: 'Music',
    4: 'Game',
    6: 'Real',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectType];
  @override
  final String wireName = 'SubjectType';

  @override
  Object serialize(Serializers serializers, SubjectType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
