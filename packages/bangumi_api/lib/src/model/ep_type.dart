//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ep_type.g.dart';

class EpType extends EnumClass {
  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 0)
  static const EpType MainStory = _$MainStory;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 1)
  static const EpType SP = _$SP;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 2)
  static const EpType OP = _$OP;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 3)
  static const EpType ED = _$ED;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 4)
  static const EpType PV = _$PV;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 5)
  static const EpType MAD = _$MAD;

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @BuiltValueEnumConst(wireNumber: 6)
  static const EpType Other = _$Other;

  static Serializer<EpType> get serializer => _$epTypeSerializer;

  const EpType._(String name) : super(name);

  static BuiltSet<EpType> get values => _$values;
  static EpType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EpTypeMixin = Object with _$EpTypeMixin;
