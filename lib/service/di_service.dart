import 'dart:async';

import 'package:dao/dao.dart';
import 'package:flutter/foundation.dart';
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
import '../repo/netzach_repo.dart';
import '../repo/tiphereth_repo.dart';
import '../repo/yesod_repo.dart';
import 'librarian_service.dart';

// DIService is a singleton class.
// It is used to build BLoC instances.
class DIService {
  static final DIService _instance = DIService._internal();

  DIService._internal();

  // Basic variables
  bool _initialized = false;
  late String _dataPath;
  late PackageInfo _packageInfo;
  late AppDatabase _appDB;
  late DIProvider<LibrarianService> _apiProvider;
  ServerID _currentServer = const ServerID.local();
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
    required String dataPath,
    required PackageInfo packageInfo,
  }) async {
    if (!_instance._initialized) {
      _instance._currentServerController.stream.listen((event) {
        debugPrint('Switch to new server: $event');
        _instance._currentServer = event;
      });
      await _instance._init(dataPath: dataPath, packageInfo: packageInfo);
      _instance._initialized = true;
    }
    return _instance;
  }

  Future<void> _init({
    required String dataPath,
    required PackageInfo packageInfo,
  }) async {
    _dataPath = dataPath;
    _packageInfo = packageInfo;
    _apiProvider =
        DIProvider<LibrarianService>((_) => LibrarianService.local());
    _appDB = AppDatabase(_dataPath);
    final kvDao = KVDao(_appDB);

    _mainBloc = await MainBloc.init(
      MainRepo(
          MainDao(_appDB), _apiProvider, kvDao, _currentServerController.sink),
      _currentServerController.stream,
    );

    _deepLinkBloc = DeepLinkBloc(null);

    _chesedBloc = ChesedBloc(_apiProvider);

    _geburaBloc = await GeburaBloc.init(
      GeburaRepo(GeburaDao(_appDB), _apiProvider, kvDao, _dataPath),
      _currentServerController.stream,
    );

    _netzachBloc = await NetzachBloc.init(
      NetzachRepo(_apiProvider, kvDao),
      _currentServerController.stream,
      _apiProvider,
    );

    _tipherethBloc = await TipherethBloc.init(
      TipherethRepo(_apiProvider, kvDao),
      _currentServerController.stream,
      _apiProvider,
    );

    _yesodBloc = await YesodBloc.init(
      YesodRepo(YesodDao(_appDB), _apiProvider, kvDao),
      _currentServerController.stream,
      _apiProvider,
    );
  }

  ServerID get currentServer => _currentServer;
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
