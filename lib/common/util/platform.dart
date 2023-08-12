import 'dart:io' as io;

import 'package:flutter/foundation.dart';

final class PlatformHelper {
  static bool isAndroidApp() {
    return !kIsWeb && io.Platform.isAndroid;
  }

  static bool isAndroidWeb() {
    return kIsWeb && io.Platform.isAndroid;
  }

  static bool isWindowsApp() {
    return !kIsWeb && io.Platform.isWindows;
  }

  static bool isWindowsWeb() {
    return kIsWeb && io.Platform.isWindows;
  }

  static bool isWeb() {
    return kIsWeb;
  }
}
