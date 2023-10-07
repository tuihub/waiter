import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../bloc/user_login/user_bloc.dart';
import '../../components/expand_rail_tile.dart';
import '../../components/rail_tile.dart';

class SettingsFramePage extends StatelessWidget {
  const SettingsFramePage(
      {super.key, required this.function, required this.functionPage});

  final String function;
  final Widget functionPage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserLoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is UserLoggedIn) {
          return Scaffold(
            body: Row(
              children: [
                SizedBox(
                  width: 256,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceTint
                                .withAlpha(24),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              RailTile(
                                onTap: () {
                                  GoRouter.of(context)
                                      .go('/app/Settings/client');
                                },
                                title: const Text('客户端设置'),
                                selected: function == 'client',
                              ),
                              if (state.user.type == UserType.USER_TYPE_ADMIN)
                                ExpandRailTile(
                                  title: const Text(
                                    '管理区域',
                                  ),
                                  childrenPadding:
                                      const EdgeInsets.only(left: 12),
                                  children: [
                                    RailTile(
                                      title: const Text('用户管理'),
                                      onTap: () {
                                        GoRouter.of(context)
                                            .go('/app/Settings/user');
                                      },
                                      selected: function == 'user',
                                    ),
                                    RailTile(
                                      title: const Text('应用管理'),
                                      onTap: () {
                                        GoRouter.of(context)
                                            .go('/app/Settings/app');
                                      },
                                      selected: function == 'app',
                                    ),
                                    RailTile(
                                      title: const Text('应用包管理'),
                                      onTap: () {
                                        GoRouter.of(context)
                                            .go('/app/Settings/appPackage');
                                      },
                                      selected: function == 'appPackage',
                                    ),
                                  ],
                                )
                              else
                                const SizedBox(),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: functionPage,
                  ),
                ),
              ],
            ),
          );
        }

        throw UnimplementedError();
      },
    );
  }
}
