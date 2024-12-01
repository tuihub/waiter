// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PersonType _$Individual = const PersonType._('Individual');
const PersonType _$Corporation = const PersonType._('Corporation');
const PersonType _$Association = const PersonType._('Association');

PersonType _$valueOf(String name) {
  switch (name) {
    case 'Individual':
      return _$Individual;
    case 'Corporation':
      return _$Corporation;
    case 'Association':
      return _$Association;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PersonType> _$values =
    new BuiltSet<PersonType>(const <PersonType>[
  _$Individual,
  _$Corporation,
  _$Association,
]);

class _$PersonTypeMeta {
  const _$PersonTypeMeta();
  PersonType get Individual => _$Individual;
  PersonType get Corporation => _$Corporation;
  PersonType get Association => _$Association;
  PersonType valueOf(String name) => _$valueOf(name);
  BuiltSet<PersonType> get values => _$values;
}

abstract class _$PersonTypeMixin {
  // ignore: non_constant_identifier_names
  _$PersonTypeMeta get PersonType => const _$PersonTypeMeta();
}

Serializer<PersonType> _$personTypeSerializer = new _$PersonTypeSerializer();

class _$PersonTypeSerializer implements PrimitiveSerializer<PersonType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Individual': 1,
    'Corporation': 2,
    'Association': 3,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Individual',
    2: 'Corporation',
    3: 'Association',
  };

  @override
  final Iterable<Type> types = const <Type>[PersonType];
  @override
  final String wireName = 'PersonType';

  @override
  Object serialize(Serializers serializers, PersonType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PersonType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PersonType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
