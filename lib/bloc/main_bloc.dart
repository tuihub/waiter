import 'dart:async';
import 'dart:typed_data';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dao/dao.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../common/bloc_event_status_mixin.dart';
import '../consts.dart';
import '../l10n/l10n.dart';
import '../model/common_model.dart';
import '../model/tiphereth_model.dart';
import '../repo/main/main_repo.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

part 'main_bloc.mapper.dart';
part 'main_event.dart';
part 'main_state.dart';

// MainBloc manage the basic state of the app,
// including login, logout, and server switching.
class MainBloc extends Bloc<MainEvent, MainState> {
  final LibrarianService _api;
  final MainRepo _repo;

  bool get isLocal => _api.connectionStatus == ConnectionStatus.local;

  static Future<MainBloc> init(LibrarianService api, MainRepo repo) async {
    final initialState = MainState().copyWith(
      themeMode: await repo.getThemeMode(),
      theme: await repo.getTheme(),
      uiDesign: await repo.getUIDesign(),
      useSystemProxy: await repo.getUseSystemProxy(),
    );
    return MainBloc._(initialState, api, repo);
  }

  MainBloc._(
    MainState initialState,
    this._api,
    this._repo,
  ) : super(initialState) {
    _api.connectionStatusStream.listen((event) {
      if (event == ConnectionStatus.connected) {
        add(MainRefreshServerInfoEvent());
      }
    });

    on<MainInitEvent>((event, emit) async {
      final lastServer = await _repo.getLastServer();
      final servers = await _repo.loadServers();
      debugPrint(servers.toString());
      final serverMap =
          Map.fromEntries(servers.map((e) => MapEntry(e.uniqueKey, e)));
      final ServerConfig? config = serverMap[lastServer];
      if (config != null) {
        await _api.newServerConfig(config, state.useSystemProxy);
        emit(MainInitState(
          state.copyWith(
            currentServer: config.uniqueKey,
            knownServers: serverMap,
          ),
          EventStatus.success,
        ));
      } else {
        emit(MainInitState(
          state.copyWith(
            knownServers: serverMap,
          ),
          EventStatus.success,
        ));
      }
    }, transformer: droppable());

    on<MainLoginEvent>((event, emit) async {
      emit(MainLoginState(state, EventStatus.processing));

      // Login to current server
      if (event.serverConfig == null) {
        final resp = await _api.doLogin(event.password);
        if (resp != null) {
          emit(MainLoginState(state, EventStatus.failed, msg: resp));
        } else {
          emit(MainLoginState(state, EventStatus.success));
        }
        return;
      }

      // Login to a new server
      try {
        final config = event.serverConfig!;
        final api = await LibrarianService.grpc(
          config,
          state.useSystemProxy,
        );
        final resp = await api.doLogin(event.password);
        if (resp != null) {
          emit(MainLoginState(state, EventStatus.failed, msg: resp));
        } else {
          await _repo.addServer(config);
          await _repo.setLastServer(config.uniqueKey);
          await DIService.instance.buildBlocs(api: api);
          emit(MainLoginState(state, EventStatus.success));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(MainLoginState(
          state,
          EventStatus.failed,
          msg: e.toString(),
        ));
      }
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
      final resp2 =
          await _api.doRequest((client) => client.getUser, GetUserRequest());
      if (resp2 case Ok()) {
        final user = resp2.v;
        newState = newState.copyWith(currentUser: user.user);
      }
      emit(newState);
    }, transformer: restartable());

    on<MainRegisterEvent>((event, emit) async {
      emit(MainRegisterState(state, EventStatus.processing));

      try {
        final config = event.serverConfig;
        final api =
            await LibrarianService.grpc(config, state.useSystemProxy);
        final captcha = event.captchaID != null && event.captchaAns != null
            ? RegisterUserRequest_Captcha(
                id: event.captchaID, value: event.captchaAns)
            : null;
        final resp = await api.doRequest(
          (client) => client.registerUser,
          RegisterUserRequest(
            username: config.username,
            password: event.password,
            captcha: captcha,
          ),
        );
        switch (resp) {
          case Ok():
            if (resp.v.hasRefreshToken()) {
              emit(
                MainRegisterState(state, EventStatus.success),
              );
            } else if (resp.v.hasCaptcha()) {
              final image = Uint8List.fromList(resp.v.captcha.image);
              emit(
                MainRegisterState(
                  state,
                  EventStatus.failed,
                  captchaID: resp.v.captcha.id,
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
          case Err():
            emit(MainRegisterState(state, EventStatus.failed,
                msg: resp.e));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(MainRegisterState(state, EventStatus.failed, msg: e.toString()));
      }
    }, transformer: droppable());

    on<ChangeThemeEvent>((event, emit) async {
      emit(state.copyWith(theme: event.theme));
      await _repo.setTheme(event.theme);
    });

    on<ChangeBrightnessEvent>((event, emit) async {
      emit(state.copyWith(themeMode: event.themeMode));
      await _repo.setThemeMode(event.themeMode);
    });

    on<ToggleThemeModeEvent>((event, emit) async {
      late ThemeMode newMode;
      if (state.themeMode == ThemeMode.system) {
        newMode = ThemeMode.dark;
      } else if (state.themeMode == ThemeMode.dark) {
        newMode = ThemeMode.light;
      } else {
        newMode = ThemeMode.system;
      }
      emit(state.copyWith(themeMode: newMode));
      await _repo.setThemeMode(newMode);
    });

    on<ChangeUseSystemProxyEvent>((event, emit) async {
      emit(state.copyWith(useSystemProxy: event.useSystemProxy));
      await _repo.setUseSystemProxy(event.useSystemProxy);
    });

    on<ChangeUIDesignEvent>((event, emit) async {
      emit(state.copyWith(uiDesign: event.design));
      await _repo.setUIDesign(event.design);
    });
  }

  int cacheSize() {
    return 0;
    // return _yesodBloc?.cacheSize() ?? 0;
  }

  Future<void> clearCache() async {
    // await _yesodBloc?.clearCache();
  }
}
