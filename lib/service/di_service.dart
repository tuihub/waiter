import 'dart:async';

import 'package:dao/dao.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../bloc/chesed/chesed_bloc.dart';
import '../bloc/deeplink_bloc.dart';
import '../bloc/gebura/gebura_bloc.dart';
import '../bloc/main_bloc.dart';
import '../bloc/netzach/netzach_bloc.dart';
import '../bloc/tiphereth/tiphereth_bloc.dart';
import '../bloc/yesod/yesod_bloc.dart';
import '../model/common_model.dart';
import '../repo/gebura_repo.dart';
import '../repo/main_repo.dart';
import '../repo/yesod_repo.dart';
import 'librarian_service.dart';

// DIService is a singleton class.
// It is used to build BLoC instances.
class DIService {
  static final DIService _instance = DIService._internal();

  DIService._internal();

  // Basic variables
  late String _dataPath;
  late PackageInfo _packageInfo;
  late AppDatabase _appDB;
  late DIProvider<LibrarianService> _apiProvider;
  final StreamController<ServerID> _currentServerController =
      StreamController.broadcast();

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
  static Future<DIService> init({
    String? dataPath,
    required PackageInfo packageInfo,
  }) async {
    await _instance._init(dataPath: dataPath, packageInfo: packageInfo);
    return _instance;
  }

  Future<void> _init({
    String? dataPath,
    required PackageInfo packageInfo,
  }) async {
    _dataPath = dataPath ?? '';
    _packageInfo = packageInfo;
    _appDB = AppDatabase(_dataPath);
    _apiProvider =
        DIProvider<LibrarianService>((_) => LibrarianService.local());
    final kvDao = KVDao(_appDB);
    final mainDao = MainDao(_appDB);
    final mainRepo =
        MainRepo(_apiProvider, mainDao, kvDao, _currentServerController.sink);
    final geburaDao = GeburaDao(_appDB);
    final geburaRepo = GeburaRepo(_apiProvider, geburaDao, kvDao);
    final yesodRepo = await YesodRepo.init(_dataPath, _appDB);
    _mainBloc = await MainBloc.init(mainRepo);
    _deepLinkBloc = DeepLinkBloc(null);
    _chesedBloc = ChesedBloc(_apiProvider);
    _geburaBloc =
        await GeburaBloc.init(geburaRepo, _currentServerController.stream);
    _netzachBloc = NetzachBloc(_apiProvider);
    _tipherethBloc = TipherethBloc(_apiProvider);
    _yesodBloc = YesodBloc(_apiProvider, yesodRepo);
  }

  ServerID currentServer = const ServerID.local();
  Stream<ConnectionStatus> get connectionStatusStream =>
      _apiProvider.get(currentServer).connectionStatusStream;
  String get dataPath => _dataPath;
  PackageInfo get packageInfo => _packageInfo;

  MainBloc? get mainBloc => _mainBloc;
  DeepLinkBloc? get deepLinkBloc => _deepLinkBloc;
  ChesedBloc? get chesedBloc => _chesedBloc;
  GeburaBloc? get geburaBloc => _geburaBloc;
  NetzachBloc? get netzachBloc => _netzachBloc;
  TipherethBloc? get tipherethBloc => _tipherethBloc;
  YesodBloc? get yesodBloc => _yesodBloc;
}

class DIProvider<T> {
  final T Function(ServerID) _defaultBuilder;
  final Map<ServerID, T> _instance = {};

  DIProvider(this._defaultBuilder);

  T get(ServerID id, {T Function(ServerID)? builder}) {
    if (!_instance.containsKey(id)) {
      _instance[id] = builder != null ? builder(id) : _defaultBuilder(id);
    }
    return _instance[id]!;
  }
}
