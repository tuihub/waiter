import 'dart:math';

import 'package:glob/glob.dart';
import 'package:universal_io/io.dart';

import '../platform.dart';
import 'model.dart';

Future<CommonAppFolderScanResult> scanCommonApps(
    CommonAppFolderScanSetting setting) async {
  if (!PlatformHelper.isWindowsApp()) {
    return const CommonAppFolderScanResult(
      installedApps: [],
      details: [],
      code: CommonAppFolderScanResultCode.unavailable,
    );
  }
  try {
    final entries = await _walkEntry(setting, setting.basePath);
    if (entries == null) {
      return const CommonAppFolderScanResult(
        installedApps: [],
        details: [],
        code: CommonAppFolderScanResultCode.baseFolderNotFound,
      );
    }
    final (installedApps, details) = _buildAppList(setting, entries);
    return CommonAppFolderScanResult(
      installedApps: installedApps,
      details: details,
      code: CommonAppFolderScanResultCode.success,
    );
  } catch (e) {
    return CommonAppFolderScanResult(
      installedApps: [],
      details: [],
      code: CommonAppFolderScanResultCode.unknownError,
      msg: e.toString(),
    );
  }
}

(List<InstalledCommonApps>, List<CommonAppFolderScanResultDetail>)
    _buildAppList(
  CommonAppFolderScanSetting setting,
  List<CommonAppFolderScanResultDetail> entries,
) {
  entries.sort((a, b) => a.path.length.compareTo(b.path.length));
  final Map<String, CommonAppFolderScanResultDetail> entryMap =
      entries.asMap().map(
            (key, value) => MapEntry(value.path, value),
          );
  final Map<String, InstalledCommonApps> appMap = {};

  for (final entry in entryMap.values) {
    if (entry.status != CommonAppFolderScanEntryStatus.hit) {
      continue;
    }
    final pathFields = entry.path
        .replaceFirst(
            setting.basePath.endsWith(Platform.pathSeparator)
                ? setting.basePath
                : setting.basePath + Platform.pathSeparator,
            '')
        .split(Platform.pathSeparator);
    for (var i = 0; i < pathFields.length; i++) {
      if (i < setting.minInstallDirDepth) {
        continue;
      }
      final currentPath = [
        if (setting.basePath.endsWith(Platform.pathSeparator))
          setting.basePath
        else
          setting.basePath + Platform.pathSeparator,
        pathFields.sublist(0, i).join(Platform.pathSeparator),
      ].join();

      if (appMap[currentPath] != null) {
        if (setting.minExecutableDepth <= i &&
            i <= setting.maxExecutableDepth) {
          appMap[currentPath]!.launcherPaths.add(entry.path);
        } else {
          entryMap[entry.path] = entry.copyWith(
            status: CommonAppFolderScanEntryStatus.skipped,
          );
        }
        break;
      }

      if (i > setting.maxInstallDirDepth) {
        break;
      }

      if (i == setting.maxInstallDirDepth || i == pathFields.length - 1) {
        appMap[currentPath] = InstalledCommonApps(
          name: pathFields.last,
          version: '',
          installPath: currentPath,
          launcherPaths: [entry.path],
        );
        break;
      }
    }
  }
  for (final app in appMap.values) {
    final pathFields = app.installPath
        .replaceFirst(
            setting.basePath.endsWith(Platform.pathSeparator)
                ? setting.basePath
                : setting.basePath + Platform.pathSeparator,
            '')
        .split(Platform.pathSeparator);

    var name = app.name;
    var version = app.version;
    late int indexOffset;
    switch (setting.pathFieldMatcherAlignment) {
      case CommonAppFolderScanPathFieldMatcherAlignment.left:
        indexOffset = 0;
      case CommonAppFolderScanPathFieldMatcherAlignment.right:
        indexOffset = max(pathFields.length, setting.pathFieldMatcher.length) -
            pathFields.length;
    }
    for (var i = 0; i < pathFields.length; i++) {
      final fieldValue = pathFields[i];
      final currentPath = [
        if (setting.basePath.endsWith(Platform.pathSeparator))
          setting.basePath
        else
          setting.basePath + Platform.pathSeparator,
        pathFields.sublist(0, i + 1).join(Platform.pathSeparator),
      ].join();
      switch (setting.pathFieldMatcher[i + indexOffset]) {
        case CommonAppFolderScanPathFieldMatcher.name:
          name = fieldValue;
          if (entryMap[currentPath] != null) {
            entryMap[currentPath] = entryMap[currentPath]!.copyWith(
              usedMatchers: [
                ...entryMap[currentPath]!.usedMatchers,
                CommonAppFolderScanPathFieldMatcher.name
              ],
            );
          }
        case CommonAppFolderScanPathFieldMatcher.version:
          version = fieldValue;
          if (entryMap[currentPath] != null) {
            entryMap[currentPath] = entryMap[currentPath]!.copyWith(
              usedMatchers: [
                ...entryMap[currentPath]!.usedMatchers,
                CommonAppFolderScanPathFieldMatcher.version
              ],
            );
          }
        case CommonAppFolderScanPathFieldMatcher.ignore:
          continue;
      }
    }
    appMap[app.installPath] = app.copyWith(
      name: name,
      version: version,
    );
  }
  final details = entryMap.values.toList();
  details.sort((a, b) => a.path.compareTo(b.path));
  return (appMap.values.toList(), details);
}

