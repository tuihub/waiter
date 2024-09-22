import 'dart:async';
import 'dart:typed_data';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../common/bloc_event_status_mixin.dart';
import '../common/platform.dart';
import '../consts.dart';
import '../l10n/l10n.dart';
import '../model/common_model.dart';
import '../model/tiphereth_model.dart';
import '../repo/grpc/api_helper.dart';
import '../repo/grpc/client.dart';
import '../repo/local/common.dart';
import '../repo/local/gebura.dart';
import '../repo/local/yesod.dart';
import 'chesed/chesed_bloc.dart';
import 'client_setting/client_setting_bloc.dart';
import 'deeplink_bloc.dart';
import 'gebura/gebura_bloc.dart';
import 'netzach/netzach_bloc.dart';
import 'tiphereth/tiphereth_bloc.dart';
import 'yesod/yesod_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

// MainBloc manage the basic state of the app,
// including login, logout, and server switching.
class MainBloc extends Bloc<MainEvent, MainState> {
  final ApiHelper _api;
  final ClientCommonRepo _repo;
  final ClientSettingBloc _clientSettingBloc;
  final DeepLinkBloc _deepLinkBloc;
  final PackageInfo _packageInfo;
  final String? _basePath;

  TipherethBloc? _tipherethBloc;
  GeburaBloc? _geburaBloc;
  YesodBloc? _yesodBloc;
  ChesedBloc? _chesedBloc;
  NetzachBloc? _netzachBloc;

  DeepLinkBloc get deepLinkBloc => _deepLinkBloc;
  ClientSettingBloc get clientSettingBloc => _clientSettingBloc;
  PackageInfo get packageInfo => _packageInfo;
  String? get basePath => _basePath;

  TipherethBloc? get tipherethBloc => _tipherethBloc;
  GeburaBloc? get geburaBloc => _geburaBloc;
  YesodBloc? get yesodBloc => _yesodBloc;
  ChesedBloc? get chesedBloc => _chesedBloc;
  NetzachBloc? get netzachBloc => _netzachBloc;

  Future<void> _initChild(MainState state) async {
    debugPrint(state.currentServer!.host);
    final repoPath = _basePath != null
        ? path.join(
            _basePath!,
            '${state.currentServer!.host}#${state.currentServer!.port}',
            state.currentUser!.id.id.toHexString(),
          )
        : '';
    final geburaRepo = await GeburaRepo.init(repoPath);
    final yesodRepo = await YesodRepo.init(repoPath);

    _tipherethBloc = TipherethBloc(_api);
    _geburaBloc = GeburaBloc(_api, geburaRepo, state.currentDeviceId);
    _yesodBloc = YesodBloc(_api, yesodRepo);
    _chesedBloc = ChesedBloc(_api);
    _netzachBloc = NetzachBloc(_api);
  }

  void _pruneChild() {
    _tipherethBloc = null;
    _geburaBloc = null;
    _yesodBloc = null;
    _chesedBloc = null;
    _netzachBloc = null;
  }

