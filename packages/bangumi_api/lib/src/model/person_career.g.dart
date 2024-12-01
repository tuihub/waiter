// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_career.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PersonCareer _$producer = const PersonCareer._('producer');
const PersonCareer _$mangaka = const PersonCareer._('mangaka');
const PersonCareer _$artist = const PersonCareer._('artist');
const PersonCareer _$seiyu = const PersonCareer._('seiyu');
const PersonCareer _$writer = const PersonCareer._('writer');
const PersonCareer _$illustrator = const PersonCareer._('illustrator');
const PersonCareer _$actor = const PersonCareer._('actor');

PersonCareer _$valueOf(String name) {
  switch (name) {
    case 'producer':
      return _$producer;
    case 'mangaka':
      return _$mangaka;
    case 'artist':
      return _$artist;
    case 'seiyu':
      return _$seiyu;
    case 'writer':
      return _$writer;
    case 'illustrator':
      return _$illustrator;
    case 'actor':
      return _$actor;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PersonCareer> _$values =
    new BuiltSet<PersonCareer>(const <PersonCareer>[
  _$producer,
  _$mangaka,
  _$artist,
  _$seiyu,
  _$writer,
  _$illustrator,
  _$actor,
]);

class _$PersonCareerMeta {
  const _$PersonCareerMeta();
  PersonCareer get producer => _$producer;
  PersonCareer get mangaka => _$mangaka;
  PersonCareer get artist => _$artist;
  PersonCareer get seiyu => _$seiyu;
  PersonCareer get writer => _$writer;
  PersonCareer get illustrator => _$illustrator;
  PersonCareer get actor => _$actor;
  PersonCareer valueOf(String name) => _$valueOf(name);
  BuiltSet<PersonCareer> get values => _$values;
}

abstract class _$PersonCareerMixin {
  // ignore: non_constant_identifier_names
  _$PersonCareerMeta get PersonCareer => const _$PersonCareerMeta();
}

Serializer<PersonCareer> _$personCareerSerializer =
    new _$PersonCareerSerializer();

class _$PersonCareerSerializer implements PrimitiveSerializer<PersonCareer> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'producer': 'producer',
    'mangaka': 'mangaka',
    'artist': 'artist',
    'seiyu': 'seiyu',
    'writer': 'writer',
    'illustrator': 'illustrator',
    'actor': 'actor',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'producer': 'producer',
    'mangaka': 'mangaka',
    'artist': 'artist',
    'seiyu': 'seiyu',
    'writer': 'writer',
    'illustrator': 'illustrator',
    'actor': 'actor',
  };

  @override
  final Iterable<Type> types = const <Type>[PersonCareer];
  @override
  final String wireName = 'PersonCareer';

  @override
  Object serialize(Serializers serializers, PersonCareer object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PersonCareer deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PersonCareer.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
