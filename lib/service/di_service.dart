import 'package:dao/dao.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../bloc/chesed/chesed_bloc.dart';
import '../bloc/deeplink_bloc.dart';
import '../bloc/gebura/gebura_bloc.dart';
import '../bloc/main_bloc.dart';
import '../bloc/netzach/netzach_bloc.dart';
import '../bloc/tiphereth/tiphereth_bloc.dart';
import '../bloc/yesod/yesod_bloc.dart';
import '../repo/gebura/gebura_repo.dart';
import '../repo/local/yesod.dart';
import '../repo/main/main_repo.dart';
import 'librarian_service.dart';

// DIService is a singleton class.
// It is used to build BLoC instances.
class DIService {
  static final DIService _instance = DIService._internal();

  DIService._internal();

  // Basic variables
  late String _dataPath;
  late PackageInfo _packageInfo;

  // BLoC instances
  MainBloc? _mainBloc;
  DeepLinkBloc? _deepLinkBloc;
  ChesedBloc? _chesedBloc;
  GeburaBloc? _geburaBloc;
  NetzachBloc? _netzachBloc;
  TipherethBloc? _tipherethBloc;
  YesodBloc? _yesodBloc;

  // Public
  static DIService get instance => _instance;
  static Future<DIService> init({String? dataPath, required PackageInfo packageInfo}) async {
    _instance._dataPath = dataPath ?? '';
    _instance._packageInfo = packageInfo;
    await _instance.buildBlocs();
    return _instance;
  }

  String get dataPath => _dataPath;
  PackageInfo get packageInfo => _packageInfo;

  MainBloc? get mainBloc => _mainBloc;
  DeepLinkBloc? get deepLinkBloc => _deepLinkBloc;
  ChesedBloc? get chesedBloc => _chesedBloc;
  GeburaBloc? get geburaBloc => _geburaBloc;
  NetzachBloc? get netzachBloc => _netzachBloc;
  TipherethBloc? get tipherethBloc => _tipherethBloc;
  YesodBloc? get yesodBloc => _yesodBloc;

  Future<void> buildBlocs({String? dataPath}) async {
    if (dataPath != null) {
      _dataPath = dataPath;
    }
    final api = LibrarianService.local();
    final appDB = AppDatabase(_dataPath);
    final kvDao = KVDao(appDB);
    final mainDao = MainDao(appDB);
    final mainRepo = MainRepo(api, mainDao, kvDao);
    final geburaDao = GeburaDao(appDB);
    final geburaRepo = GeburaRepo(api, geburaDao, kvDao);
    final yesodRepo = await YesodRepo.init(_dataPath);
    _mainBloc = MainBloc(api, mainRepo);
    _deepLinkBloc = DeepLinkBloc(null);
    _chesedBloc = ChesedBloc(api);
    _geburaBloc = GeburaBloc(geburaRepo);
    _netzachBloc = NetzachBloc(api);
    _tipherethBloc = TipherethBloc(api);
    _yesodBloc = YesodBloc(api, yesodRepo);
  }
}
