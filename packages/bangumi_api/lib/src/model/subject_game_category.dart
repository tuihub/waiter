//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
enum SubjectGameCategory {
  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @JsonValue(0)
  Other('0'),

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @JsonValue(4001)
  Games('4001'),

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @JsonValue(4003)
  Software('4003'),

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @JsonValue(4002)
  DLC('4002'),

  /// 游戏类型 - `0` 为 其他 - `4001` 为 游戏 - `4002` 为 软件 - `4003` 为 扩展包 - `4005` 为 桌游
  @JsonValue(4005)
  Tabletop('4005');

  const SubjectGameCategory(this.value);

  final String value;

  @override
  String toString() => value;
}
