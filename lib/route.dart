import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'view/layout/overlapping_panels.dart';

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
import 'view/pages/yesod/yesod_config_add/yesod_config_add.dart';
import 'view/pages/yesod/yesod_config_edit_page.dart';
import 'view/pages/yesod/yesod_config_page.dart';
import 'view/pages/yesod/yesod_nav.dart';
import 'view/pages/yesod/yesod_recent_page.dart';
import 'view/pages/yesod/yesod_timeline_page.dart';

class AppRoutes {
  const AppRoutes._(this.path, {this.isAction = false});

  final String path;
  final bool isAction;
  @override
  String toString() => path;

  void go(BuildContext context) {
    GoRouter.of(context).go(path);
  }

  void pop(BuildContext context) {
    if (isAction) {
      final o = OverlappingPanels.of(context);
      o != null ? o.reveal(RevealSide.main) : Navigator.of(context).pop();
    } else {
      GoRouter.of(context).pop();
    }
  }

  static const AppRoutes init = AppRoutes._('/');
  static const AppRoutes login = AppRoutes._('/login');
  static const String _module = '/module';
  static AppRoutes module(ModuleName? moduleName) =>
      AppRoutes._('$_module${moduleName != null ? '/$moduleName' : ''}');

  static const AppRoutes tiphereth =
      AppRoutes._('$_module/${ModuleName._tiphereth}');

  static const String _yesod = '$_module/${ModuleName._yesod}';
  static const AppRoutes yesod = AppRoutes._(_yesod);
  static const AppRoutes yesodRecent =
      AppRoutes._('$_yesod/${_YesodFunctions.yesodRecent}');
  static const AppRoutes yesodTimeline =
      AppRoutes._('$_yesod/${_YesodFunctions.yesodTimeline}');
  static const AppRoutes yesodConfig =
      AppRoutes._('$_yesod/${_YesodFunctions.yesodConfig}');
  static AppRoutes yesodConfigEdit(int id) => AppRoutes._(
        '$yesodConfig?action=${_YesodActions.yesodConfigEdit}&id=$id',
        isAction: true,
      );
  static AppRoutes yesodConfigAdd() => AppRoutes._(
        '$yesodConfig?action=${_YesodActions.yesodConfigAdd}',
        isAction: true,
      );

  static const String _gebura = '$_module/${ModuleName._gebura}';
  static const AppRoutes gebura = AppRoutes._(_gebura);
  static const AppRoutes geburaStore =
      AppRoutes._('$_gebura/${_GeburaFunctions.store}');
  static const AppRoutes geburaLibrary =
      AppRoutes._('$_gebura/${_GeburaFunctions.library}');
  static AppRoutes geburaLibraryDetail(int id) =>
      AppRoutes._('$geburaLibrary?id=$id');

  static const String _settings = '$_module/${ModuleName._settings}';
  static const AppRoutes settings = AppRoutes._(_settings);
  static const AppRoutes settingsClient =
      AppRoutes._('$_settings/${_SettingsFunctions.client}');
  static const AppRoutes settingsUser =
      AppRoutes._('$_settings/${_SettingsFunctions.user}');
  static const AppRoutes settingsApp =
      AppRoutes._('$_settings/${_SettingsFunctions.app}');
  static const AppRoutes settingsAppPackage =
      AppRoutes._('$_settings/${_SettingsFunctions.appPackage}');
}

enum ModuleName {
  tiphereth._(_tiphereth),
  yesod._(_yesod),
  gebura._(_gebura),
  settings._(_settings);

  static const String _tiphereth = 'Tiphereth';
  static const String _yesod = 'Yesod';
  static const String _gebura = 'Gebura';
  static const String _settings = 'Settings';

  const ModuleName._(this.name);

  final String name;

  @override
  String toString() => name;
}

class _YesodFunctions {
  static const String yesodRecent = 'recent';
  static const String yesodTimeline = 'timeline';
  static const String yesodConfig = 'config';
}

class _YesodActions {
  static const String yesodConfigEdit = 'editConfig';
  static const String yesodConfigAdd = 'addConfig';
}

class _GeburaFunctions {
  static const String store = 'store';
  static const String library = 'library';
}

class _SettingsFunctions {
  static const String client = 'client';
  static const String user = 'user';
  static const String app = 'app';
  static const String appPackage = 'appPackage';
}

