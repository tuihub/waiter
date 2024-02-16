// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(number) => "${number} days ago";

  static String m1(number) => "${number} hours ago";

  static String m2(number) => "${number} minutes ago";

  static String m3(number) => "${number} months ago";

  static String m4(number) => "${number} seconds ago";

  static String m5(number) => "${number} weeks ago";

  static String m6(number) => "${number} years ago";

  static String m7(success, failed) =>
      "Import steam application finished, ${success} success, ${failed} failed";

  static String m8(server) => "Logging in to ${server}";

  static String m9(reason) => "Login failed, ${reason}";

  static String m10(number) => "${number} new applications found";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ACCOUNT_PLATFORM": MessageLookupByLibrary.simpleMessage("Platform"),
        "ACCOUNT_PLATFORM_STEAM": MessageLookupByLibrary.simpleMessage("Steam"),
        "ACCOUNT_PLATFORM_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "APP_SOURCE": MessageLookupByLibrary.simpleMessage("Source"),
        "APP_SOURCE_INTERNAL": MessageLookupByLibrary.simpleMessage("Internal"),
        "APP_SOURCE_STEAM": MessageLookupByLibrary.simpleMessage("Steam"),
        "APP_SOURCE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "APP_TYPE": MessageLookupByLibrary.simpleMessage("Type"),
        "APP_TYPE_GAME": MessageLookupByLibrary.simpleMessage("Game"),
        "APP_TYPE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "FEED_CONFIG_STATUS": MessageLookupByLibrary.simpleMessage("Status"),
        "FEED_CONFIG_STATUS_ACTIVE":
            MessageLookupByLibrary.simpleMessage("Active"),
        "FEED_CONFIG_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("Suspend"),
        "FEED_CONFIG_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "NOTIFY_FLOW_STATUS": MessageLookupByLibrary.simpleMessage("Status"),
        "NOTIFY_FLOW_STATUS_ACTIVE":
            MessageLookupByLibrary.simpleMessage("Active"),
        "NOTIFY_FLOW_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("Suspend"),
        "NOTIFY_FLOW_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "NOTIFY_TARGET_STATUS": MessageLookupByLibrary.simpleMessage("Status"),
        "NOTIFY_TARGET_STATUS_ACTIVE":
            MessageLookupByLibrary.simpleMessage("Active"),
        "NOTIFY_TARGET_STATUS_SUSPEND":
            MessageLookupByLibrary.simpleMessage("Suspend"),
        "NOTIFY_TARGET_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "NOTIFY_TARGET_TYPE": MessageLookupByLibrary.simpleMessage("Type"),
        "NOTIFY_TARGET_TYPE_TELEGRAM":
            MessageLookupByLibrary.simpleMessage("Telegram"),
        "NOTIFY_TARGET_TYPE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "USER_STATUS": MessageLookupByLibrary.simpleMessage("Status"),
        "USER_STATUS_ACTIVE": MessageLookupByLibrary.simpleMessage("Active"),
        "USER_STATUS_BLOCKED": MessageLookupByLibrary.simpleMessage("Blocked"),
        "USER_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "USER_TYPE": MessageLookupByLibrary.simpleMessage("Type"),
        "USER_TYPE_ADMIN": MessageLookupByLibrary.simpleMessage("Admin"),
        "USER_TYPE_NORMAL": MessageLookupByLibrary.simpleMessage("Normal"),
        "USER_TYPE_SENTINEL": MessageLookupByLibrary.simpleMessage("Sentinel"),
        "USER_TYPE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "applicationExitAbnormally":
            MessageLookupByLibrary.simpleMessage("Application exit abnormally"),
        "areYouSureToClose":
            MessageLookupByLibrary.simpleMessage("Are you sure to close?"),
        "buttonBackward": MessageLookupByLibrary.simpleMessage("Backward"),
        "buttonCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "buttonCheck": MessageLookupByLibrary.simpleMessage("Check"),
        "buttonClose": MessageLookupByLibrary.simpleMessage("Close"),
        "buttonConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "buttonExit": MessageLookupByLibrary.simpleMessage("Exit"),
        "buttonLogin": MessageLookupByLibrary.simpleMessage("Login"),
        "buttonMinimizeToTray":
            MessageLookupByLibrary.simpleMessage("Minimize to tray"),
        "buttonRetry": MessageLookupByLibrary.simpleMessage("Retry"),
        "chesed": MessageLookupByLibrary.simpleMessage("Chesed"),
        "clickLoginToStart":
            MessageLookupByLibrary.simpleMessage("CLICK LOGIN TO START"),
        "durationDays": m0,
        "durationHours": m1,
        "durationJustNow": MessageLookupByLibrary.simpleMessage("Just now"),
        "durationMinutes": m2,
        "durationMonths": m3,
        "durationSeconds": m4,
        "durationWeeks": m5,
        "durationYears": m6,
        "gebura": MessageLookupByLibrary.simpleMessage("Gebura"),
        "grpc": MessageLookupByLibrary.simpleMessage("gRPC"),
        "importSteamApplicationFinished": m7,
        "importingSteamApplications": MessageLookupByLibrary.simpleMessage(
            "Importing steam applications"),
        "launcherError": MessageLookupByLibrary.simpleMessage("Launcher error"),
        "loggingInTo": m8,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginFailed": m9,
        "newApplicationFound": m10,
        "parseFailed": MessageLookupByLibrary.simpleMessage("Parse failed"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "pleaseDontReRunApplication": MessageLookupByLibrary.simpleMessage(
            "Please don\'t re-run application"),
        "pleaseInputServerAddress":
            MessageLookupByLibrary.simpleMessage("Please input server address"),
        "pleaseInputServerPort":
            MessageLookupByLibrary.simpleMessage("Please input server port"),
        "pleaseSetupApplicationPath": MessageLookupByLibrary.simpleMessage(
            "Please setup application path"),
        "port": MessageLookupByLibrary.simpleMessage("Port"),
        "scanningLocalFiles":
            MessageLookupByLibrary.simpleMessage("Scanning local files"),
        "serverSetup": MessageLookupByLibrary.simpleMessage("Server setup"),
        "title": MessageLookupByLibrary.simpleMessage("TuiHub"),
        "tls": MessageLookupByLibrary.simpleMessage("TLS"),
        "unknownErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Unknown error occurred"),
        "updateImageUserCanceledCapture":
            MessageLookupByLibrary.simpleMessage("User canceled capture"),
        "updateImageUserCanceledPick":
            MessageLookupByLibrary.simpleMessage("User canceled pick"),
        "uploadImageFailed":
            MessageLookupByLibrary.simpleMessage("Upload image failed"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "webVersionFunctionLimited": MessageLookupByLibrary.simpleMessage(
            "Web version has limited functionality, for evaluation use only"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "welcomeHeader": MessageLookupByLibrary.simpleMessage("🎉Welcome!")
      };
}
