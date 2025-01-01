import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

part 'client_setting_event.dart';
part 'client_setting_state.dart';

class ClientSettingBloc extends Bloc<ClientSettingEvent, ClientSettingState> {
  // final ClientCommonRepo _repo;

  ClientSettingBloc() : super(DefaultAppState()) {
    // final common = _repo.get();

    on<InitClientSettingEvent>((event, emit) async {
    //   if (common.themeName != null) {
    //     final theme = themeData.firstWhere((e) => e.name == common.themeName);
    //     debugPrint(theme.name);
    //     emit(state.copyWith(theme: theme));
    //   }
    //   if (common.themeMode != null) {
    //     final themeMode = ThemeMode.values[common.themeMode!];
    //     emit(state.copyWith(themeMode: themeMode));
    //   }
    //   emit(state.copyWith(
    //     useSystemProxy: common.useSystemProxy,
    //     useFluentUI: common.useFluentUI,
    //   ));
    });

    on<ChangeThemeEvent>((event, emit) async {
    //   emit(state.copyWith(theme: event.theme));
    //   await _repo.set(common.copyWith(themeName: event.theme.name));
    });

    on<ChangeBrightnessEvent>((event, emit) async {
    //   emit(state.copyWith(themeMode: event.themeMode));
    });

    on<ToggleThemeModeEvent>((event, emit) async {
    //   if (state.themeMode == ThemeMode.system) {
    //     emit(state.copyWith(themeMode: ThemeMode.dark));
    //   } else {
    //     if (state.themeMode == ThemeMode.dark) {
    //       emit(state.copyWith(themeMode: ThemeMode.light));
    //     } else {
    //       emit(state.copyWith(themeMode: ThemeMode.system));
    //     }
    //   }
    });

    on<ChangeUseSystemProxyEvent>((event, emit) async {
    //   await _repo.set(common.copyWith(useSystemProxy: event.useSystemProxy));
    //   emit(state.copyWith(useSystemProxy: event.useSystemProxy));
    });

    on<ChangeUseFluentUIEvent>((event, emit) async {
    //   await _repo.set(common.copyWith(useFluentUI: event.useFluentUI));
    //   emit(state.copyWith(useFluentUI: event.useFluentUI));
    });
  }
}
