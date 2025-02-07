//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/user_group.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/src/equatable_utils.dart';

part 'user.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class User {
  /// Returns a new [User] instance.
  User({
    required this.id,
    required this.username,
    required this.nickname,
    required this.userGroup,
    required this.avatar,
    required this.sign,
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

  bool operator ==(Object other) {
    return identical(this, other) ||
        other is User &&
            runtimeType == other.runtimeType &&
            equals([
              id,
              username,
              nickname,
              userGroup,
              avatar,
              sign,
            ], [
              other.id,
              other.username,
              other.nickname,
              other.userGroup,
              other.avatar,
              other.sign,
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
        ],
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
