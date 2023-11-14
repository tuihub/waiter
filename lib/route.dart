import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import 'bloc/api_request/api_request_bloc.dart';
import 'bloc/app_setting/app_setting_bloc.dart';
import 'bloc/user_login/user_bloc.dart';
import 'bloc/yesod/yesod_cubit.dart';
import 'common/api/api_helper.dart';
import 'common/api/client.dart';
import 'common/util/stream_listener.dart';
import 'view/layout/overlapping_panels.dart';
import 'view/pages/chesed/chesed_home_page.dart';
import 'view/pages/frame_page.dart';
import 'view/pages/gebura/gebura_library_detail.dart';
import 'view/pages/gebura/gebura_nav.dart';
import 'view/pages/gebura/gebura_store.dart';
import 'view/pages/init_page.dart';
import 'view/pages/login_page.dart';
import 'view/pages/settings/app/app_add_page.dart';
import 'view/pages/settings/app/app_edit_page.dart';
import 'view/pages/settings/app/app_manage_page.dart';
import 'view/pages/settings/app_package/app_package_add_page.dart';
import 'view/pages/settings/app_package/app_package_edit_page.dart';
import 'view/pages/settings/app_package/app_package_manage_page.dart';
import 'view/pages/settings/client_setting_page.dart';
import 'view/pages/settings/settings_nav.dart';
import 'view/pages/settings/user/user_add_page.dart';
import 'view/pages/settings/user/user_edit_page.dart';
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

  void go(BuildContext context, {Object? extra}) {
    GoRouter.of(context).go(path, extra: extra);
  }

  void pop(BuildContext context) {
    if (isAction) {
      final o = OverlappingPanels.of(context);
      o != null ? o.reveal(RevealSide.main) : GoRouter.of(context).pop();
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
      AppRoutes._('$_yesod/${_YesodFunctions.recent}');
  static const AppRoutes yesodTimeline =
      AppRoutes._('$_yesod/${_YesodFunctions.timeline}');
  static const AppRoutes yesodConfig =
      AppRoutes._('$_yesod/${_YesodFunctions.config}');
  static AppRoutes yesodConfigEdit() => AppRoutes._(
        '$yesodConfig?action=${_YesodActions.configEdit}',
        isAction: true,
      );
  static AppRoutes yesodConfigAdd() => AppRoutes._(
        '$yesodConfig?action=${_YesodActions.configAdd}',
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

  static const String _chesed = '$_module/${ModuleName._chesed}';
  static const AppRoutes chesed = AppRoutes._(_chesed);

  static const String _settings = '$_module/${ModuleName._settings}';
  static const AppRoutes settings = AppRoutes._(_settings);
  static const AppRoutes settingsClient =
      AppRoutes._('$_settings/${_SettingsFunctions.client}');
  static const AppRoutes settingsUser =
      AppRoutes._('$_settings/${_SettingsFunctions.user}');
  static AppRoutes settingsUserAdd() =>
      AppRoutes._('$settingsUser?action=${_SettingsActions.userAdd}',
          isAction: true);
  static AppRoutes settingsUserEdit() =>
      AppRoutes._('$settingsUser?action=${_SettingsActions.userEdit}',
          isAction: true);
  static const AppRoutes settingsApp =
      AppRoutes._('$_settings/${_SettingsFunctions.app}');
  static AppRoutes settingsAppEdit() =>
      AppRoutes._('$settingsApp?action=${_SettingsActions.appEdit}',
          isAction: true);
  static AppRoutes settingsAppAdd() =>
      AppRoutes._('$settingsApp?action=${_SettingsActions.appAdd}',
          isAction: true);
  static const AppRoutes settingsAppPackage =
      AppRoutes._('$_settings/${_SettingsFunctions.appPackage}');
  static AppRoutes settingsAppPackageEdit() => AppRoutes._(
      '$settingsAppPackage?action=${_SettingsActions.appPackageEdit}',
      isAction: true);
  static AppRoutes settingsAppPackageAdd() => AppRoutes._(
      '$settingsAppPackage?action=${_SettingsActions.appPackageAdd}',
      isAction: true);
}

enum ModuleName {
  tiphereth._(_tiphereth),
  yesod._(_yesod),
  gebura._(_gebura),
  chesed._(_chesed),
  settings._(_settings);

  static const String _tiphereth = 'Tiphereth';
  static const String _yesod = 'Yesod';
  static const String _gebura = 'Gebura';
  static const String _chesed = 'Chesed';
  static const String _settings = 'Settings';

  const ModuleName._(this.name);

  final String name;

  @override
  String toString() => name;
}

class _YesodFunctions {
  static const String recent = 'recent';
  static const String timeline = 'timeline';
  static const String config = 'config';
}

class _YesodActions {
  static const String configEdit = 'editConfig';
  static const String configAdd = 'addConfig';
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

class _SettingsActions {
  static const String userEdit = 'editUser';
  static const String userAdd = 'addUser';
  static const String appEdit = 'editApp';
  static const String appAdd = 'addApp';
  static const String appPackageEdit = 'editAppPackage';
  static const String appPackageAdd = 'addAppPackage';
}

final GlobalKey<NavigatorState> _tipherethNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _yesodNavigateKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _geburaNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _chesedNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigateKey =
    GlobalKey<NavigatorState>();

GoRouter getRouter() {
  final router = GoRouter(
    initialLocation: AppRoutes.init.toString(),
    refreshListenable: StreamListener(GetIt.I<UserBloc>().stream),
    debugLogDiagnostics: true,
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
                    _YesodFunctions.recent: const YesodRecentPage(),
                    _YesodFunctions.timeline: const YesodTimelinePage(),
                    _YesodFunctions.config: const YesodConfigPage()
                  };
                  final function = state.pathParameters['function'] ??
                      _YesodFunctions.recent;
                  final action = state.uri.queryParameters['action'] ??
                      _YesodActions.configAdd;

                  final yesodActions = {
                    _YesodActions.configEdit: const YesodConfigEditPage(),
                    _YesodActions.configAdd: const YesodConfigAdd(),
                  };
                  return NoTransitionPage(
                    child: BlocProvider(
                      create: (context) => YesodCubit(GetIt.I<ApiHelper>()),
                      child: FramePage(
                        selectedNav: ModuleName.yesod,
                        leftPart: YesodNav(
                          function: function,
                        ),
                        middlePart: yesodPages[function],
                        rightPart: yesodActions[action],
                        gestureRight: false,
                      ),
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
            navigatorKey: _chesedNavigateKey,
            routes: [
              GoRoute(
                path: AppRoutes.chesed.toString(),
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.chesed,
                      leftPart: ChesedHome(),
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
                  final action = state.uri.queryParameters['action'] ??
                      _SettingsActions.userAdd;
                  final function = state.pathParameters['function'] ??
                      _SettingsFunctions.client;
                  final settingsActions = {
                    _SettingsActions.userAdd: const UserAddPage(),
                    _SettingsActions.userEdit: UserEditPage(
                      key: ValueKey(state.extra),
                      user: state.extra is User ? state.extra! as User : User(),
                    ),
                    _SettingsActions.appAdd: const AppAddPage(),
                    _SettingsActions.appEdit: AppEditPage(
                      key: ValueKey(state.extra),
                      app: state.extra is App ? state.extra! as App : App(),
                    ),
                    _SettingsActions.appPackageAdd: const AppPackageAddPage(),
                    _SettingsActions.appPackageEdit: AppPackageEditPage(
                      key: ValueKey(state.extra),
                      appPackage: state.extra is AppPackage
                          ? state.extra! as AppPackage
                          : AppPackage(),
                    ),
                  };
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.settings,
                      leftPart: SettingsNav(
                        function: function,
                      ),
                      middlePart: settingsPages[function],
                      rightPart: settingsActions[action],
                      gestureRight: false,
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
