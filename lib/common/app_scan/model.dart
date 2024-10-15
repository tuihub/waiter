import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

const defaultCommonAppFolderScanTargetFileMatchers = <String>[
  '*.exe',
  '*.bat',
];

const defaultCommonAppFolderScanExcludeFileMatchers = <String>[
  'UnityCrashHandler64.exe',
  'UnityCrashHandler32.exe',
  'UnityCrashHandler.exe',
  'ReiPatcher.exe',
  'Lec.ExtProtocol.exe',
  'ezTransXP.ExtProtocol.exe',
  'Common.ExtProtocol.Executor.exe',
  'MTool_Game.exe',
  'MTool_Config.exe',
  'MtoolBakinPlayerWrapper.exe',
  'BakinLauncher.exe',
  'Config.exe',
  'notification_helper.exe',
  'app-builder.exe',
  '7za.exe',
  'elevate.exe',
  'chromedriver.exe',
  'CPUInstructionCheck.exe',
  'FileCheck.exe',
  'FileChecker.exe',
  'inject.exe',
  'payload.exe',
  'python.exe',
  'pythonw.exe',
  'install.exe',
  'Uninstall.exe',
  'uinst.exe',
  'uninst.exe',
  'unins000.exe',
  'UnInstaller.exe',
  'setup.exe',
];

const defaultCommonAppFolderScanExcludeDirectoryMatchers = <String>[
  '.*',
];

enum CommonAppFolderScanPathFieldMatcher {
  ignore,
  name,
  version,
}

enum CommonAppFolderScanPathFieldMatcherAlignment {
  left,
  right,
}

enum CommonAppFolderScanEntryType {
  file,
  directory,
  unknown,
}

enum CommonAppFolderScanEntryStatus {
  error,
  skipped,
  accessed,
  hit,
}

@freezed
class CommonAppFolderScanSetting with _$CommonAppFolderScanSetting {
  const factory CommonAppFolderScanSetting({
    // base path
    required String basePath,
    // install dir matcher
    required List<String> excludeDirectoryMatchers, // walk
    required int minInstallDirDepth, // build
    required int maxInstallDirDepth, // build
    required List<CommonAppFolderScanPathFieldMatcher>
        pathFieldMatcher, // build
    required CommonAppFolderScanPathFieldMatcherAlignment
        pathFieldMatcherAlignment, // build
    required List<String> includeExecutableMatchers, // walk
    required List<String> excludeExecutableMatchers, // walk
    // extra executable file matcher
    required int minExecutableDepth, // build
    required int maxExecutableDepth, // build
  }) = _CommonAppFolderScanSetting;

  factory CommonAppFolderScanSetting.empty() =>
      const CommonAppFolderScanSetting(
        basePath: '',
        excludeDirectoryMatchers:
            defaultCommonAppFolderScanExcludeDirectoryMatchers,
        minInstallDirDepth: 1,
        maxInstallDirDepth: 1,
        pathFieldMatcher: [
          CommonAppFolderScanPathFieldMatcher.name,
          CommonAppFolderScanPathFieldMatcher.ignore,
        ],
        pathFieldMatcherAlignment:
            CommonAppFolderScanPathFieldMatcherAlignment.left,
        includeExecutableMatchers: defaultCommonAppFolderScanTargetFileMatchers,
        excludeExecutableMatchers:
            defaultCommonAppFolderScanExcludeFileMatchers,
        minExecutableDepth: 1,
        maxExecutableDepth: 2,
      );

  factory CommonAppFolderScanSetting.fromJson(Map<String, Object?> json) =>
      _$CommonAppFolderScanSettingFromJson(json);
}

@freezed
class CommonAppFolderScanResult with _$CommonAppFolderScanResult {
  const factory CommonAppFolderScanResult({
    required List<InstalledCommonApps> installedApps,
    required List<CommonAppFolderScanResultDetail> details,
    required CommonAppFolderScanResultCode code,
    String? msg,
  }) = _CommonAppFolderScanResult;

  factory CommonAppFolderScanResult.fromJson(Map<String, Object?> json) =>
      _$CommonAppFolderScanResultFromJson(json);
}

enum CommonAppFolderScanResultCode {
  unavailable,
  unknownError,
  baseFolderNotFound,
  success,
}

@freezed
class CommonAppFolderScanResultDetail with _$CommonAppFolderScanResultDetail {
  const factory CommonAppFolderScanResultDetail({
    required String path,
    required CommonAppFolderScanEntryType type,
    required CommonAppFolderScanEntryStatus status,
    @Default([]) List<CommonAppFolderScanPathFieldMatcher> usedMatchers,
  }) = _CommonAppFolderScanResultDetail;

  factory CommonAppFolderScanResultDetail.fromJson(Map<String, Object?> json) =>
      _$CommonAppFolderScanResultDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class InstalledCommonApps with _$InstalledCommonApps {
  const factory InstalledCommonApps({
    required String name,
    required String version,
    required String installPath,
    required List<String> launcherPaths,
  }) = _InstalledCommonApps;

  factory InstalledCommonApps.fromJson(Map<String, Object?> json) =>
      _$InstalledCommonAppsFromJson(json);
}
