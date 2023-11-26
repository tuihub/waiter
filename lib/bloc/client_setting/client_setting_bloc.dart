import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../repo/local/common.dart';

part 'client_setting_event.dart';
part 'client_setting_state.dart';

class ClientSettingBloc extends Bloc<ClientSettingEvent, ClientSettingState> {
  final ClientCommonRepo repo;
  String userPath = '/';

  ClientSettingBloc(this.repo) : super(DefaultAppState()) {
    final common = repo.get();

    on<InitClientSettingEvent>((event, emit) async {
      if (common.theme != null) {
        final theme = themeData[common.theme!];
        debugPrint(theme.name);
        emit(state.copyWith(theme: theme));
      }
      if (common.themeMode != null) {
        final themeMode = ThemeMode.values[common.themeMode!];
        emit(state.copyWith(themeMode: themeMode));
      }
    });

    on<ChangeThemeEvent>((event, emit) async {
      emit(state.copyWith(theme: event.theme));
      await repo.set(common.copyWith(themeMode: event.theme.index));
    });

    on<ChangeBrightnessEvent>((event, emit) async {
      emit(state.copyWith(themeMode: event.themeMode));
    });

    on<ToggleThemeModeEvent>((event, emit) async {
      if (state.themeMode == ThemeMode.system) {
        emit(state.copyWith(themeMode: ThemeMode.dark));
      } else {
        if (state.themeMode == ThemeMode.dark) {
          emit(state.copyWith(themeMode: ThemeMode.light));
        } else {
          emit(state.copyWith(themeMode: ThemeMode.system));
        }
      }
    });
  }
}
