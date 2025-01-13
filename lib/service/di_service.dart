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
  String _dataPath = '';
  late PackageInfo _packageInfo;
  AppDatabase? _appDB;

  // BLoC instances
  MainBloc? _mainBloc;
  DeepLinkBloc? _deepLinkBloc;
  ChesedBloc? _chesedBloc;
  GeburaBloc? _geburaBloc;
  NetzachBloc? _netzachBloc;
  TipherethBloc? _tipherethBloc;
  YesodBloc? _yesodBloc;

  int _counter = 0;

  // Public
  static DIService get instance => _instance;
  static Future<DIService> init(
      {String? dataPath, required PackageInfo packageInfo}) async {
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

  int get counter => _counter;

  Future<void> buildBlocs({String? dataPath, LibrarianService? api}) async {
    if (dataPath != null) {
      if (_dataPath != dataPath) {
        _appDB = AppDatabase(_dataPath);
      }
      _dataPath = dataPath;
    }
    _appDB = _appDB ?? AppDatabase(_dataPath);
    final appDB = _appDB!;
    final apiService = api ?? LibrarianService.local();
    final kvDao = KVDao(appDB);
    final mainDao = MainDao(appDB);
    final mainRepo = MainRepo(apiService, mainDao, kvDao);
    final geburaDao = GeburaDao(appDB);
    final geburaRepo = GeburaRepo(apiService, geburaDao, kvDao);
    final yesodRepo = await YesodRepo.init(_dataPath, appDB);
    _mainBloc = await MainBloc.init(apiService, mainRepo);
    _deepLinkBloc = DeepLinkBloc(null);
    _chesedBloc = ChesedBloc(apiService);
    _geburaBloc = GeburaBloc(geburaRepo);
    _netzachBloc = NetzachBloc(apiService);
    _tipherethBloc = TipherethBloc(apiService);
    _yesodBloc = YesodBloc(apiService, yesodRepo);
    _counter++;
  }
}
