// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ep_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EpType _$MainStory = const EpType._('MainStory');
const EpType _$SP = const EpType._('SP');
const EpType _$OP = const EpType._('OP');
const EpType _$ED = const EpType._('ED');
const EpType _$PV = const EpType._('PV');
const EpType _$MAD = const EpType._('MAD');
const EpType _$Other = const EpType._('Other');

EpType _$valueOf(String name) {
  switch (name) {
    case 'MainStory':
      return _$MainStory;
    case 'SP':
      return _$SP;
    case 'OP':
      return _$OP;
    case 'ED':
      return _$ED;
    case 'PV':
      return _$PV;
    case 'MAD':
      return _$MAD;
    case 'Other':
      return _$Other;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EpType> _$values = new BuiltSet<EpType>(const <EpType>[
  _$MainStory,
  _$SP,
  _$OP,
  _$ED,
  _$PV,
  _$MAD,
  _$Other,
]);

class _$EpTypeMeta {
  const _$EpTypeMeta();
  EpType get MainStory => _$MainStory;
  EpType get SP => _$SP;
  EpType get OP => _$OP;
  EpType get ED => _$ED;
  EpType get PV => _$PV;
  EpType get MAD => _$MAD;
  EpType get Other => _$Other;
  EpType valueOf(String name) => _$valueOf(name);
  BuiltSet<EpType> get values => _$values;
}

abstract class _$EpTypeMixin {
  // ignore: non_constant_identifier_names
  _$EpTypeMeta get EpType => const _$EpTypeMeta();
}

Serializer<EpType> _$epTypeSerializer = new _$EpTypeSerializer();

class _$EpTypeSerializer implements PrimitiveSerializer<EpType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'MainStory': 0,
    'SP': 1,
    'OP': 2,
    'ED': 3,
    'PV': 4,
    'MAD': 5,
    'Other': 6,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'MainStory',
    1: 'SP',
    2: 'OP',
    3: 'ED',
    4: 'PV',
    5: 'MAD',
    6: 'Other',
  };

  @override
  final Iterable<Type> types = const <Type>[EpType];
  @override
  final String wireName = 'EpType';

  @override
  Object serialize(Serializers serializers, EpType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EpType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EpType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
