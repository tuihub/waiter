//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/ep_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'episode_detail.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EpisodeDetail {
  /// Returns a new [EpisodeDetail] instance.
  EpisodeDetail({
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
    required this.subjectId,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  @JsonKey(
    name: r'type',
    required: true,
    includeIfNull: false,
  )
  final EpType type;

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

  @JsonKey(
    name: r'subject_id',
    required: true,
    includeIfNull: false,
  )
  final int subjectId;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is EpisodeDetail &&
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
              subjectId,
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
              other.subjectId,
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
          subjectId,
        ],
      );

  factory EpisodeDetail.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
