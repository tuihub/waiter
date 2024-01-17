import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart' as io;
import 'package:win32_registry/win32_registry.dart';

import '../platform.dart';
import 'acf_parser.dart';

const _defaultSteamInstallPath = r'C:\Program Files (x86)\Steam';

class InstalledSteamApps {
  final String appId;
  final String name;
  final String launcherPath;
  final String sizeOnDisk;

  InstalledSteamApps({
    required this.appId,
    required this.name,
    required this.launcherPath,
    required this.sizeOnDisk,
  });
}

enum SteamScanResult {
  unavailable,
  unknownError,
  steamInstallationNotFound,
  libraryFoldersNotFound,
  libraryEmpty,
  fullyScanned,
}

Future<(List<InstalledSteamApps>, SteamScanResult)> scanLocalLibrary() async {
  final apps = <InstalledSteamApps>[];
  try {
    if (!PlatformHelper.isWindowsApp()) {
      return (apps, SteamScanResult.unavailable);
    }
    final steamInstallPath = await _getSteamInstallPath();
    if (steamInstallPath == null) {
      return (apps, SteamScanResult.steamInstallationNotFound);
    }
    final folders = _getLibraryFolders(
        p.join(steamInstallPath, 'config', 'libraryfolders.vdf'));
    if (folders.isEmpty) {
      return (apps, SteamScanResult.libraryFoldersNotFound);
    }
    for (final folder in folders) {
      final files = io.Directory(p.join(folder, 'steamapps'))
          .listSync()
          .whereType<io.File>()
          .where((file) {
        return p.basename(file.path).startsWith('appmanifest_') &&
            p.basename(file.path).endsWith('.acf');
      }).toList();
      for (final file in files) {
        final appInfo = _getAppInfo(file.path);
        if (appInfo != null) {
          apps.add(appInfo);
        }
      }
    }
  } catch (e) {
    return (apps, SteamScanResult.unknownError);
  }
  if (apps.isEmpty) {
    return (apps, SteamScanResult.libraryEmpty);
  }
  return (apps, SteamScanResult.fullyScanned);
}

Future<String?> _getSteamInstallPath() async {
  try {
    const keyPath = r'Software\Wow6432Node\Valve\Steam';
    final key = Registry.openPath(RegistryHive.localMachine, path: keyPath);

    final path = key.getValueAsString('InstallPath');
    key.close();
    if (path != null && await io.Directory(path).exists()) {
      return path;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  if (await io.Directory(_defaultSteamInstallPath).exists()) {
    return _defaultSteamInstallPath;
  }
  return null;
}

List<String> _getLibraryFolders(String path) {
  final file = io.File(path);
  final folders = <String>[];
  try {
    if (!file.existsSync()) {
      return folders;
    }
    final input = file.readAsStringSync();
    final content = parseAcf(input);
    if (content is Map<String, ACF>) {
      final libraryFolders = content['libraryfolders'];
      if (libraryFolders is Map<String, ACF>) {
        libraryFolders.forEach((_, value) {
          if (value is Map<String, ACF>) {
            final path = value['path'];
            if (path is String) {
              folders.add(path);
            }
          }
        });
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return folders;
}

InstalledSteamApps? _getAppInfo(String path) {
  final file = io.File(path);
  try {
    if (!file.existsSync()) {
      return null;
    }
    final input = file.readAsStringSync();
    final content = parseAcf(input);
    if (content is Map<String, ACF>) {
      final appState = content['AppState'];
      if (appState is Map<String, ACF>) {
        final appId = appState['appid'];
        final name = appState['name'];
        final launcherPath = appState['LauncherPath'];
        final sizeOnDisk = appState['SizeOnDisk'];
        if (appId is String &&
            name is String &&
            launcherPath is String &&
            sizeOnDisk is String) {
          return InstalledSteamApps(
            appId: appId,
            name: name,
            launcherPath: launcherPath,
            sizeOnDisk: sizeOnDisk,
          );
        }
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
