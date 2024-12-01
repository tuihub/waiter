// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_collection_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectCollectionType _$Wish = const SubjectCollectionType._('Wish');
const SubjectCollectionType _$Done = const SubjectCollectionType._('Done');
const SubjectCollectionType _$Doing = const SubjectCollectionType._('Doing');
const SubjectCollectionType _$OnHold = const SubjectCollectionType._('OnHold');
const SubjectCollectionType _$Dropped =
    const SubjectCollectionType._('Dropped');

SubjectCollectionType _$valueOf(String name) {
  switch (name) {
    case 'Wish':
      return _$Wish;
    case 'Done':
      return _$Done;
    case 'Doing':
      return _$Doing;
    case 'OnHold':
      return _$OnHold;
    case 'Dropped':
      return _$Dropped;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectCollectionType> _$values =
    new BuiltSet<SubjectCollectionType>(const <SubjectCollectionType>[
  _$Wish,
  _$Done,
  _$Doing,
  _$OnHold,
  _$Dropped,
]);

class _$SubjectCollectionTypeMeta {
  const _$SubjectCollectionTypeMeta();
  SubjectCollectionType get Wish => _$Wish;
  SubjectCollectionType get Done => _$Done;
  SubjectCollectionType get Doing => _$Doing;
  SubjectCollectionType get OnHold => _$OnHold;
  SubjectCollectionType get Dropped => _$Dropped;
  SubjectCollectionType valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectCollectionType> get values => _$values;
}

abstract class _$SubjectCollectionTypeMixin {
  // ignore: non_constant_identifier_names
  _$SubjectCollectionTypeMeta get SubjectCollectionType =>
      const _$SubjectCollectionTypeMeta();
}

Serializer<SubjectCollectionType> _$subjectCollectionTypeSerializer =
    new _$SubjectCollectionTypeSerializer();

class _$SubjectCollectionTypeSerializer
    implements PrimitiveSerializer<SubjectCollectionType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Wish': 1,
    'Done': 2,
    'Doing': 3,
    'OnHold': 4,
    'Dropped': 5,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Wish',
    2: 'Done',
    3: 'Doing',
    4: 'OnHold',
    5: 'Dropped',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectCollectionType];
  @override
  final String wireName = 'SubjectCollectionType';

  @override
  Object serialize(Serializers serializers, SubjectCollectionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectCollectionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectCollectionType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
