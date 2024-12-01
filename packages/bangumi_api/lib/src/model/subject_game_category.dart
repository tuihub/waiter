//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subject_game_category.g.dart';

class SubjectGameCategory extends EnumClass {
  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @BuiltValueEnumConst(wireNumber: 0)
  static const SubjectGameCategory Other = _$Other;

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @BuiltValueEnumConst(wireNumber: 4001)
  static const SubjectGameCategory Games = _$Games;

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @BuiltValueEnumConst(wireNumber: 4003)
  static const SubjectGameCategory Software = _$Software;

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @BuiltValueEnumConst(wireNumber: 4002)
  static const SubjectGameCategory DLC = _$DLC;

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @BuiltValueEnumConst(wireNumber: 4005)
  static const SubjectGameCategory Tabletop = _$Tabletop;

  static Serializer<SubjectGameCategory> get serializer =>
      _$subjectGameCategorySerializer;

  const SubjectGameCategory._(String name) : super(name);

  static BuiltSet<SubjectGameCategory> get values => _$values;
  static SubjectGameCategory valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class SubjectGameCategoryMixin = Object
    with _$SubjectGameCategoryMixin;
