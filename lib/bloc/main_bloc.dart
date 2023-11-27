import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'client_setting/client_setting_bloc.dart';
import 'gebura/gebura_bloc.dart';
import 'tiphereth/tiphereth_bloc.dart';
import 'yesod/yesod_bloc.dart';

class MainBloc extends Cubit<MainState> {
  final ClientSettingBloc clientSettingBloc;
  final TipherethBloc tipherethBloc;
  final GeburaBloc geburaBloc;
  final YesodBloc yesodBloc;

  MainBloc(
    this.clientSettingBloc,
    this.tipherethBloc,
    this.geburaBloc,
    this.yesodBloc,
  ) : super(MainState());

  static ClientSettingBloc clientSetting(BuildContext context) =>
      context.read<MainBloc>().clientSettingBloc;
  static TipherethBloc tiphereth(BuildContext context) =>
      context.read<MainBloc>().tipherethBloc;
  static GeburaBloc gebura(BuildContext context) =>
      context.read<MainBloc>().geburaBloc;
  static YesodBloc yesod(BuildContext context) =>
      context.read<MainBloc>().yesodBloc;

  int cacheSize() {
    return yesodBloc.repo.cacheSize();
  }

  Future<void> clearCache() async {
    await yesodBloc.repo.clearCache();
  }
}

class MainState {}
