import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

const defaultCommonAppScanTargetFileMatchers = <String>[
  '*.exe',
  '*.bat',
];

const defaultCommonAppScanExcludeFileMatchers = <String>[
  'UnityCrashHandler64.exe',
  'UnityCrashHandler32.exe',
  'UnityCrashHandler.exe',
  'ReiPatcher.exe',
  'Lec.ExtProtocol.exe',
  'ezTransXP.ExtProtocol.exe',
  'Common.ExtProtocol.Executor.exe',
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

const defaultCommonAppScanExcludeDirectoryMatchers = <String>[
  '.*',
];

const allowedMinInstallDirDepth = 1;
const allowedMaxInstallDirDepth = 20;
const allowedMinExecutableDepth = 1;
const allowedMaxExecutableDepth = 20;

@MappableClass()
class CommonAppScan with CommonAppScanMappable {
  final String uuid;
  // base
  final String basePath;
  final bool enableAutoScan;
  // install dir matcher
  final List<String> excludeDirectoryMatchers; // walk
  final int minInstallDirDepth; // build
  final int maxInstallDirDepth; // build
  final List<CommonAppScanPathFieldMatcher> pathFieldMatcher; // build
  final CommonAppScanPathFieldMatcherAlignment
      pathFieldMatcherAlignment; // build
  final List<String> includeExecutableMatchers; // walk
  final List<String> excludeExecutableMatchers; // walk
  // extra executable file matcher
  final int minExecutableDepth; // build
  final int maxExecutableDepth; // build

  const CommonAppScan({
    required this.uuid,
    required this.basePath,
    this.enableAutoScan = true,
    this.excludeDirectoryMatchers =
        defaultCommonAppScanExcludeDirectoryMatchers,
    this.minInstallDirDepth = 1,
    this.maxInstallDirDepth = 1,
    this.pathFieldMatcher = const [
      CommonAppScanPathFieldMatcher.name,
      CommonAppScanPathFieldMatcher.ignore,
    ],
    this.pathFieldMatcherAlignment =
        CommonAppScanPathFieldMatcherAlignment.left,
    this.includeExecutableMatchers = defaultCommonAppScanTargetFileMatchers,
    this.excludeExecutableMatchers = defaultCommonAppScanExcludeFileMatchers,
    this.minExecutableDepth = 1,
    this.maxExecutableDepth = 2,
  });

  static const fromMap = CommonAppScanMapper.fromMap;
  static const fromJson = CommonAppScanMapper.fromJson;
}

@MappableClass()
class CommonAppFolderScanResult with CommonAppFolderScanResultMappable {
  final List<InstalledCommonApps> installedApps;
  final List<CommonAppFolderScanResultDetail> details;
  final CommonAppFolderScanResultCode code;
  final String? msg;

  const CommonAppFolderScanResult({
    required this.installedApps,
    required this.details,
    required this.code,
    this.msg,
  });
}

enum CommonAppFolderScanResultCode {
  unavailable,
  unknownError,
  baseFolderNotFound,
  success,
}

@MappableClass()
class CommonAppFolderScanResultDetail
    with CommonAppFolderScanResultDetailMappable {
  final String path;
  final CommonAppFolderScanEntryType type;
  final CommonAppFolderScanEntryStatus status;
  final List<CommonAppScanPathFieldMatcher> usedMatchers;

  CommonAppFolderScanResultDetail({
    required this.path,
    required this.type,
    required this.status,
    this.usedMatchers = const [],
  });
}

@MappableClass()
class InstalledCommonApps with InstalledCommonAppsMappable {
  final String name;
  final String version;
  final String installPath;
  final List<String> launcherPaths;

  const InstalledCommonApps({
    required this.name,
    required this.version,
    required this.installPath,
    required this.launcherPaths,
  });
}

enum CommonAppScanPathFieldMatcher {
  ignore,
  name,
  version,
}

enum CommonAppScanPathFieldMatcherAlignment {
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
