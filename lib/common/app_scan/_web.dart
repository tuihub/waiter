import 'model.dart';

Future<CommonAppFolderScanResult> scanCommonApps(
    CommonAppFolderScanSetting setting) async {
  return const CommonAppFolderScanResult(
    installedApps: [],
    details: [],
    code: CommonAppFolderScanResultCode.unavailable,
  );
}
