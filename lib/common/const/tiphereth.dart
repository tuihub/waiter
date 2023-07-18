import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

String userTypeString(UserType type) {
  switch (type) {
    case UserType.USER_TYPE_ADMIN:
      return '管理员';
    case UserType.USER_TYPE_NORMAL:
      return '普通';
    case UserType.USER_TYPE_SENTINEL:
      return '扫描器';
    default:
      return '';
  }
}

String userStatusString(UserStatus status) {
  switch (status) {
    case UserStatus.USER_STATUS_ACTIVE:
      return '启用';
    case UserStatus.USER_STATUS_BLOCKED:
      return '禁用';
    default:
      return '';
  }
}
