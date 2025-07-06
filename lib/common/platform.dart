import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah/tiphereth.pb.dart';
import 'package:universal_io/io.dart' as io;

import '../l10n/l10n.dart';
import '../model/common_model.dart';

final class PlatformHelper {
  static final PlatformHelper _instance = PlatformHelper._();

  PlatformHelper._();

  ClientDeviceInfo? _deviceInfo;

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

  static bool isMacOSApp() {
    return !kIsWeb && io.Platform.isMacOS;
  }

  static bool isMacOSWeb() {
    return kIsWeb && io.Platform.isMacOS;
  }

  static bool isMacOS() {
    return io.Platform.isMacOS;
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static SystemType getSystemType() {
    if (isAndroid()) {
      return SystemType.SYSTEM_TYPE_ANDROID;
    } else if (isWindows()) {
      return SystemType.SYSTEM_TYPE_WINDOWS;
    } else if (isMacOS()) {
      return SystemType.SYSTEM_TYPE_MACOS;
    } else if (isWeb()) {
      return SystemType.SYSTEM_TYPE_WEB;
    } else {
      return SystemType.SYSTEM_TYPE_UNSPECIFIED;
    }
  }

  static ClientDeviceInfo? clientDeviceInfo() {
    if (_instance._deviceInfo == null) {
      Future.delayed(Duration.zero, () async {
        _instance._deviceInfo = await PlatformHelper.clientDeviceInfoAsync();
      });
    }
    return _instance._deviceInfo;
  }

  static Future<ClientDeviceInfo> clientDeviceInfoAsync() async {
    final deviceInfo = DeviceInfoPlugin();
    if (PlatformHelper.isAndroidApp()) {
      final androidInfo = await deviceInfo.androidInfo;
      return ClientDeviceInfo(androidInfo.model, androidInfo.version.release);
    } else if (PlatformHelper.isWindowsApp()) {
      final windowsInfo = await deviceInfo.windowsInfo;
      return ClientDeviceInfo(
        windowsInfo.computerName,
        '${windowsInfo.productName} ${windowsInfo.displayVersion}',
      );
    } else if (PlatformHelper.isWeb()) {
      final webInfo = await deviceInfo.webBrowserInfo;
      return ClientDeviceInfo(
        _browserNameToString(webInfo.browserName),
        webInfo.platform ?? S.current.unknown,
      );
    } else {
      return ClientDeviceInfo(S.current.unknown, S.current.unknown);
    }
  }
}

String _browserNameToString(BrowserName browserName) {
  switch (browserName) {
    case BrowserName.chrome:
      return S.current.chrome;
    case BrowserName.edge:
      return S.current.edge;
    case BrowserName.firefox:
      return S.current.firefox;
    case BrowserName.safari:
      return S.current.safari;
    case BrowserName.samsungInternet:
      return S.current.samsung;
    case BrowserName.opera:
      return S.current.opera;
    case BrowserName.msie:
      return S.current.msie;
    case BrowserName.unknown:
      return S.current.unknown;
  }
}