Future<List<CommonAppFolderScanResultDetail>?> _walkEntry(
  CommonAppFolderScanSetting setting,
  String path, {
  int? remainWalkDepth,
}) async {
  final errRes = [
    CommonAppFolderScanResultDetail(
      path: path,
      type: CommonAppFolderScanEntryType.unknown,
      status: CommonAppFolderScanEntryStatus.skipped,
    )
  ];
  try {
    switch (FileSystemEntity.typeSync(path)) {
      case FileSystemEntityType.directory:
        return _walkDirectory(
          setting,
          path,
          remainWalkDepth ??
              setting.maxInstallDirDepth + setting.maxExecutableDepth,
        );
      case FileSystemEntityType.file:
        final result = await _walkFile(
          setting,
          path,
        );
        if (result != null) {
          return [result];
        }
        return [];
      case FileSystemEntityType.notFound:
        return null;
      case FileSystemEntityType.link:
      case FileSystemEntityType.pipe:
      case FileSystemEntityType.unixDomainSock:
    }
    return errRes;
  } catch (e) {
    return errRes;
  }
}

Future<List<CommonAppFolderScanResultDetail>?> _walkDirectory(
  CommonAppFolderScanSetting setting,
  String path,
  int remainWalkDepth,
) async {
  try {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      return null;
    }
    if (PlatformHelper.isWindowsApp()) {
      final result = await Process.run('attrib', [path]);
      if (result.stdout.toString().contains('H')) {
        return null;
      }
    }
    final skipped = CommonAppFolderScanResultDetail(
      path: path,
      type: CommonAppFolderScanEntryType.directory,
      status: CommonAppFolderScanEntryStatus.skipped,
    );
    if (remainWalkDepth == 0) {
      return [skipped];
    }
    late String dirName;
    if (dir.path.endsWith(Platform.pathSeparator)) {
      dirName = dir.path.split(Platform.pathSeparator).reversed.skip(1).first;
    } else {
      dirName = dir.path.split(Platform.pathSeparator).last;
    }
    for (final matcher in setting.excludeDirectoryMatchers) {
      if (Glob(matcher).matches(dirName)) {
        return [skipped];
      }
    }
    final entries = dir.listSync();
    final result = [
      CommonAppFolderScanResultDetail(
        path: path,
        type: CommonAppFolderScanEntryType.directory,
        status: CommonAppFolderScanEntryStatus.accessed,
      )
    ];
    for (final entry in entries) {
      final details = await _walkEntry(
        setting,
        entry.path,
        remainWalkDepth: remainWalkDepth - 1,
      );
      if (details != null) {
        result.addAll(details);
      }
    }
    return result;
  } catch (e) {
    return [
      CommonAppFolderScanResultDetail(
        path: path,
        type: CommonAppFolderScanEntryType.directory,
        status: CommonAppFolderScanEntryStatus.error,
      )
    ];
  }
}

Future<CommonAppFolderScanResultDetail?> _walkFile(
  CommonAppFolderScanSetting setting,
  String path,
) async {
  final skipped = CommonAppFolderScanResultDetail(
    path: path,
    type: CommonAppFolderScanEntryType.file,
    status: CommonAppFolderScanEntryStatus.skipped,
  );
  try {
    final file = File(path);
    if (!file.existsSync()) {
      return null;
    }
    final fileName = file.path.split(Platform.pathSeparator).last;
    bool isMatched = false;
    for (final matcher in setting.includeExecutableMatchers) {
      if (Glob(matcher).matches(fileName)) {
        isMatched = true;
        break;
      }
    }
    if (!isMatched) {
      return skipped;
    }
    for (final matcher in setting.excludeExecutableMatchers) {
      if (Glob(matcher).matches(fileName)) {
        return skipped;
      }
    }
    return CommonAppFolderScanResultDetail(
      path: path,
      type: CommonAppFolderScanEntryType.file,
      status: CommonAppFolderScanEntryStatus.hit,
    );
  } catch (e) {
    return CommonAppFolderScanResultDetail(
      path: path,
      type: CommonAppFolderScanEntryType.file,
      status: CommonAppFolderScanEntryStatus.error,
    );
  }
}
