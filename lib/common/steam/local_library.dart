import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart' as io;

import '../platform.dart';
import 'acf_parser.dart';
import 'win32.dart' if (dart.library.html) 'non_win32.dart';

const _excludeAppIds = <String>{
  '228980', // Steamworks Common Redistributables
  '250820', // SteamVR
};

class InstalledSteamApps {
  final String appId;
  final String name;
  final String launcherPath;
  final String installPath;
  final String sizeOnDisk;
  final String? iconFilePath;

  InstalledSteamApps({
    required this.appId,
    required this.name,
    required this.launcherPath,
    required this.installPath,
    required this.sizeOnDisk,
    this.iconFilePath,
  });

  InstalledSteamApps copyWith({
    String? appId,
    String? name,
    String? launcherPath,
    String? installPath,
    String? sizeOnDisk,
    String? iconFilePath,
  }) {
    return InstalledSteamApps(
      appId: appId ?? this.appId,
      name: name ?? this.name,
      launcherPath: launcherPath ?? this.launcherPath,
      installPath: installPath ?? this.installPath,
      sizeOnDisk: sizeOnDisk ?? this.sizeOnDisk,
      iconFilePath: iconFilePath ?? this.iconFilePath,
    );
  }
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
    final steamInstallPath = await getSteamInstallPath();
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
    for (var i = 0; i < apps.length; i += 1) {
      apps[i] = apps[i].copyWith(
        iconFilePath: _getAppIconFilePath(steamInstallPath, apps[i].appId),
      );
    }
  } catch (e) {
    return (apps, SteamScanResult.unknownError);
  }
  if (apps.isEmpty) {
    return (apps, SteamScanResult.libraryEmpty);
  }
  return (apps, SteamScanResult.fullyScanned);
}

Future<List<String>> getSteamLibraryFolders() async {
  List<String> folders = [];
  try {
    if (!PlatformHelper.isWindowsApp()) {
      return folders;
    }
    final steamInstallPath = await getSteamInstallPath();
    if (steamInstallPath == null) {
      return folders;
    }
    folders = _getLibraryFolders(
        p.join(steamInstallPath, 'config', 'libraryfolders.vdf'));
  } catch (e) {
    debugPrint(e.toString());
  }
  return folders;
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
        final installDir = appState['installdir'];
        final installPath = installDir is String
            ? p.join(p.dirname(path), 'common', installDir)
            : '';
        final sizeOnDisk = appState['SizeOnDisk'];
        if (appId is String && _excludeAppIds.contains(appId)) {
          return null;
        }
        if (appId is String &&
            name is String &&
            launcherPath is String &&
            sizeOnDisk is String) {
          return InstalledSteamApps(
            appId: appId,
            name: name,
            launcherPath: launcherPath,
            installPath: installPath,
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

String _getAppIconFilePath(String path, String appId) {
  return p.join(
    path,
    'appcache',
    'librarycache',
    '${appId}_icon.jpg',
  );
}
