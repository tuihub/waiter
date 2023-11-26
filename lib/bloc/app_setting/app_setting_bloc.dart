import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../repo/local/common.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final ClientCommonRepo repo;
  String userPath = '/';

  AppSettingBloc(this.repo) : super(DefaultAppState()) {
    final common = repo.get();

    on<InitAppSettingEvent>((event, emit) async {
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
