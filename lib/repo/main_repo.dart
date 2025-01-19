import 'package:collection/collection.dart';
import 'package:dao/dao.dart';
import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../consts.dart';
import '../model/common_model.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

class MainRepo {
  final DIProvider<LibrarianService> _api;
  final MainDao _dao;
  final KVDao _kvDao;

  MainRepo(this._api, this._dao, this._kvDao);

  static const _kvBucket = 'main';

  static const _kLastServer = 'lastServer';
  static const _kThemeMode = 'themeMode';
  static const _kTheme = 'theme';
  static const _kUIDesign = 'uiDesign';
  static const _kUseSystemProxy = 'useSystemProxy';

  Future<void> upsertServer(ServerConfig data) async {
    await _dao.upsertServer(data);
  }

  Future<List<ServerConfig>> loadServers() async {
    return _dao.loadServers();
  }

  Future<void> setLastServer(ServerID? id) async {
    if (id == null) {
      await _kvDao.remove(_kvBucket, _kLastServer);
      DIService.instance.currentServer = const ServerID.local();
    } else {
      await _kvDao.set(_kvBucket, _kLastServer, id.toJson());
      DIService.instance.currentServer = id;
    }
  }

  Future<ServerID?> getLastServer() async {
    final id = await _kvDao.get(_kvBucket, _kLastServer);
    return id == null ? null : ServerID.fromJson(id);
  }

  Future<String?> login(EventContext context,
      {ServerConfig? config, String? password}) async {
    if (config == null) {
      if (password == null) {
        throw Exception(
            'serverID and password cannot be null at the same time');
      } else {
        // Refresh login state
        return _api.get(context.sid).doLogin(password);
      }
    } else {
      // Upsert server and login
      final api = _api.get(context.sid);
      await api.loadConfig(config, await getUseSystemProxy());
      if (password != null) {
        final resp = await api.doLogin(password);
        if (resp != null) {
          return resp;
        }
      }
      // Login success
      final newConfig = api.config ?? config;
      await setLastServer(newConfig.serverID);
      await upsertServer(newConfig);
      try {
        api.serverConfigStream.listen((event) async {
          await _dao.upsertServer(event);
        });
      } catch (e) {
        debugPrint(e.toString());
      }
      return null;
    }
  }

  Future<Result<GetServerInformationResponse, String>> getServerInfo(
      EventContext context) async {
    return _api.get(context.sid).doRequest(
        (client) => client.getServerInformation, GetServerInformationRequest());
  }

  Future<Result<GetUserResponse, String>> getUser(EventContext context) async {
    return _api
        .get(context.sid)
        .doRequest((client) => client.getUser, GetUserRequest());
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
