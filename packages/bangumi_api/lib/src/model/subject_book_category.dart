//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_book_category.g.dart';

class SubjectBookCategory extends EnumClass {
  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @BuiltValueEnumConst(wireNumber: 0)
  static const SubjectBookCategory Other = _$Other;

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @BuiltValueEnumConst(wireNumber: 1001)
  static const SubjectBookCategory Comic = _$Comic;

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @BuiltValueEnumConst(wireNumber: 1002)
  static const SubjectBookCategory Novel = _$Novel;

  /// 书籍类型 - `0` 为 其他 - `1001` 为 漫画 - `1002` 为 小说 - `1003` 为 画集
  @BuiltValueEnumConst(wireNumber: 1003)
  static const SubjectBookCategory Illustration = _$Illustration;

  static Serializer<SubjectBookCategory> get serializer =>
      _$subjectBookCategorySerializer;

  const SubjectBookCategory._(String name) : super(name);

  static BuiltSet<SubjectBookCategory> get values => _$values;
  static SubjectBookCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectBookCategoryMixin = Object
    with _$SubjectBookCategoryMixin;
