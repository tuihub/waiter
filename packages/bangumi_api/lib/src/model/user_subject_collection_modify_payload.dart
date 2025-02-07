//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/subject_collection_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user_subject_collection_modify_payload.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserSubjectCollectionModifyPayload {
  /// Returns a new [UserSubjectCollectionModifyPayload] instance.
  UserSubjectCollectionModifyPayload({
    this.type,
    this.rate,
    this.epStatus,
    this.volStatus,
    this.comment,
    this.private,
    this.tags,
  });

  /// 修改条目收藏类型
  @JsonKey(
    name: r'type',
    required: false,
    includeIfNull: false,
  )
  final SubjectCollectionType? type;

  /// 评分，`0` 表示删除评分
  // minimum: 0
  // maximum: 10
  @JsonKey(
    name: r'rate',
    required: false,
    includeIfNull: false,
  )
  final int? rate;

  /// 只能用于修改书籍条目进度
  // minimum: 0
  @JsonKey(
    name: r'ep_status',
    required: false,
    includeIfNull: false,
  )
  final int? epStatus;

  /// 只能用于修改书籍条目进度
  // minimum: 0
  @JsonKey(
    name: r'vol_status',
    required: false,
    includeIfNull: false,
  )
  final int? volStatus;

  /// 评价
  @JsonKey(
    name: r'comment',
    required: false,
    includeIfNull: false,
  )
  final String? comment;

  /// 仅自己可见
  @JsonKey(
    name: r'private',
    required: false,
    includeIfNull: false,
  )
  final bool? private;

  /// 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。
  @JsonKey(
    name: r'tags',
    required: false,
    includeIfNull: false,
  )
  final List<String>? tags;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is UserSubjectCollectionModifyPayload &&
            runtimeType == other.runtimeType &&
            equals([
              type,
              rate,
              epStatus,
              volStatus,
              comment,
              private,
              tags,
            ], [
              other.type,
              other.rate,
              other.epStatus,
              other.volStatus,
              other.comment,
              other.private,
              other.tags,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          type,
          rate,
          epStatus,
          volStatus,
          comment,
          private,
          tags,
        ],
      );

  factory UserSubjectCollectionModifyPayload.fromJson(
          Map<String, dynamic> json) =>
      _$UserSubjectCollectionModifyPayloadFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserSubjectCollectionModifyPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
