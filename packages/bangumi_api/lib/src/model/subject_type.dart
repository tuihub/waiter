//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_type.g.dart';

class SubjectType extends EnumClass {
  /// 条目类型 - `1` 为 书籍 - `2` 为 动画 - `3` 为 音乐 - `4` 为 游戏 - `6` 为 三次元  没有 `5`
  @BuiltValueEnumConst(wireNumber: 1)
  static const SubjectType Book = _$Book;

  /// 条目类型 - `1` 为 书籍 - `2` 为 动画 - `3` 为 音乐 - `4` 为 游戏 - `6` 为 三次元  没有 `5`
  @BuiltValueEnumConst(wireNumber: 2)
  static const SubjectType Anime = _$Anime;

  /// 条目类型 - `1` 为 书籍 - `2` 为 动画 - `3` 为 音乐 - `4` 为 游戏 - `6` 为 三次元  没有 `5`
  @BuiltValueEnumConst(wireNumber: 3)
  static const SubjectType Music = _$Music;

  /// 条目类型 - `1` 为 书籍 - `2` 为 动画 - `3` 为 音乐 - `4` 为 游戏 - `6` 为 三次元  没有 `5`
  @BuiltValueEnumConst(wireNumber: 4)
  static const SubjectType Game = _$Game;

  /// 条目类型 - `1` 为 书籍 - `2` 为 动画 - `3` 为 音乐 - `4` 为 游戏 - `6` 为 三次元  没有 `5`
  @BuiltValueEnumConst(wireNumber: 6)
  static const SubjectType Real = _$Real;

  static Serializer<SubjectType> get serializer => _$subjectTypeSerializer;

  const SubjectType._(String name) : super(name);

  static BuiltSet<SubjectType> get values => _$values;
  static SubjectType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectTypeMixin = Object with _$SubjectTypeMixin;
