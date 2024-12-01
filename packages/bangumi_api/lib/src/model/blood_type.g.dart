// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BloodType _$A = const BloodType._('A');
const BloodType _$B = const BloodType._('B');
const BloodType _$AB = const BloodType._('AB');
const BloodType _$O = const BloodType._('O');

BloodType _$valueOf(String name) {
  switch (name) {
    case 'A':
      return _$A;
    case 'B':
      return _$B;
    case 'AB':
      return _$AB;
    case 'O':
      return _$O;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BloodType> _$values = new BuiltSet<BloodType>(const <BloodType>[
  _$A,
  _$B,
  _$AB,
  _$O,
]);

class _$BloodTypeMeta {
  const _$BloodTypeMeta();
  BloodType get A => _$A;
  BloodType get B => _$B;
  BloodType get AB => _$AB;
  BloodType get O => _$O;
  BloodType valueOf(String name) => _$valueOf(name);
  BuiltSet<BloodType> get values => _$values;
}

abstract class _$BloodTypeMixin {
  // ignore: non_constant_identifier_names
  _$BloodTypeMeta get BloodType => const _$BloodTypeMeta();
}

Serializer<BloodType> _$bloodTypeSerializer = new _$BloodTypeSerializer();

class _$BloodTypeSerializer implements PrimitiveSerializer<BloodType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'A': 1,
    'B': 2,
    'AB': 3,
    'O': 4,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'A',
    2: 'B',
    3: 'AB',
    4: 'O',
  };

  @override
  final Iterable<Type> types = const <Type>[BloodType];
  @override
  final String wireName = 'BloodType';

  @override
  Object serialize(Serializers serializers, BloodType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BloodType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BloodType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
