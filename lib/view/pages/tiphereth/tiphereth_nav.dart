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
import '../../../route.dart';
import '../../helper/connection.dart';
import '../../helper/duration_format.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import '../frame_page.dart';

part 'account_dialog.dart';
part 'my_accounts_card.dart';

class TipherethNav extends StatelessWidget {
  const TipherethNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
            child: Stack(
              children: [
                Center(
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
                Container(
                  alignment: Alignment.topRight,
                  child: UniversalIconButton(
                    icon: Icon(UniversalUI.of(context).icons.logout),
                    onPressed: () {
                      const TipherethRootRoute(
                        action: TipherethActions.serverList,
                      ).go(context);
                      ModuleFramePage.of(context)?.openDrawer();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
