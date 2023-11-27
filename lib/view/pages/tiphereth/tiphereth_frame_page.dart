import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../route.dart';
import '../../components/toast.dart';
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
          unawaited(showDialog<void>(
            context: context,
            builder: (context) => _LogoutDialog(),
          ));
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('退出登录'),
      content: const SizedBox(
        width: 600,
        child: SizedBox(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            const Toast(title: '', message: '已退出登录').show(context);
            context.read<TipherethBloc>().add(TipherethLogoutEvent());
            AppRoutes.login.go(context);
          },
          child: const Text('确定'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('关闭'),
        )
      ],
    );
  }
}
