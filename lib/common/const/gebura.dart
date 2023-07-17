import 'package:tuihub_protos/librarian/v1/common.pbenum.dart';

String appSourceString(AppSource source) {
  switch (source) {
    case AppSource.APP_SOURCE_UNSPECIFIED:
      return "未知";
    case AppSource.APP_SOURCE_INTERNAL:
      return '内置';
    case AppSource.APP_SOURCE_STEAM:
      return 'Steam';
    default:
      return '';
  }
}

String appTypeString(AppType type) {
  switch (type) {
    case AppType.APP_TYPE_UNSPECIFIED:
      return '未知';
    case AppType.APP_TYPE_GAME:
      return '游戏';
    default:
      return '';
  }
}

String appPackageSourceString(AppPackageSource source) {
  switch (source) {
    case AppPackageSource.APP_PACKAGE_SOURCE_MANUAL:
      return '手动';
    case AppPackageSource.APP_PACKAGE_SOURCE_SENTINEL:
      return '扫描';
    default:
      return '';
  }
}
