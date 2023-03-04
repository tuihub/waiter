import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:waitress/common/const/color.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  AppSettingBloc() : super(DefaultTheme()) {
    on<AppSettingEvent>((event, emit) {
      if (event is ChangeBrightnessEvent) {
        emit(state.copyWith(brightness: event.brightness));
      }
      if (event is ToggleBrightnessEvent) {
        if (state.brightness == Brightness.light) {
          emit(state.copyWith(brightness: Brightness.dark));
        } else {
          emit(state.copyWith(brightness: Brightness.light));
        }
      }
    });
  }
}
