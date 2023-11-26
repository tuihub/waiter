import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../repo/local/store/setting_dao.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final SettingDao _dao;
  String userPath = '/';

  AppSettingBloc(this._dao) : super(DefaultAppState()) {
    on<AppSettingEvent>((event, emit) async {
      if (event is InitAppSettingEvent) {
        if (_dao.exist(SettingKey.theme)) {
          final theme = themeData[_dao.require(SettingKey.theme)];
          debugPrint(theme.name);
          emit(state.copyWith(theme: theme));
        }
        if (_dao.exist(SettingKey.themeMode)) {
          final themeMode =
              ThemeMode.values[_dao.require(SettingKey.themeMode)];
          emit(state.copyWith(themeMode: themeMode));
        }
        return;
      }
      if (event is ChangeThemeEvent) {
        emit(state.copyWith(theme: event.theme));
        await _dao.set(SettingKey.themeMode, state.themeMode.index);
        return;
      }
      if (event is ChangeBrightnessEvent) {
        emit(state.copyWith(themeMode: event.themeMode));
      }
      if (event is ToggleThemeModeEvent) {
        if (state.themeMode == ThemeMode.system) {
          emit(state.copyWith(themeMode: ThemeMode.dark));
        } else {
          if (state.themeMode == ThemeMode.dark) {
            emit(state.copyWith(themeMode: ThemeMode.light));
          } else {
            emit(state.copyWith(themeMode: ThemeMode.system));
          }
        }
      }
      await _dao.set(SettingKey.theme, state.theme.index);
    });
  }
}
