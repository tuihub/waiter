import 'dart:async';
import 'dart:typed_data';

import 'package:animated_tree_view/node/indexed_node.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dao/dao.dart';
import 'package:dart_mappable/dart_mappable.dart';
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
import '../repo/gebura/gebura_repo.dart';
import '../repo/local/yesod.dart';
import '../repo/main/main_repo.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';
import 'chesed/chesed_bloc.dart';
import 'client_setting/client_setting_bloc.dart';
import 'deeplink_bloc.dart';
import 'gebura/gebura_bloc.dart';
import 'netzach/netzach_bloc.dart';
import 'tiphereth/tiphereth_bloc.dart';
import 'yesod/yesod_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.mapper.dart';

// MainBloc manage the basic state of the app,
// including login, logout, and server switching.
class MainBloc extends Bloc<MainEvent, MainState> {
  final LibrarianService _api;
  final MainRepo _repo;

  bool get isLocal => _api.connectionStatus == ConnectionStatus.local;

  MainBloc(
    this._api,
    this._repo,
  ) : super(MainState()) {
    _api.connectionStatusStream.listen((event) {
      if (event == ConnectionStatus.connected) {
        add(MainRefreshServerInfoEvent());
      }
    });

    on<MainInitEvent>((event, emit) async {
      final lastServer = await _repo.getLastServer();
      final servers = await _repo.loadServers();
      debugPrint(servers.toString());
      final serverMap = Map.fromEntries(servers.map((e) => MapEntry(e.uniqueKey, e)));
      final ServerConfig? config = serverMap[lastServer];
      if (config != null) {
        await _api.newServerConfig(config);
        await DIService.instance.buildBlocs();
        emit(MainInitState(state.copyWith(
          currentServer: config.uniqueKey,
          knownServers: serverMap,
        ), EventStatus.success));
      } else {
        emit(MainInitState(state.copyWith(
          knownServers: serverMap,
        ), EventStatus.success));
      }
    }, transformer: droppable());


    on<MainSetNextServerConfigEvent>((event, emit) async {
      // debugPrint('set next server config ${event.config}');
      // add(MainGetServerInstanceInfoEvent(event.config));
      // emit(MainNewServerSetState(state.copyWith(nextServer: event.config)));
    });

    on<MainClearNextServerConfigEvent>((event, emit) async {
      // emit(MainNewServerSetState(
      //     state.copyWith(nextServer: ServerConfig.empty())));
    });

    on<MainManualLoginEvent>((event, emit) async {
      // if (state.nextServer == null) {
      //   return;
      // }
      // emit(MainManualLoginState(state, EventStatus.processing));
      //
      // try {
      //   var config = state.nextServer!;
      //   final client = await clientFactory(
      //       config: config, useSystemProxy: repo.useSystemProxy);
      //   final deviceInfo = await _genClientDeviceInfo();
      //   late InternalID deviceID;
      //   late String accessToken;
      //   late String refreshToken;
      //   if (repo.servers != null && repo.servers![config.id] != null) {
      //     config = repo.servers![config.id]!.copyWith(tls: config.tls);
      //   }
      //   if (config.deviceId == null) {
      //     debugPrint('register device');
      //     final token = await client.getToken(
      //       GetTokenRequest(username: event.username, password: event.password),
      //     );
      //     final id = await client.registerDevice(
      //         RegisterDeviceRequest(
      //           deviceInfo: DeviceInfo(
      //             deviceName: deviceInfo.deviceName,
      //             systemType: PlatformHelper.getSystemType(),
      //             systemVersion: deviceInfo.systemVersion,
      //             clientName: _packageInfo.appName,
      //             clientSourceCodeAddress: clientSourceCodeUrl,
      //             clientVersion: _packageInfo.version,
      //           ),
      //         ),
      //         options: withAuth(token.accessToken));
      //     deviceID = id.deviceId;
      //     config = config.copyWith(deviceId: id.deviceId.id.toInt());
      //     final Map<String, ServerConfig> servers =
      //         Map.fromEntries(repo.servers?.entries ?? []);
      //     servers[config.id] = config;
      //     await _repo.set(repo.copyWith(servers: servers));
      //     final resp = await client.refreshToken(
      //         RefreshTokenRequest(deviceId: id.deviceId),
      //         options: withAuth(token.refreshToken));
      //     accessToken = resp.accessToken;
      //     refreshToken = resp.refreshToken;
      //   } else {
      //     deviceID = InternalID()..id = Int64(config.deviceId!);
      //     final resp = await client.getToken(
      //       GetTokenRequest(
      //           username: event.username,
      //           password: event.password,
      //           deviceId: deviceID),
      //     );
      //     accessToken = resp.accessToken;
      //     refreshToken = resp.refreshToken;
      //   }
      //   final user = await client.getUser(GetUserRequest(),
      //       options: withAuth(accessToken));
      //   final info = await client.getServerInformation(
      //       GetServerInformationRequest(),
      //       options: withAuth(accessToken));
      //   config = config.copyWith(refreshToken: refreshToken);
      //   final Map<String, ServerConfig> servers =
      //       Map.fromEntries(repo.servers?.entries ?? []);
      //   servers[config.id] = config;
      //   await _repo
      //       .set(repo.copyWith(lastServerId: config.id, servers: servers));
      //   // GetIt.I.registerSingleton(
      //   //     ApiHelper.librarian_service(client, accessToken, refreshToken));
      //   final newState = MainManualLoginState(
      //     state.copyWith(
      //       currentServer: config,
      //       nextServer: ServerConfig.empty(),
      //       accessToken: accessToken,
      //       currentUser: user.user,
      //       serverInfo: ServerInformation(
      //         sourceCodeAddress: info.serverBinarySummary.sourceCodeAddress,
      //         buildVersion: info.serverBinarySummary.buildVersion,
      //         buildDate: info.serverBinarySummary.buildDate,
      //         protocolVersion: info.protocolSummary.version,
      //       ),
      //       serverFeatureSummary: info.featureSummary,
      //       currentDeviceId: deviceID,
      //       deviceInfo: deviceInfo,
      //       knownServers: servers.values.toList(),
      //     ),
      //     EventStatus.success,
      //   );
      //   await Sentry.configureScope(
      //     (scope) => scope.setUser(SentryUser(
      //         id: user.user.id.id.toString(),
      //         username: user.user.username,
      //         data: {
      //           'host': config.host,
      //           'port': config.port,
      //           'deviceId': config.deviceId,
      //         })),
      //   );
      //   await _initChild(newState);
      //   add(MainGetServerInstanceInfoEvent(config));
      //   emit(newState);
      // } catch (e) {
      //   debugPrint(e.toString());
      //   emit(
      //       MainManualLoginState(state, EventStatus.failed, msg: e.toString()));
      // }
    }, transformer: droppable());

    on<MainRefreshServerInfoEvent>((event, emit) async {
      if (isLocal) {
        return;
      }
      if (event.server == null && state.currentServer == null) {
        return;
      }
      final currentServer = event.server ?? state.currentServer!;
      var newState = state;
      final resp = await _api.doRequest((client) => client.getServerInformation,
          GetServerInformationRequest());
      if (resp case Ok()) {
        final info = resp.v;
        final knownServerInfos = {
          currentServer: ServerInformation(
            sourceCodeAddress: info.serverBinarySummary.sourceCodeAddress,
            buildVersion: info.serverBinarySummary.buildVersion,
            buildDate: info.serverBinarySummary.buildDate,
            protocolVersion: info.protocolSummary.version,
          ),
          ...state.knownServerInfos,
        };
        final knownServerFeatureSummaries = {
          currentServer: info.featureSummary,
          ...state.knownServerFeatureSummaries,
        };
        final knownServerInstanceSummaries = {
          currentServer: info.serverInstanceSummary,
          ...state.knownServerInstanceSummaries,
        };
        newState = newState.copyWith(
          knownServerInfos: knownServerInfos,
          knownServerFeatureSummaries: knownServerFeatureSummaries,
          knownServerInstanceSummaries: knownServerInstanceSummaries,
        );
      }
      final resp2 = await _api.doRequest(
              (client) => client.getUser,
          GetUserRequest());
      if (resp2 case Ok()) {
        final user = resp2.v;
        newState = newState.copyWith(currentUser: user.user);
      }
      emit(newState);
    }, transformer: restartable());

    on<MainLogoutEvent>((event, emit) async {
      // _pruneChild();
      // emit(MainState());
    });

    on<MainRegisterEvent>((event, emit) async {
      // if (state.nextServer == null) {
      //   return;
      // }
      // emit(MainRegisterState(state, EventStatus.processing));
      //
      // try {
      //   final config = state.nextServer!;
      //   final client = await clientFactory(
      //       config: config, useSystemProxy: repo.useSystemProxy);
      //   final captcha = event.captchaID != null && event.captchaAns != null
      //       ? RegisterUserRequest_Captcha(
      //           id: event.captchaID, value: event.captchaAns)
      //       : null;
      //   final resp = await client.registerUser(RegisterUserRequest(
      //     username: event.username,
      //     password: event.password,
      //     captcha: captcha,
      //   ));
      //   if (resp.hasRefreshToken()) {
      //     emit(
      //       MainRegisterState(
      //           state.copyWith(
      //             nextServer: state.nextServer!.copyWith(
      //               refreshToken: resp.refreshToken,
      //             ),
      //           ),
      //           EventStatus.success),
      //     );
      //   } else if (resp.hasCaptcha()) {
      //     final image = Uint8List.fromList(resp.captcha.image);
      //     emit(
      //       MainRegisterState(
      //         state,
      //         EventStatus.failed,
      //         captchaID: resp.captcha.id,
      //         captchaImage: image,
      //         msg: S.current.captchaRequired,
      //       ),
      //     );
      //   } else {
      //     emit(
      //       MainRegisterState(
      //         state,
      //         EventStatus.failed,
      //         msg: S.current.unknownErrorOccurred,
      //       ),
      //     );
      //   }
      // } catch (e) {
      //   debugPrint(e.toString());
      //   emit(MainRegisterState(state, EventStatus.failed, msg: e.toString()));
      // }
    }, transformer: droppable());
  }

  int cacheSize() {
    return 0;
    // return _yesodBloc?.cacheSize() ?? 0;
  }

  Future<void> clearCache() async {
    // await _yesodBloc?.clearCache();
  }
}
