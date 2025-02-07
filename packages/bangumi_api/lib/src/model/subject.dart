//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/collection.dart';
import 'package:bangumi_api/src/model/rating.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'subject.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Subject {
  /// Returns a new [Subject] instance.
  Subject({
    required this.id,
    required this.type,
    required this.name,
    required this.nameCn,
    required this.summary,
    required this.series,
    required this.nsfw,
    required this.locked,
    this.date,
    required this.platform,
    required this.images,
    // this.infobox,
    required this.volumes,
    required this.eps,
    this.totalEpisodes,
    required this.rating,
    required this.collection,
    required this.metaTags,
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

  @JsonKey(
    name: r'summary',
    required: true,
    includeIfNull: false,
  )
  final String summary;

  /// 是否为书籍系列的主条目
  @JsonKey(
    name: r'series',
    required: true,
    includeIfNull: false,
  )
  final bool series;

  @JsonKey(
    name: r'nsfw',
    required: true,
    includeIfNull: false,
  )
  final bool nsfw;

  @JsonKey(
    name: r'locked',
    required: true,
    includeIfNull: false,
  )
  final bool locked;

  /// air date in `YYYY-MM-DD` format
  @JsonKey(
    name: r'date',
    required: false,
    includeIfNull: false,
  )
  final String? date;

  /// TV, Web, 欧美剧, DLC...
  @JsonKey(
    name: r'platform',
    required: true,
    includeIfNull: false,
  )
  final String platform;

  @JsonKey(
    name: r'images',
    required: true,
    includeIfNull: false,
  )
  final Images images;

  // @JsonKey(
  //   name: r'infobox',
  //   required: false,
  //   includeIfNull: false,
  // )
  // final List<Item>? infobox;

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

  /// 数据库中的章节数量
  @JsonKey(
    name: r'total_episodes',
    required: false,
    includeIfNull: false,
  )
  final int? totalEpisodes;

  @JsonKey(
    name: r'rating',
    required: true,
    includeIfNull: false,
  )
  final Rating rating;

  @JsonKey(
    name: r'collection',
    required: true,
    includeIfNull: false,
  )
  final Collection collection;

  /// 由维基人维护的 tag
  @JsonKey(
    name: r'meta_tags',
    required: true,
    includeIfNull: false,
  )
  final List<String> metaTags;

  @JsonKey(
    name: r'tags',
    required: true,
    includeIfNull: false,
  )
  final List<Tag> tags;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Subject &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              type,
              name,
              nameCn,
              summary,
              series,
              nsfw,
              locked,
              date,
              platform,
              images,
              // infobox,
              volumes,
              eps,
              totalEpisodes,
              rating,
              collection,
              metaTags,
              tags,
            ], [
              other.id,
              other.type,
              other.name,
              other.nameCn,
              other.summary,
              other.series,
              other.nsfw,
              other.locked,
              other.date,
              other.platform,
              other.images,
              // other.infobox,
              other.volumes,
              other.eps,
              other.totalEpisodes,
              other.rating,
              other.collection,
              other.metaTags,
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
          summary,
          series,
          nsfw,
          locked,
          date,
          platform,
          images,
          // infobox,
          volumes,
          eps,
          totalEpisodes,
          rating,
          collection,
          metaTags,
          tags,
        ],
      );

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
