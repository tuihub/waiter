import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../server_select_overlay.dart';
import 'my_accounts_card.dart';
import 'my_profile_card.dart';

class TipherethFramePage extends StatelessWidget {
  const TipherethFramePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          SizedBox(height: 80),
          MyProfileCard(),
          MyAccountsCard(),
          Expanded(child: SizedBox()),
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
