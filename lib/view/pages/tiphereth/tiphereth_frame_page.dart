import 'package:flutter/material.dart';

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
          MyProfileCard(),
          MyAccountsCard(),
          Expanded(child: SizedBox()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ServerSelectOverlay.of(context)?.fullscreen();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