  MainBloc(
    this._api,
    this._repo,
    this._clientSettingBloc,
    this._deepLinkBloc,
    this._packageInfo,
    this._basePath,
  ) : super(MainState()) {
    final repo = _repo.get();

    on<MainAutoLoginEvent>((event, emit) async {
      emit(MainAutoLoginState(state, EventStatus.processing));
      debugPrint(repo.servers.toString());
      ServerConfig? config = event.config;
      if (config == null) {
        if (repo.lastServerId != null &&
            repo.servers != null &&
            repo.servers![repo.lastServerId] != null) {
          config = repo.servers![repo.lastServerId];
        }
      }
      if (config != null) {
        emit(MainAutoLoginState(
            state.copyWith(nextServer: config), EventStatus.processing));
        if (config.refreshToken != null) {
          try {
            final deviceID = config.deviceId != null
                ? InternalID(id: Int64(config.deviceId!))
                : null;
            final client = await clientFactory(
                config: config, useSystemProxy: repo.useSystemProxy);
            final refreshToken = config.refreshToken!;
            final resp = await client.refreshToken(
                RefreshTokenRequest(deviceId: deviceID),
                options: withAuth(refreshToken));
            final user = await client.getUser(GetUserRequest(),
                options: withAuth(resp.accessToken));
            final info = await client.getServerInformation(
                GetServerInformationRequest(),
                options: withAuth(resp.accessToken));
            config = config.copyWith(refreshToken: resp.refreshToken);
            final Map<String, ServerConfig> servers =
                Map.fromEntries(repo.servers?.entries ?? []);
            servers[config.id] = config;
            await _repo
                .set(repo.copyWith(lastServerId: config.id, servers: servers));
            _api.init(client, resp.accessToken, resp.refreshToken);
            final newState = MainAutoLoginState(
              state.copyWith(
                currentServer: config,
                nextServer: ServerConfig.empty(),
                accessToken: resp.accessToken,
                currentUser: user.user,
                serverInfo: ServerInformation(
                  sourceCodeAddress: info.serverBinarySummary.sourceCodeAddress,
                  buildVersion: info.serverBinarySummary.buildVersion,
                  buildDate: info.serverBinarySummary.buildDate,
                  protocolVersion: info.protocolSummary.version,
                ),
                serverFeatureSummary: info.featureSummary,
                currentDeviceId: deviceID,
                deviceInfo: await _genClientDeviceInfo(),
                knownServers: servers.values.toList(),
              ),
              EventStatus.success,
            );
            Sentry.configureScope(
              (scope) => scope.setUser(SentryUser(
                  id: user.user.id.id.toString(),
                  username: user.user.username,
                  data: {
                    'host': config?.host,
                    'port': config?.port,
                    'deviceId': config?.deviceId,
                  })),
            );
            await _initChild(newState);
            emit(newState);
            add(MainGetServerInstanceInfoEvent(config));
            return;
          } catch (e) {
            debugPrint('login by refresh token failed');
            emit(MainAutoLoginState(
              state,
              EventStatus.failed,
              msg: e.toString(),
            ));
          }
        }
      }
      debugPrint('login by refresh token failed');
      emit(MainAutoLoginState(state, EventStatus.failed));
    }, transformer: droppable());

    on<MainGetServerInstanceInfoEvent>((event, emit) async {
      if (state.knownServerInstanceSummary == null ||
          state.knownServerInstanceSummary![event.config.id] == null) {
        try {
          final client = await clientFactory(
              config: event.config, useSystemProxy: repo.useSystemProxy);
          final resp =
              await client.getServerInformation(GetServerInformationRequest());
          emit(state.copyWith(
            knownServerInstanceSummary: {
              ...state.knownServerInstanceSummary ?? {},
              event.config.id: resp.serverInstanceSummary,
            },
          ));
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    });

    on<MainSetNextServerConfigEvent>((event, emit) async {
      debugPrint('set next server config ${event.config}');
      add(MainGetServerInstanceInfoEvent(event.config));
      emit(MainNewServerSetState(state.copyWith(nextServer: event.config)));
    });

    on<MainClearNextServerConfigEvent>((event, emit) async {
      emit(MainNewServerSetState(
          state.copyWith(nextServer: ServerConfig.empty())));
    });

    on<MainManualLoginEvent>((event, emit) async {
      if (state.nextServer == null) {
        return;
      }
      emit(MainManualLoginState(state, EventStatus.processing));

      try {
        var config = state.nextServer!;
        final client = await clientFactory(
            config: config, useSystemProxy: repo.useSystemProxy);
        final deviceInfo = await _genClientDeviceInfo();
        late InternalID deviceID;
        late String accessToken;
        late String refreshToken;
        if (repo.servers != null && repo.servers![config.id] != null) {
          config = repo.servers![config.id]!.copyWith(tls: config.tls);
        }
        if (config.deviceId == null) {
          debugPrint('register device');
          final token = await client.getToken(
            GetTokenRequest(username: event.username, password: event.password),
          );
          final id = await client.registerDevice(
              RegisterDeviceRequest(
                deviceInfo: DeviceInfo(
                  deviceName: deviceInfo.deviceName,
                  systemType: PlatformHelper.getSystemType(),
                  systemVersion: deviceInfo.systemVersion,
                  clientName: _packageInfo.appName,
                  clientSourceCodeAddress: clientSourceCodeUrl,
                  clientVersion: _packageInfo.version,
                ),
              ),
              options: withAuth(token.accessToken));
          deviceID = id.deviceId;
          config = config.copyWith(deviceId: id.deviceId.id.toInt());
          final Map<String, ServerConfig> servers =
              Map.fromEntries(repo.servers?.entries ?? []);
          servers[config.id] = config;
          await _repo.set(repo.copyWith(servers: servers));
          final resp = await client.refreshToken(
              RefreshTokenRequest(deviceId: id.deviceId),
              options: withAuth(token.refreshToken));
          accessToken = resp.accessToken;
          refreshToken = resp.refreshToken;
        } else {
          deviceID = InternalID()..id = Int64(config.deviceId!);
          final resp = await client.getToken(
            GetTokenRequest(
                username: event.username,
                password: event.password,
                deviceId: deviceID),
          );
          accessToken = resp.accessToken;
          refreshToken = resp.refreshToken;
        }
        final user = await client.getUser(GetUserRequest(),
            options: withAuth(accessToken));
        final info = await client.getServerInformation(
            GetServerInformationRequest(),
            options: withAuth(accessToken));
        config = config.copyWith(refreshToken: refreshToken);
        final Map<String, ServerConfig> servers =
            Map.fromEntries(repo.servers?.entries ?? []);
        servers[config.id] = config;
        await _repo
            .set(repo.copyWith(lastServerId: config.id, servers: servers));
        _api.init(client, accessToken, refreshToken);
        final newState = MainManualLoginState(
          state.copyWith(
            currentServer: config,
            nextServer: ServerConfig.empty(),
            accessToken: accessToken,
            currentUser: user.user,
            serverInfo: ServerInformation(
              sourceCodeAddress: info.serverBinarySummary.sourceCodeAddress,
              buildVersion: info.serverBinarySummary.buildVersion,
              buildDate: info.serverBinarySummary.buildDate,
              protocolVersion: info.protocolSummary.version,
            ),
            serverFeatureSummary: info.featureSummary,
            currentDeviceId: deviceID,
            deviceInfo: deviceInfo,
            knownServers: servers.values.toList(),
          ),
          EventStatus.success,
        );
        Sentry.configureScope(
          (scope) => scope.setUser(SentryUser(
              id: user.user.id.id.toString(),
              username: user.user.username,
              data: {
                'host': config.host,
                'port': config.port,
                'deviceId': config.deviceId,
              })),
        );
        await _initChild(newState);
        add(MainGetServerInstanceInfoEvent(config));
        emit(newState);
      } catch (e) {
        debugPrint(e.toString());
        emit(
            MainManualLoginState(state, EventStatus.failed, msg: e.toString()));
      }
    }, transformer: droppable());

    on<MainRefreshServerInfoEvent>((event, emit) async {
      if (state.currentServer == null) {
        return;
      }
      if (state.lastRefreshServerInfo != null &&
          DateTime.now().difference(state.lastRefreshServerInfo!) <
              const Duration(minutes: 1)) {
        return;
      }
      final resp = await _api.doRequest((client) => client.getServerInformation,
          GetServerInformationRequest());
      if (resp.status == ApiStatus.success) {
        final info = resp.getData();
        emit(state.copyWith(
          serverInfo: ServerInformation(
            sourceCodeAddress: info.serverBinarySummary.sourceCodeAddress,
            buildVersion: info.serverBinarySummary.buildVersion,
            buildDate: info.serverBinarySummary.buildDate,
            protocolVersion: info.protocolSummary.version,
          ),
          serverFeatureSummary: info.featureSummary,
          lastRefreshServerInfo: DateTime.now(),
        ));
      }
    }, transformer: droppable());

    on<MainLogoutEvent>((event, emit) async {
      _pruneChild();
      emit(MainState());
    });

    on<MainRegisterEvent>((event, emit) async {
      if (state.nextServer == null) {
        return;
      }
      emit(MainRegisterState(state, EventStatus.processing));

      try {
        final config = state.nextServer!;
        final client = await clientFactory(
            config: config, useSystemProxy: repo.useSystemProxy);
        final captcha = event.captchaID != null && event.captchaAns != null
            ? RegisterUserRequest_Captcha(
                id: event.captchaID, value: event.captchaAns)
            : null;
        final resp = await client.registerUser(RegisterUserRequest(
          username: event.username,
          password: event.password,
          captcha: captcha,
        ));
        if (resp.hasRefreshToken()) {
          emit(
            MainRegisterState(
                state.copyWith(
                  nextServer: state.nextServer!.copyWith(
                    refreshToken: resp.refreshToken,
                  ),
                ),
                EventStatus.success),
          );
        } else if (resp.hasCaptcha()) {
          final image = Uint8List.fromList(resp.captcha.image);
          emit(
            MainRegisterState(
              state,
              EventStatus.failed,
              captchaID: resp.captcha.id,
              captchaImage: image,
              msg: S.current.captchaRequired,
            ),
          );
        } else {
          emit(
            MainRegisterState(
              state,
              EventStatus.failed,
              msg: S.current.unknownErrorOccurred,
            ),
          );
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(MainRegisterState(state, EventStatus.failed, msg: e.toString()));
      }
    }, transformer: droppable());
  }

  int cacheSize() {
    return _yesodBloc?.cacheSize() ?? 0;
  }

  Future<void> clearCache() async {
    await _yesodBloc?.clearCache();
  }
}

Future<ClientDeviceInfo> _genClientDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  if (PlatformHelper.isAndroidApp()) {
    final androidInfo = await deviceInfo.androidInfo;
    return ClientDeviceInfo(androidInfo.model, androidInfo.version.release);
  } else if (PlatformHelper.isWindowsApp()) {
    final windowsInfo = await deviceInfo.windowsInfo;
    return ClientDeviceInfo(
      windowsInfo.computerName,
      '${windowsInfo.productName} ${windowsInfo.displayVersion}',
    );
  } else if (PlatformHelper.isWeb()) {
    final webInfo = await deviceInfo.webBrowserInfo;
    return ClientDeviceInfo(
      _browserNameToString(webInfo.browserName),
      webInfo.platform ?? S.current.unknown,
    );
  } else {
    return ClientDeviceInfo(S.current.unknown, S.current.unknown);
  }
}

String _browserNameToString(BrowserName browserName) {
  switch (browserName) {
    case BrowserName.chrome:
      return S.current.chrome;
    case BrowserName.edge:
      return S.current.edge;
    case BrowserName.firefox:
      return S.current.firefox;
    case BrowserName.safari:
      return S.current.safari;
    case BrowserName.samsungInternet:
      return S.current.samsung;
    case BrowserName.opera:
      return S.current.opera;
    case BrowserName.msie:
      return S.current.msie;
    case BrowserName.unknown:
      return S.current.unknown;
  }
}
