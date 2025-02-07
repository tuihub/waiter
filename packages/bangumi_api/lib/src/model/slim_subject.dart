//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'slim_subject.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SlimSubject {
  /// Returns a new [SlimSubject] instance.
  SlimSubject({
    required this.id,
    required this.type,
    required this.name,
    required this.nameCn,
    required this.shortSummary,
    this.date,
    required this.images,
    required this.volumes,
    required this.eps,
    required this.collectionTotal,
    required this.score,
    required this.rank,
    required this.tags,
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
  final SubjectType type;

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

  /// 截短后的条目描述。
  @JsonKey(
    name: r'short_summary',
    required: true,
    includeIfNull: false,
  )
  final String shortSummary;

  /// air date in `YYYY-MM-DD` format
  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  final String? date;

  @JsonKey(
    name: r'images',
    required: true,
    includeIfNull: false,
  )
  final Images images;

  /// 书籍条目的册数，由旧服务端从wiki中解析
  @JsonKey(
    name: r'volumes',
    required: true,
    includeIfNull: false,
  )
  final int volumes;

  /// 由旧服务端从wiki中解析，对于书籍条目为`话数`
  @JsonKey(
    name: r'eps',
    required: true,
    includeIfNull: false,
  )
  final int eps;

  /// 收藏人数
  @JsonKey(
    name: r'collection_total',
    required: true,
    includeIfNull: false,
  )
  final int collectionTotal;

  /// 分数
  @JsonKey(
    name: r'score',
    required: true,
    includeIfNull: false,
  )
  final num score;

  /// 排名
  @JsonKey(
    name: r'rank',
    required: true,
    includeIfNull: false,
  )
  final int rank;

  /// 前 10 个 tag
  @JsonKey(
    name: r'tags',
    required: true,
    includeIfNull: false,
  )
  final List<Tag> tags;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SlimSubject &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              name,
              nameCn,
              shortSummary,
              date,
              images,
              volumes,
              eps,
              collectionTotal,
              score,
              rank,
              tags,
            ], [
              other.id,
              other.type,
              other.name,
              other.nameCn,
              other.shortSummary,
              other.date,
              other.images,
              other.volumes,
              other.eps,
              other.collectionTotal,
              other.score,
              other.rank,
              other.tags,
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
          shortSummary,
          date,
          images,
          volumes,
          eps,
          collectionTotal,
          score,
          rank,
          tags,
        ],
      );

  factory SlimSubject.fromJson(Map<String, dynamic> json) =>
      _$SlimSubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SlimSubjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
