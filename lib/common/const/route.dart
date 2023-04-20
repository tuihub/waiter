import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/bloc/app_setting/app_setting_bloc.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/common/client/client.dart';
import 'package:waitress/view/page/frame_page.dart';
import 'package:waitress/view/page/init_page.dart';
import 'package:waitress/view/page/setting_page.dart';
import 'package:waitress/view/page/yesod/yesode_config.dart';
import 'package:waitress/view/page/yesod/yesode_home_page.dart';
import 'package:waitress/view/page/yesod/yesode_timeline.dart';

import 'app.dart';

final GlobalKey<NavigatorState> _appNavigateKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _yesodNavigateKey = GlobalKey<NavigatorState>();

class UserNavObserver extends NavigatorObserver {
  final BuildContext context;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print(route.toString());
    context.read<AppSettingBloc>().userPath = route.toString();
  }

  UserNavObserver(this.context);
}

GoRouter getRouter(BuildContext context) {
  final router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (context.read<UserBloc>().state is UserLoginDone) {
        if (state.location == '/') {
          print(state.location);
          return '/app/Home';
        }
      }
      return null;
    },
    observers: [UserNavObserver(context)],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitPage(),
      ),
      ShellRoute(
        navigatorKey: _appNavigateKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          final appName = state.params['appName'] ?? "Home";
          return FramePage(
            innerPage: child,
            selectedNav: appName,
          );
        },
        routes: [
          ShellRoute(
            navigatorKey: _yesodNavigateKey,
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) {
              final function = state.params['function'] ?? "timeline";
              return NoTransitionPage(
                  child: YesodHome(
                function: function,
                functionPage: child,
              ));
            },
            routes: [
              GoRoute(
                path: "/app/:appName/:function",
                builder: (context, state) {
                  final yesodPages = {
                    "timeline": YesodeTimelinePage(),
                    "config": YesodConfigPage()
                  };
                  final function = state.params['function'] ?? "timeline";
                  return yesodPages[function] ?? const SizedBox();
                },
              ),
            ],
          ),
          GoRoute(
            path: "/app/:appName",
            redirect: (context, state) {
              final appName = state.params['appName'];
              if (appName == "Yesod") {
                return "/app/Yesod/timeline";
              }
              return null;
            },
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: BlocBuilder<UserBloc, UserLoginState>(
                  builder: (context, blocState) {
                    if (blocState is UserLoginDone) {
                      final appName = state.params['appName'];
                      Widget page = const SizedBox();

                      if (appName == 'Setting') page = SettingPage();
                      if (appMap.containsKey(appName))
                        page = appMap[appName]!.page;
                      return BlocProvider(
                        create: (context) => ApiRequestBloc(
                          accessToken: blocState.acessToken,
                          client: clientFactory(host: blocState.serverUrl),
                        ),
                        child: page,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
