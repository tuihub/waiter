import 'package:flutter/foundation.dart';
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
}
