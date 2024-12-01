// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_book_category.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubjectBookCategory _$Other = const SubjectBookCategory._('Other');
const SubjectBookCategory _$Comic = const SubjectBookCategory._('Comic');
const SubjectBookCategory _$Novel = const SubjectBookCategory._('Novel');
const SubjectBookCategory _$Illustration =
    const SubjectBookCategory._('Illustration');

SubjectBookCategory _$valueOf(String name) {
  switch (name) {
    case 'Other':
      return _$Other;
    case 'Comic':
      return _$Comic;
    case 'Novel':
      return _$Novel;
    case 'Illustration':
      return _$Illustration;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubjectBookCategory> _$values =
    new BuiltSet<SubjectBookCategory>(const <SubjectBookCategory>[
  _$Other,
  _$Comic,
  _$Novel,
  _$Illustration,
]);

class _$SubjectBookCategoryMeta {
  const _$SubjectBookCategoryMeta();
  SubjectBookCategory get Other => _$Other;
  SubjectBookCategory get Comic => _$Comic;
  SubjectBookCategory get Novel => _$Novel;
  SubjectBookCategory get Illustration => _$Illustration;
  SubjectBookCategory valueOf(String name) => _$valueOf(name);
  BuiltSet<SubjectBookCategory> get values => _$values;
}

abstract class _$SubjectBookCategoryMixin {
  // ignore: non_constant_identifier_names
  _$SubjectBookCategoryMeta get SubjectBookCategory =>
      const _$SubjectBookCategoryMeta();
}

Serializer<SubjectBookCategory> _$subjectBookCategorySerializer =
    new _$SubjectBookCategorySerializer();

class _$SubjectBookCategorySerializer
    implements PrimitiveSerializer<SubjectBookCategory> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Other': 0,
    'Comic': 1001,
    'Novel': 1002,
    'Illustration': 1003,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'Other',
    1001: 'Comic',
    1002: 'Novel',
    1003: 'Illustration',
  };

  @override
  final Iterable<Type> types = const <Type>[SubjectBookCategory];
  @override
  final String wireName = 'SubjectBookCategory';

  @override
  Object serialize(Serializers serializers, SubjectBookCategory object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubjectBookCategory deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubjectBookCategory.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
