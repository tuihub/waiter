//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/user_group.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'get_myself200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMyself200Response {
  /// Returns a new [GetMyself200Response] instance.
  GetMyself200Response({
    required this.id,
    required this.username,
    required this.nickname,
    required this.userGroup,
    required this.avatar,
    required this.sign,
    required this.email,
    required this.regTime,
    this.timeOffset,
  });

  @JsonKey(
    name: r'id',
    required: true,
    includeIfNull: false,
  )
  final int id;

  /// 唯一用户名，初始与 UID 相同，可修改一次
  @JsonKey(
    name: r'username',
    required: true,
    includeIfNull: false,
  )
  final String username;

  @JsonKey(
    name: r'nickname',
    required: true,
    includeIfNull: false,
  )
  final String nickname;

  @JsonKey(
    name: r'user_group',
    required: true,
    includeIfNull: false,
  )
  final UserGroup userGroup;

  @JsonKey(
    name: r'avatar',
    required: true,
    includeIfNull: false,
  )
  final Avatar avatar;

  /// 个人签名
  @JsonKey(
    name: r'sign',
    required: true,
    includeIfNull: false,
  )
  final String sign;

  /// 用户绑定的邮箱地址
  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  final String email;

  /// 用户注册时间。比如 2017-12-03T08:51:16+08:00
  @JsonKey(
    name: r'reg_time',
    required: true,
    includeIfNull: false,
  )
  final DateTime regTime;

  /// 用户设置的时区偏移，以小时为单位。比如 GMT+8（shanghai/beijing）为 8
  @JsonKey(
    name: r'time_offset',
    required: false,
    includeIfNull: false,
  )
  final int? timeOffset;

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is GetMyself200Response &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              username,
              nickname,
              userGroup,
              avatar,
              sign,
              email,
              regTime,
              timeOffset,
            ], [
              other.id,
              other.username,
              other.nickname,
              other.userGroup,
              other.avatar,
              other.sign,
              other.email,
              other.regTime,
              other.timeOffset,
            ]);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      mapPropsToHashCode(
        [
          id,
          username,
          nickname,
          userGroup,
          avatar,
          sign,
          email,
          regTime,
          timeOffset,
        ],
      );

  factory GetMyself200Response.fromJson(Map<String, dynamic> json) =>
      _$GetMyself200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyself200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
