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
import '../repo/main_repo.dart';
import '../service/di_service.dart';
import '../service/librarian_service.dart';

part 'main_bloc.mapper.dart';
part 'main_event.dart';
part 'main_state.dart';

// MainBloc manage the basic state of the app,
// including login, logout, and server switching.
class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepo _repo;

  static Future<MainBloc> init(MainRepo repo) async {
    try {
      final initialState = MainState().copyWith(
        themeMode: await repo.getThemeMode(),
        theme: await repo.getTheme(),
        uiDesign: await repo.getUIDesign(),
        useSystemProxy: await repo.getUseSystemProxy(),
      );
      return MainBloc._(initialState, repo);
    } catch (e) {
      debugPrint(e.toString());
      return MainBloc._(MainState(), repo);
    }
  }

  MainBloc._(
    super.initialState,
    this._repo,
  ) {
    on<MainInitEvent>((event, emit) async {
      try {
        final lastServer = await _repo.getLastServer();
        final servers = await _repo.loadServers();
        debugPrint(servers.toString());
        final serverMap =
            Map.fromEntries(servers.map((e) => MapEntry(e.serverID, e)));
        final ServerConfig? config = serverMap[lastServer];
        if (config != null) {
          try {
            await _repo.login(event.context, config: config);
            emit(MainInitState(
              state.copyWith(
                currentServer: config.serverID,
                knownServers: serverMap,
              ),
              EventStatus.success,
            ));
            add(MainRefreshServerInfoEvent(event.context));
          } catch (e) {
            debugPrint(e.toString());
            emit(MainInitState(
              state.copyWith(
                knownServers: serverMap,
              ),
              EventStatus.failed,
            ));
            return;
          }
        } else {
          emit(MainInitState(
            state.copyWith(
              knownServers: serverMap,
            ),
            EventStatus.success,
          ));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(MainInitState(state, EventStatus.failed));
      }
    }, transformer: droppable());

    on<MainLoginEvent>((event, emit) async {
      emit(MainLoginState(state, EventStatus.processing));
      try {
        final resp = await _repo.login(event.context,
            config: event.serverConfig, password: event.password);
        if (resp == null) {
          emit(MainLoginState(
            state.copyWith(
              currentServer:
                  event.serverConfig?.serverID ?? state.currentServer,
            ),
            EventStatus.success,
          ));
          add(MainRefreshServerInfoEvent(event.context));
        } else {
          emit(MainLoginState(
            state,
            EventStatus.failed,
            msg: resp,
          ));
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
      if (event.server == null && state.currentServer == null) {
        return;
      }
      try {
        final currentServer = event.server ?? state.currentServer!;
        var newState = state;
        final servers = await _repo.loadServers();
        final serverMap =
            Map.fromEntries(servers.map((e) => MapEntry(e.serverID, e)));
        newState = newState.copyWith(knownServers: serverMap);
        final resp = await _repo.getServerInfo(event.context);
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
        final resp2 = await _repo.getUser(event.context);
        if (resp2 case Ok()) {
          final user = resp2.v;
          newState = newState.copyWith(currentUser: user.user);
        }
        emit(newState);
      } catch (e) {
        debugPrint(e.toString());
      }
    }, transformer: restartable());

    on<MainRegisterEvent>((event, emit) async {
      emit(MainRegisterState(state, EventStatus.processing));

      try {
        final config = event.serverConfig;
        final api = await LibrarianService.grpc(config, state.useSystemProxy);
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
            emit(MainRegisterState(state, EventStatus.failed, msg: resp.e));
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
