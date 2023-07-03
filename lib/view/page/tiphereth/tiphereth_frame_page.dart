import 'package:flutter/material.dart';
import 'package:waitress/view/page/tiphereth/my_accounts_card.dart';
import 'package:waitress/view/page/tiphereth/my_profile_card.dart';

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
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
