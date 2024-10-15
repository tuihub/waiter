import 'dart:math';

import 'package:glob/glob.dart';
import 'package:universal_io/io.dart';

import '../platform.dart';
import 'model.dart';

CommonAppFolderScanResult scanCommonApps(CommonAppFolderScanSetting setting) {
  if (!PlatformHelper.isWindowsApp()) {
    return const CommonAppFolderScanResult(
      installedApps: [],
      details: [],
    );
  }
  final entries = _walkEntry(setting, setting.basePath);
  if (entries == null) {
    return const CommonAppFolderScanResult(
      installedApps: [],
      details: [],
    );
  }
  final installedApps = _buildAppList(setting, entries);
  return CommonAppFolderScanResult(
    installedApps: installedApps,
    details: entries,
  );
}

List<InstalledCommonApps> _buildAppList(CommonAppFolderScanSetting setting,
    List<CommonAppFolderScanResultDetail> entries) {
  final Map<String, CommonAppFolderScanResultDetail> entryMap =
      entries.asMap().map(
            (key, value) => MapEntry(value.path, value),
          );
  final Map<String, InstalledCommonApps> appMap = {};
  for (final entry in entryMap.values) {
    if (entry.status != CommonAppFolderScanEntryStatus.hit) {
      continue;
    }
    final pathFields = entry.path.split(Platform.pathSeparator);
    if (pathFields.length <= setting.pathFieldMatcher.length) {
      continue;
    }
    final installPath = pathFields
        .sublist(
          0,
          pathFields.length - setting.pathFieldMatcher.length,
        )
        .join(Platform.pathSeparator);

    var name = '';
    var version = '';
    for (var i = 0;
        i < min(pathFields.length, setting.pathFieldMatcher.length);
        i++) {
      final fieldValue = pathFields[pathFields.length - i - 1];
      switch (setting.pathFieldMatcher[i]) {
        case CommonAppFolderScanPathFieldMatcher.name:
          name = fieldValue;
        case CommonAppFolderScanPathFieldMatcher.version:
          version = fieldValue;
        case CommonAppFolderScanPathFieldMatcher.ignore:
          continue;
      }
    }
    if (appMap[installPath] != null) {
      appMap[installPath]!.launcherPaths.add(entry.path);
    } else {
      appMap[installPath] = InstalledCommonApps(
        name: name,
        version: version,
        installPath: installPath,
        launcherPaths: [entry.path],
      );
    }
  }
  return appMap.values.toList();
}

List<CommonAppFolderScanResultDetail>? _walkEntry(
  CommonAppFolderScanSetting setting,
  String path,
) {
  switch (FileSystemEntity.typeSync(path)) {
    case FileSystemEntityType.directory:
      return _walkDirectory(setting, path);
    case FileSystemEntityType.file:
      final result = _walkFile(setting, path);
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
  return [
    CommonAppFolderScanResultDetail(
      path: path,
      type: CommonAppFolderScanEntryType.unknown,
      status: CommonAppFolderScanEntryStatus.skipped,
    )
  ];
}

List<CommonAppFolderScanResultDetail>? _walkDirectory(
  CommonAppFolderScanSetting setting,
  String path,
) {
  final skipped = CommonAppFolderScanResultDetail(
    path: path,
    type: CommonAppFolderScanEntryType.directory,
    status: CommonAppFolderScanEntryStatus.skipped,
  );
  try {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      return null;
    }
    final dirName = dir.path.split(Platform.pathSeparator).last;
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
      final details = _walkEntry(setting, entry.path);
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

CommonAppFolderScanResultDetail? _walkFile(
  CommonAppFolderScanSetting setting,
  String path,
) {
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
    for (final matcher in setting.targetFileMatchers) {
      if (Glob(matcher).matches(fileName)) {
        isMatched = true;
        break;
      }
    }
    if (!isMatched) {
      return skipped;
    }
    for (final matcher in setting.excludeFileMatchers) {
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
