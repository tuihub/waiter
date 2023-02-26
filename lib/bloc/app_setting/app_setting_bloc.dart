import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  AppSettingBloc() : super(AppSettingInitial()) {
    on<AppSettingEvent>((event, emit) async {
      if (event is ConnectToServerEvent) {
        emit(ServerConnectLoading());
        await Future.delayed(
          Duration(seconds: 2),
        );
        emit(ServerConnectDone());
      }
      if (event is UserLoginEvent) {
        emit(UserLoginLoading());
        await Future.delayed(
          Duration(seconds: 2),
        );
        // emit(UserLoginFailed("test", 0));
        emit(UserLoginDone());
      }
      if (event is UserLogoutEvent) {
        emit(AppSettingInitial());
      }
    });
  }
}
