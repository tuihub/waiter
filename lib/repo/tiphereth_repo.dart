import 'package:dao/dao.dart';

import '../service/di_service.dart';
import '../service/librarian_service.dart';

class TipherethRepo {
  final DIProvider<LibrarianService> _api;
  final KVDao _kvDao;

  static const _kvBucket = 'tiphereth';

  TipherethRepo(this._api, this._kvDao);
}
