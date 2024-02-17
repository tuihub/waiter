import 'dart:async';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import '../../../bloc/main_bloc.dart';
import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../l10n/l10n.dart';
import '../../../repo/grpc/l10n.dart';
import '../../helper/duration_format.dart';
import '../../helper/spacing.dart';
import '../../layout/bootstrap_container.dart';
import '../../specialized/backdrop_blur.dart';
import '../server_select_overlay.dart';

part 'my_accounts_card.dart';
part 'account_dialog.dart';

class TipherethFramePage extends StatelessWidget {
  const TipherethFramePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          SizedBox(height: 72),
          MyProfileCard(),
          Expanded(
            child: MyAccountsCard(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ServerSelectOverlay.of(context)?.fullscreen();
        },
        icon: const Icon(Icons.logout),
        label: Text(S.of(context).changeServer),
      ),
    );
  }
}

class MyProfileCard extends StatelessWidget {
  const MyProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${state.currentUser?.id.id.toHexString()}',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  Text(state.currentUser?.username ?? '',
                      style: const TextStyle(
                        fontSize: 32,
                      )),
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
