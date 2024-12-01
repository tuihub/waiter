// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CharacterType _$Character = const CharacterType._('Character');
const CharacterType _$Mechanic = const CharacterType._('Mechanic');
const CharacterType _$Ship = const CharacterType._('Ship');
const CharacterType _$Organization = const CharacterType._('Organization');

CharacterType _$valueOf(String name) {
  switch (name) {
    case 'Character':
      return _$Character;
    case 'Mechanic':
      return _$Mechanic;
    case 'Ship':
      return _$Ship;
    case 'Organization':
      return _$Organization;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CharacterType> _$values =
    new BuiltSet<CharacterType>(const <CharacterType>[
  _$Character,
  _$Mechanic,
  _$Ship,
  _$Organization,
]);

class _$CharacterTypeMeta {
  const _$CharacterTypeMeta();
  CharacterType get Character => _$Character;
  CharacterType get Mechanic => _$Mechanic;
  CharacterType get Ship => _$Ship;
  CharacterType get Organization => _$Organization;
  CharacterType valueOf(String name) => _$valueOf(name);
  BuiltSet<CharacterType> get values => _$values;
}

abstract class _$CharacterTypeMixin {
  // ignore: non_constant_identifier_names
  _$CharacterTypeMeta get CharacterType => const _$CharacterTypeMeta();
}

Serializer<CharacterType> _$characterTypeSerializer =
    new _$CharacterTypeSerializer();

class _$CharacterTypeSerializer implements PrimitiveSerializer<CharacterType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Character': 1,
    'Mechanic': 2,
    'Ship': 3,
    'Organization': 4,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Character',
    2: 'Mechanic',
    3: 'Ship',
    4: 'Organization',
  };

  @override
  final Iterable<Type> types = const <Type>[CharacterType];
  @override
  final String wireName = 'CharacterType';

  @override
  Object serialize(Serializers serializers, CharacterType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CharacterType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CharacterType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
