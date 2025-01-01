import 'package:collection/collection.dart';
import 'package:dao/dao.dart';

import '../../service/librarian_service.dart';
import '../../view/universal/common.dart';

class MainRepo {
  final LibrarianService _api;
  final MainDao _dao;
  final KVDao _kvDao;

  MainRepo(this._api, this._dao, this._kvDao);

  static const _kvBucket = 'main';

  static const _kLastServer = 'lastServer';
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
