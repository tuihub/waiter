//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
enum EpType {
  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(0)
  MainStory('0'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(1)
  SP('1'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(2)
  OP('2'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(3)
  ED('3'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(4)
  PV('4'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(5)
  MAD('5'),

  /// 本篇 = 0 特别篇 = 1 OP = 2 ED = 3 预告/宣传/广告 = 4 MAD = 5 其他 = 6
  @JsonValue(6)
  Other('6');

  const EpType(this.value);

  final String value;

  @override
  String toString() => value;
}