final GlobalKey<NavigatorState> _tipherethNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _yesodNavigateKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _geburaNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigateKey =
    GlobalKey<NavigatorState>();

GoRouter getRouter() {
  final router = GoRouter(
    initialLocation: AppRoutes.init.toString(),
    refreshListenable: StreamListener(GetIt.I<UserBloc>().stream),
    redirect: (context, state) {
      if (context.read<UserBloc>().state is PreLogin) {
        return AppRoutes.init.toString();
      }
      if (context.read<UserBloc>().state is OnLogin) {
        return AppRoutes.login.toString();
      }
      if (context.read<UserBloc>().state is PostLogin) {
        if (state.uri.toString() == AppRoutes.login.toString() ||
            state.uri.toString() == AppRoutes.init.toString()) {
          final userPath = context.read<AppSettingBloc>().userPath;
          if (userPath.startsWith(AppRoutes._module)) {
            return userPath;
          }
          return AppRoutes.tiphereth.toString();
        }
        if (state.uri.toString() == AppRoutes._module) {
          return AppRoutes.tiphereth.toString();
        }
      }
      context.read<AppSettingBloc>().userPath = state.uri.toString();
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.init.toString(),
        builder: (context, state) => const InitPage(),
      ),
      GoRoute(
        path: AppRoutes.login.toString(),
        builder: (context, state) => const LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, Widget child) {
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
                path: AppRoutes.tiphereth.toString(),
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.tiphereth,
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
                path: AppRoutes.yesod.toString(),
                redirect: (context, state) {
                  return AppRoutes.yesodRecent.toString();
                },
              ),
              GoRoute(
                path: '${AppRoutes.yesod}/:function',
                pageBuilder: (context, state) {
                  final yesodPages = {
                    _YesodFunctions.yesodRecent: const YesodRecentPage(),
                    _YesodFunctions.yesodTimeline: const YesodTimelinePage(),
                    _YesodFunctions.yesodConfig: const YesodConfigPage()
                  };
                  final function = state.pathParameters['function'] ??
                      _YesodFunctions.yesodRecent;
                  final action = state.uri.queryParameters['action'] ?? '';
                  final idParam = state.uri.queryParameters['id'];
                  final id = idParam != null ? int.tryParse(idParam) : null;

                  final yesodActions = {
                    _YesodActions.yesodConfigEdit: id != null
                        ? YesodConfigEditPage(
                            key: ValueKey(id), feedConfigID: id)
                        : const SizedBox(),
                    _YesodActions.yesodConfigAdd: const YesodConfigAdd(),
                  };
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.yesod,
                      leftPart: YesodNav(
                        function: function,
                      ),
                      middlePart: yesodPages[function],
                      rightPart: yesodActions[action],
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
                path: AppRoutes.gebura.toString(),
                redirect: (context, state) {
                  return AppRoutes.geburaStore.toString();
                },
              ),
              GoRoute(
                path: '${AppRoutes.gebura}/:function',
                pageBuilder: (context, state) {
                  final function = state.pathParameters['function'] ??
                      AppRoutes.geburaStore.toString();
                  final id = state.uri.queryParameters['id'] ?? '0';
                  final appID = int.tryParse(id) ?? 0;
                  final geburaPages = {
                    _GeburaFunctions.store: const GeburaStorePage(),
                    _GeburaFunctions.library:
                        GeburaLibraryDetailPage(appID: appID),
                  };
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.gebura,
                      leftPart: GeburaNav(
                        function: function,
                        selectedAppID: id,
                      ),
                      middlePart: geburaPages[function],
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
                path: AppRoutes.settings.toString(),
                redirect: (context, state) {
                  return AppRoutes.settingsClient.toString();
                },
              ),
              GoRoute(
                path: '${AppRoutes.settings}/:function',
                pageBuilder: (context, state) {
                  final settingsPages = {
                    _SettingsFunctions.client: const ClientSettingPage(),
                    _SettingsFunctions.user: const UserManagePage(),
                    _SettingsFunctions.app: const AppManagePage(),
                    _SettingsFunctions.appPackage: const AppPackageManagePage(),
                  };
                  final function = state.pathParameters['function'] ??
                      _SettingsFunctions.client;
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.settings,
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
