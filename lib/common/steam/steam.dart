import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart' as io;

import '../platform.dart';
import '_native.dart' if (dart.library.html) '_web.dart';
import 'acf_parser.dart';

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

Future<(Map<String, List<InstalledSteamApps>>, SteamScanResult)>
    scanSteamLibrary() async {
  final Map<String, List<InstalledSteamApps>> appInsts = {};
  try {
    if (!PlatformHelper.isWindowsApp()) {
      return (appInsts, SteamScanResult.unavailable);
    }
    final steamInstallPath = getSteamInstallPath();
    if (steamInstallPath == null) {
      return (appInsts, SteamScanResult.steamInstallationNotFound);
    }
    final folders = _getLibraryFolders(
        p.join(steamInstallPath, 'config', 'libraryfolders.vdf'));
    if (folders.isEmpty) {
      return (appInsts, SteamScanResult.libraryFoldersNotFound);
    }
    for (final folder in folders) {
      final files = io.Directory(p.join(folder, 'steamapps'))
          .listSync()
          .whereType<io.File>()
          .where((file) {
        return p.basename(file.path).startsWith('appmanifest_') &&
            p.basename(file.path).endsWith('.acf');
      }).toList();
      final apps = <InstalledSteamApps>[];
      for (final file in files) {
        final appInfo = _getAppInfo(file.path);
        if (appInfo != null) {
          apps.add(appInfo);
        }
      }
      for (var i = 0; i < apps.length; i += 1) {
        apps[i] = apps[i].copyWith(
          iconFilePath: getAppIconFilePath(apps[i].appId),
        );
      }
      appInsts[folder] = apps;
    }
  } catch (e) {
    return (appInsts, SteamScanResult.unknownError);
  }
  if (appInsts.isEmpty) {
    return (appInsts, SteamScanResult.libraryEmpty);
  }
  return (appInsts, SteamScanResult.fullyScanned);
}

Future<List<String>> getSteamLibraryFolders() async {
  List<String> folders = [];
  try {
    if (!PlatformHelper.isWindowsApp()) {
      return folders;
    }
    final steamInstallPath = getSteamInstallPath();
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

String? getAppIconFilePath(String appId) {
  final path = getSteamInstallPath();
  if (path == null) {
    return null;
  }
  final filePath = p.join(
    path,
    'appcache',
    'librarycache',
    '${appId}_icon.jpg',
  );
  if (io.File(filePath).existsSync()) {
    return filePath;
  }
  return null;
}

String? getAppCoverFilePath(String appId) {
  final path = getSteamInstallPath();
  if (path == null) {
    return null;
  }
  final filePath = p.join(
    path,
    'appcache',
    'librarycache',
    '${appId}_library_600x900.jpg',
  );
  if (io.File(filePath).existsSync()) {
    return filePath;
  }
  return null;
}

String? getAppBackgroundFilePath(String appId) {
  final path = getSteamInstallPath();
  if (path == null) {
    return null;
  }
  var filePath = p.join(
    path,
    'appcache',
    'librarycache',
    '${appId}_library_hero.jpg',
  );
  if (io.File(filePath).existsSync()) {
    return filePath;
  }
  filePath = p.join(
    path,
    'appcache',
    'librarycache',
    '${appId}_header.jpg',
  );
  if (io.File(filePath).existsSync()) {
    return filePath;
  }
  return null;
}
