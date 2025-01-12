import 'dart:async';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../consts.dart';
import '../../../l10n/librarian.dart';
import '../../helper/connection.dart';
import '../../helper/duration_format.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';

part 'account_dialog.dart';
part 'my_accounts_card.dart';

class TipherethFramePage extends StatelessWidget {
  const TipherethFramePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (ConnectionHelper.isLocal(context))
            const LocalCard()
          else
            const MyProfileCard(),
          if (ConnectionHelper.isNotLocal(context))
            const Expanded(
              child: MyAccountsCard(),
            ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     ServerSelectOverlay.of(context)?.fullscreen();
      //   },
      //   icon: Icon(UniversalUI.of(context).icons.logout),
      //   label: Text(S.of(context).changeServer),
      // ),
    );
  }
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return UniversalCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (ConnectionHelper.isNotLocal(context))
                    Text(
                      '${state.currentUser?.id.id.toHexString()}',
                      style: TextStyle(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  if (ConnectionHelper.isNotLocal(context))
                    Text(state.currentUser?.username ?? '',
                        style: const TextStyle(
                          fontSize: 32,
                        ))
                  else
                    const Text('本地模式',
                        style: TextStyle(
                          fontSize: 32,
                        )),
                  if (ConnectionHelper.isNotLocal(context))
                    if (state.currentUser != null)
                      Text(userTypeString(state.currentUser!.type))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LocalCard extends StatelessWidget {
  const LocalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const UniversalCard(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('本地模式',
                  style: TextStyle(
                    fontSize: 32,
                  )),
              Text('添加服务器实例以使用更多功能'),
            ],
          ),
        ),
      ),
    );
  }
}
