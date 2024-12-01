// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_collection_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EpisodeCollectionType _$number1 =
    const EpisodeCollectionType._('number1');
const EpisodeCollectionType _$number2 =
    const EpisodeCollectionType._('number2');
const EpisodeCollectionType _$number3 =
    const EpisodeCollectionType._('number3');

EpisodeCollectionType _$valueOf(String name) {
  switch (name) {
    case 'number1':
      return _$number1;
    case 'number2':
      return _$number2;
    case 'number3':
      return _$number3;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EpisodeCollectionType> _$values =
    new BuiltSet<EpisodeCollectionType>(const <EpisodeCollectionType>[
  _$number1,
  _$number2,
  _$number3,
]);

class _$EpisodeCollectionTypeMeta {
  const _$EpisodeCollectionTypeMeta();
  EpisodeCollectionType get number1 => _$number1;
  EpisodeCollectionType get number2 => _$number2;
  EpisodeCollectionType get number3 => _$number3;
  EpisodeCollectionType valueOf(String name) => _$valueOf(name);
  BuiltSet<EpisodeCollectionType> get values => _$values;
}

abstract class _$EpisodeCollectionTypeMixin {
  // ignore: non_constant_identifier_names
  _$EpisodeCollectionTypeMeta get EpisodeCollectionType =>
      const _$EpisodeCollectionTypeMeta();
}

Serializer<EpisodeCollectionType> _$episodeCollectionTypeSerializer =
    new _$EpisodeCollectionTypeSerializer();

class _$EpisodeCollectionTypeSerializer
    implements PrimitiveSerializer<EpisodeCollectionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
    'number2': 2,
    'number3': 3,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
    2: 'number2',
    3: 'number3',
  };

  @override
  final Iterable<Type> types = const <Type>[EpisodeCollectionType];
  @override
  final String wireName = 'EpisodeCollectionType';

  @override
  Object serialize(Serializers serializers, EpisodeCollectionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EpisodeCollectionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EpisodeCollectionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
