//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_real_category.g.dart';

class SubjectRealCategory extends EnumClass {
  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 0)
  static const SubjectRealCategory Other = _$Other;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 1)
  static const SubjectRealCategory JP = _$JP;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 2)
  static const SubjectRealCategory EN = _$EN;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 3)
  static const SubjectRealCategory CN = _$CN;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 6001)
  static const SubjectRealCategory TV = _$TV;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 6002)
  static const SubjectRealCategory Movie = _$Movie;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 6003)
  static const SubjectRealCategory Live = _$Live;

  /// 电影类型 - `0` 为 其他 - `1` 为 日剧 - `2` 为 欧美剧 - `3` 为 华语剧 - `6001` 为 电视剧 - `6002` 为 电影 - `6003` 为 演出 - `6004` 为 综艺
  @BuiltValueEnumConst(wireNumber: 6004)
  static const SubjectRealCategory Show = _$Show;

  static Serializer<SubjectRealCategory> get serializer =>
      _$subjectRealCategorySerializer;

  const SubjectRealCategory._(String name) : super(name);

  static BuiltSet<SubjectRealCategory> get values => _$values;
  static SubjectRealCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectRealCategoryMixin = Object
    with _$SubjectRealCategoryMixin;
