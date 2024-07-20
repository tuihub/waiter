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

  static String m8(reason) => "Load failed, ${reason}";

  static String m9(server) => "Logging in to ${server}";

  static String m10(reason) => "Login failed, ${reason}";

  static String m11(number) => "${number} new applications found";

  static String m12(server) => "Register to ${server}";

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
        "PORTER_CONNECTION_STATUS_ACTIVATION_FAILED":
            MessageLookupByLibrary.simpleMessage("Activation failed"),
        "PORTER_CONNECTION_STATUS_ACTIVE":
            MessageLookupByLibrary.simpleMessage("Working"),
        "PORTER_CONNECTION_STATUS_CONNECTED":
            MessageLookupByLibrary.simpleMessage(
                "Connected but not yet enabled"),
        "PORTER_CONNECTION_STATUS_DISCONNECTED":
            MessageLookupByLibrary.simpleMessage("Disconnected"),
        "PORTER_CONNECTION_STATUS_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "SYSTEM_NOTIFICATION_LEVEL_ERROR":
            MessageLookupByLibrary.simpleMessage("Error"),
        "SYSTEM_NOTIFICATION_LEVEL_INFO":
            MessageLookupByLibrary.simpleMessage("Info"),
        "SYSTEM_NOTIFICATION_LEVEL_ONGOING":
            MessageLookupByLibrary.simpleMessage("On going"),
        "SYSTEM_NOTIFICATION_LEVEL_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "SYSTEM_NOTIFICATION_LEVEL_WARNING":
            MessageLookupByLibrary.simpleMessage("Warning"),
        "SYSTEM_NOTIFICATION_TYPE_SYSTEM":
            MessageLookupByLibrary.simpleMessage("System"),
        "SYSTEM_NOTIFICATION_TYPE_UNSPECIFIED":
            MessageLookupByLibrary.simpleMessage("Unspecified"),
        "SYSTEM_NOTIFICATION_TYPE_USER":
            MessageLookupByLibrary.simpleMessage("User"),
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
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addApplication":
            MessageLookupByLibrary.simpleMessage("Add application"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "applicationExitAbnormally":
            MessageLookupByLibrary.simpleMessage("Application exit abnormally"),
        "applySuccess": MessageLookupByLibrary.simpleMessage("Change applied"),
        "areYouSureToClose":
            MessageLookupByLibrary.simpleMessage("Are you sure to close?"),
        "backward": MessageLookupByLibrary.simpleMessage("Backward"),
        "cache": MessageLookupByLibrary.simpleMessage("cache"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "captcha": MessageLookupByLibrary.simpleMessage("Verification code"),
        "captchaRequired":
            MessageLookupByLibrary.simpleMessage("Verification code required"),
        "changeServer":
            MessageLookupByLibrary.simpleMessage("Switching server"),
        "check": MessageLookupByLibrary.simpleMessage("Check"),
        "chesed": MessageLookupByLibrary.simpleMessage("Chesed"),
        "clearCache": MessageLookupByLibrary.simpleMessage("Clear"),
        "clickLoginToStart":
            MessageLookupByLibrary.simpleMessage("CLICK LOGIN TO START"),
        "client": MessageLookupByLibrary.simpleMessage("client"),
        "clientSetting": MessageLookupByLibrary.simpleMessage("Client setting"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "connectInClient":
            MessageLookupByLibrary.simpleMessage("Log in using a client"),
        "continueInCurrentServer":
            MessageLookupByLibrary.simpleMessage("Continue in current server"),
        "continueInWebVersion": MessageLookupByLibrary.simpleMessage(
            "Continue to use the web version"),
        "currentDevice": MessageLookupByLibrary.simpleMessage("Current device"),
        "currentTheme": MessageLookupByLibrary.simpleMessage("Current theme"),
        "deviceDetail": MessageLookupByLibrary.simpleMessage("Device Details"),
        "deviceName": MessageLookupByLibrary.simpleMessage("Device Name"),
        "downloadClient":
            MessageLookupByLibrary.simpleMessage("Download client"),
        "durationDays": m0,
        "durationHours": m1,
        "durationJustNow": MessageLookupByLibrary.simpleMessage("Just now"),
        "durationMinutes": m2,
        "durationMonths": m3,
        "durationSeconds": m4,
        "durationWeeks": m5,
        "durationYears": m6,
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "feedActionSetAdd":
            MessageLookupByLibrary.simpleMessage("Add rule set"),
        "feedActionSetEdit":
            MessageLookupByLibrary.simpleMessage("Edit rule set"),
        "feedActionSetManage":
            MessageLookupByLibrary.simpleMessage("Manage rule set"),
        "feedConfigAdd":
            MessageLookupByLibrary.simpleMessage("Add subscription"),
        "feedConfigEdit":
            MessageLookupByLibrary.simpleMessage("Edit subscription"),
        "feedConfigManage":
            MessageLookupByLibrary.simpleMessage("Manage subscription"),
        "gebura": MessageLookupByLibrary.simpleMessage("Gebura"),
        "grpc": MessageLookupByLibrary.simpleMessage("gRPC"),
        "hide": MessageLookupByLibrary.simpleMessage("Hide"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "importSteamApplicationFinished": m7,
        "importingSteamApplications": MessageLookupByLibrary.simpleMessage(
            "Importing steam applications"),
        "lastLogin": MessageLookupByLibrary.simpleMessage("Last Login"),
        "launcherError": MessageLookupByLibrary.simpleMessage("Launcher error"),
        "library": MessageLookupByLibrary.simpleMessage("Library"),
        "loadFailed": m8,
        "loggingInTo": m9,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginExpired":
            MessageLookupByLibrary.simpleMessage("Login has expired"),
        "loginFailed": m10,
        "logoutDevice": MessageLookupByLibrary.simpleMessage("Logout device"),
        "minimizeToTray":
            MessageLookupByLibrary.simpleMessage("Minimize to tray"),
        "newApplicationFound": m11,
        "noAppInLibrary": MessageLookupByLibrary.simpleMessage(
            "No application in the library"),
        "operatingSystem":
            MessageLookupByLibrary.simpleMessage("Operating system"),
        "parseFailed": MessageLookupByLibrary.simpleMessage("Parse failed"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordInconsistent":
            MessageLookupByLibrary.simpleMessage("Password inconsistency"),
        "pleaseDontReRunApplication": MessageLookupByLibrary.simpleMessage(
            "Please don\'t re-run application"),
        "pleaseInputServerAddress":
            MessageLookupByLibrary.simpleMessage("Please input server address"),
        "pleaseInputServerPort":
            MessageLookupByLibrary.simpleMessage("Please input server port"),
        "pleaseSetupApplicationPath":
            MessageLookupByLibrary.simpleMessage("Please set application path"),
        "port": MessageLookupByLibrary.simpleMessage("Port"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "refreshCaptcha":
            MessageLookupByLibrary.simpleMessage("Refresh verification code"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerInTo": m12,
        "registerSuccess":
            MessageLookupByLibrary.simpleMessage("Registered successfully"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Reenter password"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "scanningLocalFiles":
            MessageLookupByLibrary.simpleMessage("Scanning local files"),
        "serverSetup": MessageLookupByLibrary.simpleMessage("Server setup"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "showServerConfig":
            MessageLookupByLibrary.simpleMessage("Viewing Server Information"),
        "store": MessageLookupByLibrary.simpleMessage("Store"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "title": MessageLookupByLibrary.simpleMessage("TuiHub"),
        "tls": MessageLookupByLibrary.simpleMessage("TLS"),
        "unknownApp": MessageLookupByLibrary.simpleMessage("Unknown app"),
        "unknownClient": MessageLookupByLibrary.simpleMessage("Unknown client"),
        "unknownDevice": MessageLookupByLibrary.simpleMessage("Unknown device"),
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
        "welcomeHeader": MessageLookupByLibrary.simpleMessage("🎉Welcome!"),
        "yesod": MessageLookupByLibrary.simpleMessage("Yesod")
      };
}
