//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_anime_category.g.dart';

class SubjectAnimeCategory extends EnumClass {
  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @BuiltValueEnumConst(wireNumber: 0)
  static const SubjectAnimeCategory Other = _$Other;

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @BuiltValueEnumConst(wireNumber: 1)
  static const SubjectAnimeCategory TV = _$TV;

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @BuiltValueEnumConst(wireNumber: 2)
  static const SubjectAnimeCategory OVA = _$OVA;

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @BuiltValueEnumConst(wireNumber: 3)
  static const SubjectAnimeCategory Movie = _$Movie;

  /// 动画类型 - `0` 为 其他 - `1` 为 TV - `2` 为 OVA - `3` 为 Movie - `5` 为 WEB
  @BuiltValueEnumConst(wireNumber: 5)
  static const SubjectAnimeCategory WEB = _$WEB;

  static Serializer<SubjectAnimeCategory> get serializer =>
      _$subjectAnimeCategorySerializer;

  const SubjectAnimeCategory._(String name) : super(name);

  static BuiltSet<SubjectAnimeCategory> get values => _$values;
  static SubjectAnimeCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectAnimeCategoryMixin = Object
    with _$SubjectAnimeCategoryMixin;
