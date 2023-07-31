import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waitress/view/pages/tiphereth/my_accounts_card.dart';
import 'package:waitress/view/pages/tiphereth/my_profile_card.dart';

import '../../../bloc/user_login/user_bloc.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "已退出登录",
              ),
            ),
          );
          context.read<UserBloc>().add(UserLogoutEvent());
          GoRouter.of(context).go(
            '/login',
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
