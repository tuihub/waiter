import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'view/pages/yesod/yesod_config_edit_page.dart';

import 'bloc/api_request/api_request_bloc.dart';
import 'bloc/app_setting/app_setting_bloc.dart';
import 'bloc/user_login/user_bloc.dart';
import 'common/api/client.dart';
import 'common/util/stream_listener.dart';
import 'view/pages/frame_page.dart';
import 'view/pages/gebura/gebura_library_detail.dart';
import 'view/pages/gebura/gebura_nav.dart';
import 'view/pages/gebura/gebura_store.dart';
import 'view/pages/init_page.dart';
import 'view/pages/login_page.dart';
import 'view/pages/settings/app/app_manage_page.dart';
import 'view/pages/settings/app_package/app_package_manage_page.dart';
import 'view/pages/settings/client_setting_page.dart';
import 'view/pages/settings/settings_nav.dart';
import 'view/pages/settings/user/user_manage_page.dart';
import 'view/pages/tiphereth/tiphereth_frame_page.dart';
import 'view/pages/yesod/yesod_config_page.dart';
import 'view/pages/yesod/yesod_nav.dart';
import 'view/pages/yesod/yesod_recent_page.dart';
import 'view/pages/yesod/yesod_timeline_page.dart';

final GlobalKey<NavigatorState> _tipherethNavigateKey =
    GlobalKey<NavigatorState>();
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
        if (state.uri.toString() == '/login' || state.uri.toString() == '/') {
          final userPath = context.read<AppSettingBloc>().userPath;
          if (userPath.startsWith('/app')) {
            return userPath;
          }

          // return context.read<AppSettingBloc>().userPath;
          return '/app/Tiphereth';
        }
        if (state.uri.toString() == '/app') {
          return '/app/Tiphereth';
        }
      }
      context.read<AppSettingBloc>().userPath = state.uri.toString();
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
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          var appName = state.pathParameters['appName'] ?? '';
          final fullPath = state.fullPath ?? '/app/Tiphereth';
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
                  child: child,
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _tipherethNavigateKey,
            routes: [
              GoRoute(
                path: '/app/Tiphereth',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: FramePage(
                      selectedNav: 'Tiphereth',
                      leftPart: TipherethFramePage(),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _yesodNavigateKey,
            routes: [
              GoRoute(
                path: '/app/Yesod',
                redirect: (context, state) {
                  return '/app/Yesod/recent';
                },
              ),
              GoRoute(
                path: '/app/Yesod/:function',
                pageBuilder: (context, state) {
                  final yesodPages = {
                    'recent': const YesodRecentPage(),
                    'timeline': const YesodTimelinePage(),
                    'config': const YesodConfigPage()
                  };
                  final function = state.pathParameters['function'] ?? 'recent';
                  final id = state.uri.queryParameters['id'];
                  final feedConfigID = id != null ? int.tryParse(id) : null;

                  final yesodRight = {
                    'config': feedConfigID != null
                        ? YesodConfigEditPage(
                            key: ValueKey(feedConfigID),
                            feedConfigID: feedConfigID)
                        : const SizedBox(),
                  };
                  debugPrint(id);
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: 'Yesod',
                      leftPart: YesodNav(
                        function: function,
                      ),
                      middlePart: yesodPages[function],
                      rightPart: yesodRight[function],
                      gestureRight: false,
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _geburaNavigateKey,
            routes: [
              GoRoute(
                path: '/app/Gebura',
                redirect: (context, state) {
                  return '/app/Gebura/store';
                },
              ),
              GoRoute(
                path: '/app/Gebura/:function',
                pageBuilder: (context, state) {
                  final function =
                      state.pathParameters['function'] ?? 'library';
                  final id = state.uri.queryParameters['id'] ?? '0';
                  final appID = int.tryParse(id) ?? 0;
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: 'Gebura',
                      leftPart: GeburaNav(
                        function: function,
                        selectedAppID: id,
                      ),
                      middlePart: function == 'store'
                          ? const GeburaStorePage()
                          : GeburaLibraryDetailPage(appID: appID),
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsNavigateKey,
            routes: [
              GoRoute(
                path: '/app/Settings',
                redirect: (context, state) {
                  return '/app/Settings/client';
                },
              ),
              GoRoute(
                path: '/app/Settings/:function',
                pageBuilder: (context, state) {
                  final settingsPages = {
                    'client': const ClientSettingPage(),
                    'user': const UserManagePage(),
                    'app': const AppManagePage(),
                    'appPackage': const AppPackageManagePage(),
                  };
                  final function = state.pathParameters['function'] ?? 'client';
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: 'Settings',
                      leftPart: SettingsNav(
                        function: function,
                      ),
                      middlePart: settingsPages[function] ?? const SizedBox(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
  return router;
}
