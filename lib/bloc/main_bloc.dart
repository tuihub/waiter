import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'chesed/chesed_bloc.dart';
import 'client_setting/client_setting_bloc.dart';
import 'gebura/gebura_bloc.dart';
import 'netzach/netzach_bloc.dart';
import 'tiphereth/tiphereth_bloc.dart';
import 'yesod/yesod_bloc.dart';

class MainBloc extends Cubit<MainState> {
  final ClientSettingBloc clientSettingBloc;
  final TipherethBloc tipherethBloc;
  final GeburaBloc geburaBloc;
  final YesodBloc yesodBloc;
  final ChesedBloc chesedBloc;
  final NetzachBloc netzachBloc;
  final PackageInfo packageInfo;

  MainBloc(
    this.clientSettingBloc,
    this.tipherethBloc,
    this.geburaBloc,
    this.yesodBloc,
    this.chesedBloc,
    this.netzachBloc,
    this.packageInfo,
  ) : super(MainState());

  static ClientSettingBloc clientSetting(BuildContext context) =>
      context.read<MainBloc>().clientSettingBloc;
  static TipherethBloc tiphereth(BuildContext context) =>
      context.read<MainBloc>().tipherethBloc;
  static GeburaBloc gebura(BuildContext context) =>
      context.read<MainBloc>().geburaBloc;
  static YesodBloc yesod(BuildContext context) =>
      context.read<MainBloc>().yesodBloc;
  static ChesedBloc chesed(BuildContext context) =>
      context.read<MainBloc>().chesedBloc;
  static NetzachBloc netzach(BuildContext context) =>
      context.read<MainBloc>().netzachBloc;

  int cacheSize() {
    return yesodBloc.cacheSize();
  }

  Future<void> clearCache() async {
    await yesodBloc.clearCache();
  }
}

class MainState {}
