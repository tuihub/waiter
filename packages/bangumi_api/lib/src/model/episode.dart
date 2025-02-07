//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'episode.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Episode {
  /// Returns a new [Episode] instance.
  Episode({
    required this.id,
    required this.type,
    required this.name,
    required this.nameCn,
    required this.sort,
    this.ep,
    required this.airdate,
    required this.comment,
    required this.duration,
    required this.desc,
    required this.disc,
    this.durationSeconds,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  /// `0` 本篇，`1` SP，`2` OP，`3` ED
  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final int type;

  @JsonKey(
    name: r'name',
    required: true,
    includeIfNull: false,
  )
  final String name;

  @JsonKey(
    name: r'name_cn',
    required: true,
    includeIfNull: false,
  )
  final String nameCn;

  /// 同类条目的排序和集数
  @JsonKey(
    name: r'sort',
    required: true,
    includeIfNull: false,
  )
  final num sort;

  /// 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
  @JsonKey(
    name: r'ep',
    required: false,
    includeIfNull: false,
  )
  final num? ep;

  @JsonKey(
    name: r'airdate',
    required: true,
    includeIfNull: false,
  )
  final String airdate;

  @JsonKey(
    name: r'comment',
    required: true,
    includeIfNull: false,
  )
  final int comment;

  /// 维基人填写的原始时长
  @JsonKey(
    name: r'duration',
    required: true,
    includeIfNull: false,
  )
  final String duration;

  /// 简介
  @JsonKey(
    name: r'desc',
    required: true,
    includeIfNull: false,
  )
  final String desc;

  /// 音乐曲目的碟片数
  @JsonKey(
    name: r'disc',
    required: true,
    includeIfNull: false,
  )
  final int disc;

  /// 服务器解析的时长，无法解析时为 `0`
  @JsonKey(
    name: r'duration_seconds',
    required: false,
    includeIfNull: false,
  )
  final int? durationSeconds;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Episode &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              name,
              nameCn,
              sort,
              ep,
              airdate,
              comment,
              duration,
              desc,
              disc,
              durationSeconds,
            ], [
              other.id,
              other.type,
              other.name,
              other.nameCn,
              other.sort,
              other.ep,
              other.airdate,
              other.comment,
              other.duration,
              other.desc,
              other.disc,
              other.durationSeconds,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          type,
          name,
          nameCn,
          sort,
          ep,
          airdate,
          comment,
          duration,
          desc,
          disc,
          durationSeconds,
        ],
      );

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
