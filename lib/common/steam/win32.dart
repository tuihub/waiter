import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart' as io;
import 'package:win32_registry/win32_registry.dart';

const _defaultSteamInstallPath = r'C:\Program Files (x86)\Steam';

String? _steamInstallPathCache;

String? getSteamInstallPath() {
  if (_steamInstallPathCache != null) {
    return _steamInstallPathCache;
  }
  try {
    const keyPath = r'Software\Wow6432Node\Valve\Steam';
    final key = Registry.openPath(RegistryHive.localMachine, path: keyPath);

    final path = key.getValueAsString('InstallPath');
    key.close();
    if (path != null && io.Directory(path).existsSync()) {
      _steamInstallPathCache = path;
      return path;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  if (io.Directory(_defaultSteamInstallPath).existsSync()) {
    return _defaultSteamInstallPath;
  }
  return null;
}
