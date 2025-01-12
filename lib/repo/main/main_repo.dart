import 'package:collection/collection.dart';
import 'package:dao/dao.dart';
import 'package:flutter/material.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../consts.dart';
import '../../service/librarian_service.dart';

class MainRepo {
  final LibrarianService _api;
  final MainDao _dao;
  final KVDao _kvDao;

  MainRepo(this._api, this._dao, this._kvDao);

  static const _kvBucket = 'main';

  static const _kLastServer = 'lastServer';
  static const _kThemeMode = 'themeMode';
  static const _kTheme = 'theme';
  static const _kUIDesign = 'uiDesign';
  static const _kUseSystemProxy = 'useSystemProxy';

  Future<void> addServer(ServerConfig data) async {
    await _dao.addServer(data);
  }

  Future<List<ServerConfig>> loadServers() async {
    return _dao.loadServers();
  }

  Future<void> setLastServer(String? id) async {
    if (id == null) {
      await _kvDao.remove(_kvBucket, _kLastServer);
    } else {
      await _kvDao.set(_kvBucket, _kLastServer, id);
    }
  }

  Future<String?> getLastServer() async {
    return _kvDao.get(_kvBucket, _kLastServer);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _kvDao.set(_kvBucket, _kThemeMode, mode.toString());
  }

  Future<ThemeMode?> getThemeMode() async {
    final mode = await _kvDao.get(_kvBucket, _kThemeMode);
    return ThemeMode.values.firstWhereOrNull(
      (e) => e.toString() == mode,
    );
  }

  Future<void> setTheme(AppTheme theme) async {
    await _kvDao.set(_kvBucket, _kTheme, theme.toString());
  }

  Future<AppTheme?> getTheme() async {
    final theme = await _kvDao.get(_kvBucket, _kTheme);
    return themeData.firstWhereOrNull(
      (e) => e.name == theme,
    );
  }

  Future<void> setUIDesign(UIDesign design) async {
    await _kvDao.set(_kvBucket, _kUIDesign, design.toString());
  }

  Future<UIDesign?> getUIDesign() async {
    final design = await _kvDao.get(_kvBucket, _kUIDesign);
    return UIDesign.values.firstWhereOrNull(
      (e) => e.toString() == design,
    );
  }

  Future<void> setUseSystemProxy(bool use) async {
    await _kvDao.set(_kvBucket, _kUseSystemProxy, use.toString());
  }

  Future<bool> getUseSystemProxy() async {
    return await _kvDao.getBool(_kvBucket, _kUseSystemProxy) ?? false;
  }
}
