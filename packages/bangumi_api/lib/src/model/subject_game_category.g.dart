// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_game_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectGameCategory _$Other = const SubjectGameCategory._('Other');
const SubjectGameCategory _$Games = const SubjectGameCategory._('Games');
const SubjectGameCategory _$Software = const SubjectGameCategory._('Software');
const SubjectGameCategory _$DLC = const SubjectGameCategory._('DLC');
const SubjectGameCategory _$Tabletop = const SubjectGameCategory._('Tabletop');

SubjectGameCategory _$valueOf(String name) {
  switch (name) {
    case 'Other':
      return _$Other;
    case 'Games':
      return _$Games;
    case 'Software':
      return _$Software;
    case 'DLC':
      return _$DLC;
    case 'Tabletop':
      return _$Tabletop;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectGameCategory> _$values =
    new BuiltSet<SubjectGameCategory>(const <SubjectGameCategory>[
  _$Other,
  _$Games,
  _$Software,
  _$DLC,
  _$Tabletop,
]);

class _$SubjectGameCategoryMeta {
  const _$SubjectGameCategoryMeta();
  SubjectGameCategory get Other => _$Other;
  SubjectGameCategory get Games => _$Games;
  SubjectGameCategory get Software => _$Software;
  SubjectGameCategory get DLC => _$DLC;
  SubjectGameCategory get Tabletop => _$Tabletop;
  SubjectGameCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectGameCategory> get values => _$values;
}

abstract class _$SubjectGameCategoryMixin {
  // ignore: non_constant_identifier_names
  _$SubjectGameCategoryMeta get SubjectGameCategory =>
      const _$SubjectGameCategoryMeta();
}

Serializer<SubjectGameCategory> _$subjectGameCategorySerializer =
    new _$SubjectGameCategorySerializer();

class _$SubjectGameCategorySerializer
    implements PrimitiveSerializer<SubjectGameCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Other': 0,
    'Games': 4001,
    'Software': 4003,
    'DLC': 4002,
    'Tabletop': 4005,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'Other',
    4001: 'Games',
    4003: 'Software',
    4002: 'DLC',
    4005: 'Tabletop',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectGameCategory];
  @override
  final String wireName = 'SubjectGameCategory';

  @override
  Object serialize(Serializers serializers, SubjectGameCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectGameCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectGameCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
