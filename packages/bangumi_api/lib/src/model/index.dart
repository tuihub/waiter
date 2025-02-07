//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/creator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'index.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Index {
  /// Returns a new [Index] instance.
  Index({
    required this.id,
    required this.title,
    required this.desc,
    this.total = 0,
    required this.stat,
    required this.createdAt,
    required this.updatedAt,
    required this.creator,
    required this.ban,
    required this.nsfw,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  @JsonKey(
    name: r'title',
    required: true,
    includeIfNull: false,
  )
  final String title;

  @JsonKey(
    name: r'desc',
    required: true,
    includeIfNull: false,
  )
  final String desc;

  /// 收录条目总数
  @JsonKey(
    defaultValue: 0,
    name: r'total',
    required: false,
    includeIfNull: false,
  )
  final int? total;

  /// 目录评论及收藏数
  @JsonKey(
    name: r'stat',
    required: true,
    includeIfNull: false,
  )
  final Stat stat;

  @JsonKey(
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime createdAt;

  @JsonKey(
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )
  final DateTime updatedAt;

  @JsonKey(
    name: r'creator',
    required: true,
    includeIfNull: false,
  )
  final Creator creator;

  /// deprecated, always false.
  @Deprecated('ban has been deprecated')
  @JsonKey(
    name: r'ban',
    required: true,
    includeIfNull: false,
  )
  final bool ban;

  @JsonKey(
    name: r'nsfw',
    required: true,
    includeIfNull: false,
  )
  final bool nsfw;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Index &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              title,
              desc,
              total,
              stat,
              createdAt,
              updatedAt,
              creator,
              ban,
              nsfw,
            ], [
              other.id,
              other.title,
              other.desc,
              other.total,
              other.stat,
              other.createdAt,
              other.updatedAt,
              other.creator,
              other.ban,
              other.nsfw,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          title,
          desc,
          total,
          stat,
          createdAt,
          updatedAt,
          creator,
          ban,
          nsfw,
        ],
      );

  factory Index.fromJson(Map<String, dynamic> json) => _$IndexFromJson(json);

  Map<String, dynamic> toJson() => _$IndexToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
