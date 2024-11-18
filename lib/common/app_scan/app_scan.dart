import 'dart:math';

import 'package:universal_io/io.dart';

import '../../rust/api/app_scan.dart' as rust;
import 'model.dart';

Future<CommonAppFolderScanResult> scanCommonApps(CommonAppScan setting) async {
  try {
    final scannedEntries = await rust.scanCommonApps(
        setting: rust.CommonAppScanSetting(
      basePath: setting.basePath,
      minInstallDirDepth: setting.minInstallDirDepth,
      maxInstallDirDepth: setting.maxInstallDirDepth,
      minExecutableDepth: setting.minExecutableDepth,
      maxExecutableDepth: setting.maxExecutableDepth,
      excludeDirectoryMatchers: setting.excludeDirectoryMatchers,
      includeExecutableMatchers: setting.includeExecutableMatchers,
      excludeExecutableMatchers: setting.excludeExecutableMatchers,
    ));
    final List<CommonAppFolderScanResultDetail>? entries =
        scannedEntries?.map((entry) {
      late CommonAppFolderScanEntryStatus status;
      late CommonAppFolderScanEntryType type;
      switch (entry.entryType) {
        case rust.CommonAppScannedEntryType.directory:
          type = CommonAppFolderScanEntryType.directory;
        case rust.CommonAppScannedEntryType.file:
          type = CommonAppFolderScanEntryType.file;
        case rust.CommonAppScannedEntryType.unknown:
          type = CommonAppFolderScanEntryType.unknown;
      }
      switch (entry.status) {
        case rust.CommonAppScannedEntryStatus.hit:
          status = CommonAppFolderScanEntryStatus.hit;
        case rust.CommonAppScannedEntryStatus.skipped:
          status = CommonAppFolderScanEntryStatus.skipped;
        case rust.CommonAppScannedEntryStatus.accessed:
          status = CommonAppFolderScanEntryStatus.accessed;
        case rust.CommonAppScannedEntryStatus.error:
          status = CommonAppFolderScanEntryStatus.error;
      }
      return CommonAppFolderScanResultDetail(
        path: entry.path,
        type: type,
        status: status,
      );
    }).toList();
    if (entries != null) {
      final (apps, details) = _buildAppList(setting, entries);
      return CommonAppFolderScanResult(
        installedApps: apps,
        details: details,
        code: CommonAppFolderScanResultCode.success,
      );
    } else {
      return const CommonAppFolderScanResult(
        installedApps: [],
        details: [],
        code: CommonAppFolderScanResultCode.unavailable,
      );
    }
  } on Exception catch (e) {
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
  CommonAppScan setting,
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
      case CommonAppScanPathFieldMatcherAlignment.left:
        indexOffset = 0;
      case CommonAppScanPathFieldMatcherAlignment.right:
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
        case CommonAppScanPathFieldMatcher.name:
          name = fieldValue;
          if (entryMap[currentPath] != null) {
            entryMap[currentPath] = entryMap[currentPath]!.copyWith(
              usedMatchers: [
                ...entryMap[currentPath]!.usedMatchers,
                CommonAppScanPathFieldMatcher.name
              ],
            );
          }
        case CommonAppScanPathFieldMatcher.version:
          version = fieldValue;
          if (entryMap[currentPath] != null) {
            entryMap[currentPath] = entryMap[currentPath]!.copyWith(
              usedMatchers: [
                ...entryMap[currentPath]!.usedMatchers,
                CommonAppScanPathFieldMatcher.version
              ],
            );
          }
        case CommonAppScanPathFieldMatcher.ignore:
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
