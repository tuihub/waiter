// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static String m0(number) => "${number} 天前";

  static String m1(number) => "${number} 小时前";

  static String m2(number) => "${number} 分钟前";

  static String m3(number) => "${number} 个月前";

  static String m4(number) => "${number} 秒前";

  static String m5(number) => "${number} 周前";

  static String m6(number) => "${number} 年前";

  static String m7(success, failed) =>
      "导入Steam应用程序完成，成功 ${success} 个，失败 ${failed} 个。";

  static String m11(reason) => "加载失败${reason}";

  static String m8(server) => "登录到 ${server}";

  static String m9(reason) => "登录失败，${reason}";

  static String m10(number) => "发现 ${number} 个新应用";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ACCOUNT_PLATFORM": MessageLookupByLibrary.simpleMessage("平台"),
        "ACCOUNT_PLATFORM_STEAM": MessageLookupByLibrary.simpleMessage("Steam"),
        "ACCOUNT_PLATFORM_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("未知"),
        "APP_SOURCE": MessageLookupByLibrary.simpleMessage("来源"),
        "APP_SOURCE_INTERNAL": MessageLookupByLibrary.simpleMessage("内置"),
        "APP_SOURCE_STEAM": MessageLookupByLibrary.simpleMessage("Steam"),
        "APP_SOURCE_UNSPECIFIED": MessageLookupByLibrary.simpleMessage("未知"),
        "APP_TYPE": MessageLookupByLibrary.simpleMessage("类型"),
        "APP_TYPE_GAME": MessageLookupByLibrary.simpleMessage("游戏"),
        "APP_TYPE_UNSPECIFIED": MessageLookupByLibrary.simpleMessage("未知"),
        "FEED_CONFIG_STATUS": MessageLookupByLibrary.simpleMessage("状态"),
        "FEED_CONFIG_STATUS_ACTIVE": MessageLookupByLibrary.simpleMessage("启用"),
        "FEED_CONFIG_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("停止"),
        "FEED_CONFIG_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("未知"),
        "NOTIFY_FLOW_STATUS": MessageLookupByLibrary.simpleMessage("状态"),
        "NOTIFY_FLOW_STATUS_ACTIVE": MessageLookupByLibrary.simpleMessage("启用"),
        "NOTIFY_FLOW_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("停止"),
        "NOTIFY_FLOW_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("未知"),
        "NOTIFY_TARGET_STATUS": MessageLookupByLibrary.simpleMessage("状态"),
        "NOTIFY_TARGET_STATUS_ACTIVE":
            MessageLookupByLibrary.simpleMessage("启用"),
        "NOTIFY_TARGET_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("停止"),
        "NOTIFY_TARGET_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("未知"),
        "NOTIFY_TARGET_TYPE": MessageLookupByLibrary.simpleMessage("类型"),
        "NOTIFY_TARGET_TYPE_TELEGRAM":
            MessageLookupByLibrary.simpleMessage("Telegram"),
        "NOTIFY_TARGET_TYPE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("未知"),
        "USER_STATUS": MessageLookupByLibrary.simpleMessage("状态"),
        "USER_STATUS_ACTIVE": MessageLookupByLibrary.simpleMessage("正常"),
        "USER_STATUS_BLOCKED": MessageLookupByLibrary.simpleMessage("禁用"),
        "USER_STATUS_UNSPECIFIED": MessageLookupByLibrary.simpleMessage("未知"),
        "USER_TYPE": MessageLookupByLibrary.simpleMessage("类型"),
        "USER_TYPE_ADMIN": MessageLookupByLibrary.simpleMessage("管理员"),
        "USER_TYPE_NORMAL": MessageLookupByLibrary.simpleMessage("普通"),
        "USER_TYPE_SENTINEL": MessageLookupByLibrary.simpleMessage("扫描器"),
        "USER_TYPE_UNSPECIFIED": MessageLookupByLibrary.simpleMessage("未知"),
        "address": MessageLookupByLibrary.simpleMessage("地址"),
        "applicationExitAbnormally":
            MessageLookupByLibrary.simpleMessage("应用程序异常退出"),
        "areYouSureToClose": MessageLookupByLibrary.simpleMessage("你确定要关闭吗？"),
        "buttonBackward": MessageLookupByLibrary.simpleMessage("返回"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("取消"),
        "buttonCheck": MessageLookupByLibrary.simpleMessage("检查"),
        "buttonClose": MessageLookupByLibrary.simpleMessage("关闭"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("确认"),
        "buttonExit": MessageLookupByLibrary.simpleMessage("退出"),
        "buttonLogin": MessageLookupByLibrary.simpleMessage("登录"),
        "buttonMinimizeToTray": MessageLookupByLibrary.simpleMessage("最小化到托盘"),
        "buttonRetry": MessageLookupByLibrary.simpleMessage("重试"),
        "changeServer": MessageLookupByLibrary.simpleMessage("切换服务器"),
        "chesed": MessageLookupByLibrary.simpleMessage("Chesed"),
        "clickLoginToStart": MessageLookupByLibrary.simpleMessage("点击登录以开始"),
        "connectInClient": MessageLookupByLibrary.simpleMessage("使用客户端登录"),
        "continueInCurrentServer": MessageLookupByLibrary.simpleMessage("继续使用"),
        "continueInWebVersion": MessageLookupByLibrary.simpleMessage("继续使用网页版"),
        "downloadClient": MessageLookupByLibrary.simpleMessage("下载客户端"),
        "durationDays": m0,
        "durationHours": m1,
        "durationJustNow": MessageLookupByLibrary.simpleMessage("刚刚"),
        "durationMinutes": m2,
        "durationMonths": m3,
        "durationSeconds": m4,
        "durationWeeks": m5,
        "durationYears": m6,
        "gebura": MessageLookupByLibrary.simpleMessage("Gebura"),
        "grpc": MessageLookupByLibrary.simpleMessage("gRPC"),
        "importSteamApplicationFinished": m7,
        "importingSteamApplications":
            MessageLookupByLibrary.simpleMessage("正在导入Steam应用程序"),
        "launcherError": MessageLookupByLibrary.simpleMessage("启动器错误"),
        "library": MessageLookupByLibrary.simpleMessage("库"),
        "loadFailed": m11,
        "loggingInTo": m8,
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "loginFailed": m9,
        "newApplicationFound": m10,
        "parseFailed": MessageLookupByLibrary.simpleMessage("解析失败"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "pleaseDontReRunApplication":
            MessageLookupByLibrary.simpleMessage("请不要重复运行应用程序"),
        "pleaseInputServerAddress":
            MessageLookupByLibrary.simpleMessage("请输入服务器地址"),
        "pleaseInputServerPort":
            MessageLookupByLibrary.simpleMessage("请输入服务器端口"),
        "pleaseSetupApplicationPath":
            MessageLookupByLibrary.simpleMessage("请设置应用程序路径"),
        "port": MessageLookupByLibrary.simpleMessage("端口"),
        "scanningLocalFiles": MessageLookupByLibrary.simpleMessage("正在扫描本地文件"),
        "serverSetup": MessageLookupByLibrary.simpleMessage("服务器设置"),
        "showServerConfig": MessageLookupByLibrary.simpleMessage("查看服务器信息"),
        "store": MessageLookupByLibrary.simpleMessage("商店"),
        "title": MessageLookupByLibrary.simpleMessage("TuiHub"),
        "tls": MessageLookupByLibrary.simpleMessage("TLS"),
        "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage("发生未知错误"),
        "updateImageUserCanceledCapture":
            MessageLookupByLibrary.simpleMessage("用户取消了捕获"),
        "updateImageUserCanceledPick":
            MessageLookupByLibrary.simpleMessage("用户取消了选择"),
        "uploadImageFailed": MessageLookupByLibrary.simpleMessage("上传图像失败"),
        "username": MessageLookupByLibrary.simpleMessage("用户名"),
        "webVersionFunctionLimited":
            MessageLookupByLibrary.simpleMessage("Web版本功能有限，仅供评估使用。"),
        "welcome": MessageLookupByLibrary.simpleMessage("欢迎"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("欢迎回来"),
        "welcomeHeader": MessageLookupByLibrary.simpleMessage("🎉欢迎！")
      };
}
