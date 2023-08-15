import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'bloc/api_request/api_request_bloc.dart';
import 'bloc/app_setting/app_setting_bloc.dart';
import 'bloc/user_login/user_bloc.dart';
import 'common/api/client.dart';
import 'common/util/stream_listener.dart';
import 'consts.dart';
import 'view/pages/frame_page.dart';
import 'view/pages/gebura/gebura_frame_page.dart';
import 'view/pages/gebura/gebura_library_detail.dart';
import 'view/pages/gebura/gebura_store.dart';
import 'view/pages/init_page.dart';
import 'view/pages/login_page.dart';
import 'view/pages/settings/app/app_manage_page.dart';
import 'view/pages/settings/app_package/app_package_manage_page.dart';
import 'view/pages/settings/client_setting_page.dart';
import 'view/pages/settings/settings_frame_page.dart';
import 'view/pages/settings/user/user_manage_page.dart';
import 'view/pages/tiphereth/tiphereth_frame_page.dart';
import 'view/pages/yesod/yesod_config_page.dart';
import 'view/pages/yesod/yesod_frame_page.dart';
import 'view/pages/yesod/yesod_recent_page.dart';
import 'view/pages/yesod/yesod_timeline_page.dart';

final GlobalKey<NavigatorState> _appNavigateKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _yesodNavigateKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _geburaNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigateKey =
    GlobalKey<NavigatorState>();

GoRouter getRouter() {
  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: StreamListener(GetIt.I<UserBloc>().stream),
    redirect: (context, state) {
      if (context.read<UserBloc>().state is PreLogin) {
        return '/';
      }
      if (context.read<UserBloc>().state is OnLogin) {
        return '/login';
      }
      if (context.read<UserBloc>().state is PostLogin) {
        if (state.location == '/login' || state.location == '/') {
          final userPath = context.read<AppSettingBloc>().userPath;
          if (userPath.startsWith('/app')) {
            return userPath;
          }

          // return context.read<AppSettingBloc>().userPath;
          return '/app/Home';
        }
      }
      context.read<AppSettingBloc>().userPath = state.location;
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        navigatorKey: _appNavigateKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          var appName = state.params['appName'] ?? '';
          final fullPath = state.fullpath ?? '/app/Home';
          if (appName == '' && fullPath.startsWith('/app')) {
            appName = fullPath.split('/')[2];
          }
          return BlocBuilder<UserBloc, UserLoginState>(
            builder: (context, blocState) {
              if (blocState is UserLoggedIn) {
                return BlocProvider(
                  create: (context) => ApiRequestBloc(
                    accessToken: blocState.acessToken,
                    client: clientFactory(
                      config: blocState.serverConfig,
                    ),
                  ),
                  child: FramePage(
                    innerPage: child,
                    selectedNav: appName,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
        routes: [
          ShellRoute(
            navigatorKey: _yesodNavigateKey,
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) {
              final function = state.params['function'] ?? 'recent';
              return NoTransitionPage(
                child: YesodFramePage(
                  function: function,
                  functionPage: child,
                ),
              );
            },
            routes: [
              GoRoute(
                path: '/app/Yesod/:function',
                pageBuilder: (context, state) {
                  final yesodPages = {
                    'recent': const YesodRecentPage(),
                    'timeline': const YesodTimelinePage(),
                    'config': const YesodConfigPage()
                  };
                  final function = state.params['function'] ?? 'recent';
                  return NoTransitionPage(
                    child: yesodPages[function] ?? const SizedBox(),
                  );
                },
              ),
            ],
          ),
          ShellRoute(
            navigatorKey: _geburaNavigateKey,
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) {
              final function = state.params['function'] ?? 'library';
              final appID = state.queryParams['id'] ?? '0';
              return NoTransitionPage(
                child: GeburaFramePage(
                  function: function,
                  functionPage: child,
                  selectedAppID: appID,
                ),
              );
            },
            routes: [
              GoRoute(
                path: '/app/Gebura/:function',
                pageBuilder: (context, state) {
                  final function = state.params['function'] ?? 'library';
                  final id = state.queryParams['id'] ?? '0';
                  final appID = int.tryParse(id) ?? 0;
                  if (function == 'library') {
                    if (appID != 0) {
                      return NoTransitionPage(
                        child: GeburaLibraryDetailPage(appID: appID),
                      );
                    }
                  }
                  if (function == 'store') {
                    return const NoTransitionPage(
                      child: GeburaStorePage(),
                    );
                  }
                  return const NoTransitionPage(
                    child: SizedBox(),
                  );
                },
              ),
            ],
          ),
          ShellRoute(
            navigatorKey: _settingsNavigateKey,
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) {
              final function = state.params['function'] ?? 'client';
              return NoTransitionPage(
                child: SettingsFramePage(
                  function: function,
                  functionPage: child,
                ),
              );
            },
            routes: [
              GoRoute(
                path: '/app/Settings/:function',
                pageBuilder: (context, state) {
                  final settingsPages = {
                    'client': const ClientSettingPage(),
                    'user': const UserManagePage(),
                    'app': const AppManagePage(),
                    'appPackage': const AppPackageManagePage(),
                  };
                  final function = state.params['function'] ?? 'client';
                  return NoTransitionPage(
                    child: settingsPages[function] ?? const SizedBox(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/app/:appName',
            redirect: (context, state) {
              final appName = state.params['appName'];
              if (appName == 'Yesod') {
                return '/app/Yesod/timeline';
              }
              if (appName == 'Gebura') {
                return '/app/Gebura/library';
              }
              if (appName == 'Settings') {
                return '/app/Settings/client';
              }
              return null;
            },
            pageBuilder: (context, state) {
              final appName = state.params['appName'];
              Widget page = const SizedBox();

              if (appName == 'Tiphereth') page = const TipherethFramePage();

              if (appMap.containsKey(appName)) page = appMap[appName]!.page;
              return NoTransitionPage(child: page);
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
