import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sentry_hive/sentry_hive.dart';

import '../../model/gebura_model.dart';

const _geburaTrackedAppsFile = 'gebura_tracked_apps';
const _geburaTrackedAppInstsFile = 'gebura_tracked_app_insts';

const _localAppInstFoldersFile = 'gebura_local_app_inst_folders';
const _localAppInstIndependentsFile = 'gebura_local_app_inst_independents';

class GeburaRepo {
  late Box<String> _trackedApps;
  late Box<String> _trackedAppInsts;

  late Box<String> _localAppInstFolders;
  late Box<String> _localAppInstIndependents;

  GeburaRepo._init(
    Box<String> trackedApps,
    Box<String> trackedAppInsts,
    Box<String> localAppInstFolders,
    Box<String> localAppInstIndependents,
  ) {
    _trackedApps = trackedApps;
    _trackedAppInsts = trackedAppInsts;

    _localAppInstFolders = localAppInstFolders;
    _localAppInstIndependents = localAppInstIndependents;
  }

  static Future<GeburaRepo> init(String? commonPath, String? serverPath) async {
    final trackedApps = await SentryHive.openBox<String>(_geburaTrackedAppsFile,
        path: commonPath);
    final trackedAppInsts = await SentryHive.openBox<String>(
        _geburaTrackedAppInstsFile,
        path: commonPath);
    final localAppInstFolders = await SentryHive.openBox<String>(
        _localAppInstFoldersFile,
        path: serverPath);
    final localAppInstIndependents = await SentryHive.openBox<String>(
        _localAppInstIndependentsFile,
        path: serverPath);
    return GeburaRepo._init(
      trackedApps,
      trackedAppInsts,
      localAppInstFolders,
      localAppInstIndependents,
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

  Future<void> setLocalAppInstFolder(LocalAppInstFolder folder) async {
    await _localAppInstFolders.put(folder.path, jsonEncode(folder.toJson()));
    await _localAppInstFolders.flush();
  }

  Future<void> removeLocalAppInstFolder(String path) async {
    await _localAppInstFolders.delete(path);
  }

  List<LocalAppInstFolder> getLocalAppInstFolders() {
    final folders = <LocalAppInstFolder>[];
    for (final key in _localAppInstFolders.keys) {
      final folder = _localAppInstFolders.get(key);
      if (folder != null) {
        folders.add(LocalAppInstFolder.fromJson(
            jsonDecode(folder) as Map<String, dynamic>));
      }
    }
    return folders;
  }

  Future<void> setLocalAppInstIndependent(
      LocalAppInstIndependent independent) async {
    await _localAppInstIndependents.put(
        independent.appInstID.toString(), jsonEncode(independent.toJson()));
    await _localAppInstIndependents.flush();
  }

  Future<void> removeLocalAppInstIndependent(int appInstID) async {
    await _localAppInstIndependents.delete(appInstID.toString());
  }

  List<LocalAppInstIndependent> getLocalAppInstIndependents() {
    final independents = <LocalAppInstIndependent>[];
    for (final key in _localAppInstIndependents.keys) {
      final independent = _localAppInstIndependents.get(key);
      if (independent != null) {
        independents.add(LocalAppInstIndependent.fromJson(
            jsonDecode(independent) as Map<String, dynamic>));
      }
    }
    return independents;
  }
}
