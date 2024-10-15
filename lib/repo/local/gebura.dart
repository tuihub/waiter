import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sentry_hive/sentry_hive.dart';

import '../../common/app_scan/model.dart';
import '../../model/gebura_model.dart';

const _geburaTrackedAppsFile = 'gebura_tracked_apps';
const _geburaTrackedAppInstsFile = 'gebura_tracked_app_insts';
const _geburaTrackedCommonAppFolder = 'gebura_tracked_common_app_folder';

class GeburaRepo {
  late Box<String> _trackedApps;
  late Box<String> _trackedAppInsts;
  late Box<String> _trackedCommonAppFolder;

  GeburaRepo._init({
    required Box<String> trackedApps,
    required Box<String> trackedAppInsts,
    required Box<String> trackedCommonAppFolder,
  }) {
    _trackedApps = trackedApps;
    _trackedAppInsts = trackedAppInsts;
    _trackedCommonAppFolder = trackedCommonAppFolder;
  }

  static Future<GeburaRepo> init(String? commonPath, String? serverPath) async {
    final trackedApps = await SentryHive.openBox<String>(_geburaTrackedAppsFile,
        path: commonPath);
    final trackedAppInsts = await SentryHive.openBox<String>(
        _geburaTrackedAppInstsFile,
        path: commonPath);
    final trackedCommonAppFolder = await SentryHive.openBox<String>(
        _geburaTrackedCommonAppFolder,
        path: commonPath);
    return GeburaRepo._init(
      trackedApps: trackedApps,
      trackedAppInsts: trackedAppInsts,
      trackedCommonAppFolder: trackedCommonAppFolder,
    );
  }

  Future<void> setTrackedApp(LocalTrackedApp trackedApp) async {
    await _trackedApps.put(trackedApp.uuid, jsonEncode(trackedApp.toJson()));
    await _trackedApps.flush();
  }

  LocalTrackedApp? getTrackedApp(String uuid) {
    final trackedApp = _trackedApps.get(uuid);
    if (trackedApp != null) {
      return LocalTrackedApp.fromJson(
          jsonDecode(trackedApp) as Map<String, dynamic>);
    }
    return null;
  }

  List<LocalTrackedApp> loadTrackedApps() {
    final trackedApps = <LocalTrackedApp>[];
    for (final key in _trackedApps.keys) {
      final trackedApp = _trackedApps.get(key);
      if (trackedApp != null) {
        trackedApps.add(LocalTrackedApp.fromJson(
            jsonDecode(trackedApp) as Map<String, dynamic>));
      }
    }
    return trackedApps;
  }

  Future<void> removeTrackedApp(String uuid) async {
    await _trackedApps.delete(uuid);
  }

  Future<void> setTrackedAppInst(LocalTrackedAppInst trackedAppInst) async {
    await _trackedAppInsts.put(
        trackedAppInst.uuid, jsonEncode(trackedAppInst.toJson()));
    await _trackedAppInsts.flush();
  }

  LocalTrackedAppInst? getTrackedAppInst(String uuid) {
    final trackedAppInst = _trackedAppInsts.get(uuid);
    if (trackedAppInst != null) {
      return LocalTrackedAppInst.fromJson(
          jsonDecode(trackedAppInst) as Map<String, dynamic>);
    }
    return null;
  }

  List<LocalTrackedAppInst> loadTrackedAppInsts() {
    final trackedAppInsts = <LocalTrackedAppInst>[];
    for (final key in _trackedAppInsts.keys) {
      final trackedAppInst = _trackedAppInsts.get(key);
      if (trackedAppInst != null) {
        trackedAppInsts.add(LocalTrackedAppInst.fromJson(
            jsonDecode(trackedAppInst) as Map<String, dynamic>));
      }
    }
    return trackedAppInsts;
  }

  Future<void> removeTrackedAppInst(String uuid) async {
    await _trackedAppInsts.delete(uuid);
  }

  Future<void> setTrackedCommonAppFolder(
      CommonAppFolderScanSetting trackedCommonAppFolder) async {
    await _trackedCommonAppFolder.put(trackedCommonAppFolder.basePath,
        jsonEncode(trackedCommonAppFolder.toJson()));
    await _trackedCommonAppFolder.flush();
  }

  CommonAppFolderScanSetting? getTrackedCommonAppFolder(String basePath) {
    final trackedCommonAppFolder = _trackedCommonAppFolder.get(basePath);
    if (trackedCommonAppFolder != null) {
      return CommonAppFolderScanSetting.fromJson(
          jsonDecode(trackedCommonAppFolder) as Map<String, dynamic>);
    }
    return null;
  }

  List<CommonAppFolderScanSetting> loadTrackedCommonAppFolders() {
    final trackedCommonAppFolders = <CommonAppFolderScanSetting>[];
    for (final key in _trackedCommonAppFolder.keys) {
      final trackedCommonAppFolder = _trackedCommonAppFolder.get(key);
      if (trackedCommonAppFolder != null) {
        trackedCommonAppFolders.add(CommonAppFolderScanSetting.fromJson(
            jsonDecode(trackedCommonAppFolder) as Map<String, dynamic>));
      }
    }
    return trackedCommonAppFolders;
  }

  Future<void> removeTrackedCommonAppFolder(String basePath) async {
    await _trackedCommonAppFolder.delete(basePath);
  }
}
