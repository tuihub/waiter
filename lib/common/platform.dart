import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:universal_io/io.dart' as io;

final class PlatformHelper {
  static bool isAndroidApp() {
    return !kIsWeb && io.Platform.isAndroid;
  }

  static bool isAndroidWeb() {
    return kIsWeb && io.Platform.isAndroid;
  }

  static bool isAndroid() {
    return io.Platform.isAndroid;
  }

  static bool isWindowsApp() {
    return !kIsWeb && io.Platform.isWindows;
  }

  static bool isWindowsWeb() {
    return kIsWeb && io.Platform.isWindows;
  }

  static bool isWindows() {
    return io.Platform.isWindows;
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static SystemType getSystemType() {
    if (isAndroid()) {
      return SystemType.SYSTEM_TYPE_ANDROID;
    } else if (isWindows()) {
      return SystemType.SYSTEM_TYPE_WINDOWS;
    } else if (isWeb()) {
      return SystemType.SYSTEM_TYPE_WEB;
    } else {
      return SystemType.SYSTEM_TYPE_UNSPECIFIED;
    }
  }
}
