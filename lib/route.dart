import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import 'bloc/gebura/gebura_bloc.dart';
import 'bloc/main_bloc.dart';
import 'main_window.dart';
import 'repo/grpc/api_helper.dart';
import 'view/layout/overlapping_panels.dart';
import 'view/pages/chesed/chesed_home_page.dart';
import 'view/pages/frame_page.dart';
import 'view/pages/gebura/gebura_library_detail.dart';
import 'view/pages/gebura/gebura_library_overview.dart';
import 'view/pages/gebura/gebura_library_settings.dart';
import 'view/pages/gebura/gebura_nav.dart';
import 'view/pages/gebura/gebura_store.dart';
import 'view/pages/image_viewer.dart';
import 'view/pages/init_page.dart';
import 'view/pages/settings/about_page.dart';
import 'view/pages/settings/app/app_add_page.dart';
import 'view/pages/settings/app/app_edit_page.dart';
import 'view/pages/settings/app/app_manage_page.dart';
import 'view/pages/settings/app_package/app_package_add_page.dart';
import 'view/pages/settings/app_package/app_package_edit_page.dart';
import 'view/pages/settings/app_package/app_package_manage_page.dart';
import 'view/pages/settings/client/client_setting_page.dart';
import 'view/pages/settings/notify/notify_flow_add_page.dart';
import 'view/pages/settings/notify/notify_flow_edit_page.dart';
import 'view/pages/settings/notify/notify_flow_page.dart';
import 'view/pages/settings/notify/notify_target_add_page.dart';
import 'view/pages/settings/notify/notify_target_edit_page.dart';
import 'view/pages/settings/notify/notify_target_page.dart';
import 'view/pages/settings/porter/porter_edit_page.dart';
import 'view/pages/settings/porter/porter_manage_page.dart';
import 'view/pages/settings/session/session_edit_page.dart';
import 'view/pages/settings/session/session_manage_page.dart';
import 'view/pages/settings/settings_nav.dart';
import 'view/pages/settings/user/user_add_page.dart';
import 'view/pages/settings/user/user_edit_page.dart';
import 'view/pages/settings/user/user_manage_page.dart';
import 'view/pages/tiphereth/tiphereth_frame_page.dart';
import 'view/pages/web_landing_page.dart';
import 'view/pages/yesod/yesod_config_add_page.dart';
import 'view/pages/yesod/yesod_config_edit_page.dart';
import 'view/pages/yesod/yesod_config_page.dart';
import 'view/pages/yesod/yesod_nav.dart';
import 'view/pages/yesod/yesod_recent_page.dart';
import 'view/pages/yesod/yesod_recent_setting_page.dart';

class AppRoutes {
  const AppRoutes._(this.path, {this.isAction = false});

  final String path;
  final bool isAction;
  @override
  String toString() => path;

  void go(BuildContext context, {Object? extra}) {
    if (path.startsWith(_imageViewer)) {
      unawaited(GoRouter.of(context).push(path, extra: extra));
    } else {
      GoRouter.of(context).go(path, extra: extra);
    }
    if (isAction) {
      OverlappingPanels.of(context)?.reveal(RevealSide.right);
      FramePage.of(context)?.openDrawer();
    }
  }

  void push(BuildContext context, {Object? extra}) {
    unawaited(GoRouter.of(context).push(path, extra: extra));
    if (isAction) {
      OverlappingPanels.of(context)?.reveal(RevealSide.right);
      FramePage.of(context)?.openDrawer();
    }
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
  static const AppRoutes webLanding = AppRoutes._('/webLanding');
  static const String _imageViewer = '/imageViewer';
  static AppRoutes imageViewer(int index) =>
      AppRoutes._('$_imageViewer/$index');
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
  static AppRoutes yesodRecentFilter() => AppRoutes._(
        '$yesodRecent?action=${_YesodActions.recentFilter}',
        isAction: true,
      );

  static const String _gebura = '$_module/${ModuleName._gebura}';
  static const AppRoutes gebura = AppRoutes._(_gebura);
  static const AppRoutes geburaStore =
      AppRoutes._('$_gebura/${_GeburaFunctions.store}');
  static const AppRoutes geburaLibrary =
      AppRoutes._('$_gebura/${_GeburaFunctions.library}');
  static const AppRoutes geburaLibrarySettings =
      AppRoutes._('$_gebura/${_GeburaFunctions.librarySettings}');
  static AppRoutes geburaLibraryDetail(int id) =>
      AppRoutes._('$geburaLibrary?id=$id');

  static const String _chesed = '$_module/${ModuleName._chesed}';
  static const AppRoutes chesed = AppRoutes._(_chesed);

  static const String _settings = '$_module/${ModuleName._settings}';
  static const AppRoutes settings = AppRoutes._(_settings);
  static const AppRoutes settingsClient =
      AppRoutes._('$_settings/${_SettingsFunctions.client}');

  static const AppRoutes notifyTarget =
      AppRoutes._('$_settings/${_SettingsFunctions.notifyTarget}');
  static AppRoutes notifyTargetAdd() =>
      AppRoutes._('$notifyTarget?action=${_SettingsActions.notifyTargetAdd}',
          isAction: true);
  static AppRoutes notifyTargetEdit() =>
      AppRoutes._('$notifyTarget?action=${_SettingsActions.notifyTargetEdit}',
          isAction: true);
  static const AppRoutes notifyFlow =
      AppRoutes._('$_settings/${_SettingsFunctions.notifyFlow}');
  static AppRoutes notifyFlowAdd() =>
      AppRoutes._('$notifyFlow?action=${_SettingsActions.notifyFlowAdd}',
          isAction: true);
  static AppRoutes notifyFlowEdit() =>
      AppRoutes._('$notifyFlow?action=${_SettingsActions.notifyFlowEdit}',
          isAction: true);
  static AppRoutes settingsSession =
      const AppRoutes._('$_settings/${_SettingsFunctions.session}');
  static AppRoutes settingsSessionEdit() =>
      AppRoutes._('$settingsSession?action=${_SettingsActions.sessionEdit}',
          isAction: true);

  static const AppRoutes settingsPorter =
      AppRoutes._('$_settings/${_SettingsFunctions.porter}');
  static AppRoutes settingsPorterEdit() =>
      AppRoutes._('$settingsPorter?action=${_SettingsActions.porterEdit}',
          isAction: true);
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
  static const AppRoutes settingsAbout =
      AppRoutes._('$_settings/${_SettingsFunctions.about}');
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
  static const String recentFilter = 'filterRecent';
}

class _GeburaFunctions {
  static const String store = 'store';
  static const String library = 'library';
  static const String librarySettings = 'librarySettings';
}

class _SettingsFunctions {
  static const String client = 'client';
  static const String notifyTarget = 'notifyTarget';
  static const String notifyFlow = 'notifyFlow';
  static const String session = 'session';

  static const String porter = 'porter';
  static const String user = 'user';
  static const String app = 'app';
  static const String appPackage = 'appPackage';
  static const String about = 'about';
}

class _SettingsActions {
  static const String notifyTargetAdd = 'addNotifyTarget';
  static const String notifyTargetEdit = 'editNotifyTarget';
  static const String notifyFlowAdd = 'addNotifyFlow';
  static const String notifyFlowEdit = 'editNotifyFlow';
  static const String sessionEdit = 'editSession';

  static const String porterEdit = 'editPorter';
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
final mainWindowKey = GlobalKey();

GoRouter getRouter(MainBloc mainBloc, ApiHelper apiHelper) {
  return GoRouter(
    initialLocation: AppRoutes.init.toString(),
    observers: [HeroController()],
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: AppRoutes.init.toString(),
        pageBuilder: (context, state) => NoTransitionPage(
          child: MainWindow(
            key: mainWindowKey,
            child: const InitPage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.webLanding.toString(),
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: WebLandingPage()),
      ),
      GoRoute(
        path: '${AppRoutes._imageViewer}/:index',
        pageBuilder: (context, state) {
          final indexStr = state.pathParameters['index'];
          final index = indexStr != null ? int.tryParse(indexStr) : null;
          final pics = state.extra as List<PicSwiperItem>?;
          return CustomTransitionPage(
            fullscreenDialog: true,
            opaque: false,
            transitionsBuilder: (_, __, ___, child) => child,
            child: PicSwiper(
              index: index,
              pics: pics,
            ),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return NoTransitionPage(child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state.currentUser != null ||
                  context.read<MainBloc>().tipherethBloc != null) {
                return MainWindow(
                  key: mainWindowKey,
                  child: child,
                );
              }
              return MainWindow(
                key: mainWindowKey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ));
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
                    _YesodFunctions.config: const YesodConfigPage()
                  };
                  final function = state.pathParameters['function'] ??
                      _YesodFunctions.recent;
                  var action = state.uri.queryParameters['action'] ??
                      _YesodActions.configAdd;
                  if (function == _YesodFunctions.recent) {
                    action = _YesodActions.recentFilter;
                  }

                  final yesodActions = {
                    _YesodActions.configEdit: const YesodConfigEditPage(),
                    _YesodActions.configAdd: const YesodConfigAddPage(),
                    _YesodActions.recentFilter: const YesodRecentSettingPage(),
                  };
                  final gestureRight = function != _YesodFunctions.config;
                  return NoTransitionPage(
                    child: FramePage(
                      selectedNav: ModuleName.yesod,
                      leftPart: YesodNav(
                        function: function,
                      ),
                      middlePart: yesodPages[function],
                      rightPart: yesodActions[action],
                      gestureRight: gestureRight,
                    ),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _geburaNavigateKey,
            observers: [HeroController()],
            routes: [
              GoRoute(
                path: AppRoutes.gebura.toString(),
                redirect: (context, state) {
                  if (context
                          .read<GeburaBloc>()
                          .state
                          .selectedPurchasedAppIndex !=
                      null) {
                    return AppRoutes.geburaLibraryDetail(context
                            .read<GeburaBloc>()
                            .state
                            .selectedPurchasedAppIndex!)
                        .toString();
                  } else {
                    return AppRoutes.geburaLibrary.toString();
                  }
                },
              ),
              GoRoute(
                path: '${AppRoutes.gebura}/:function',
                pageBuilder: (context, state) {
                  final function = state.pathParameters['function'] ??
                      AppRoutes.geburaStore.toString();
                  final geburaPages = {
                    _GeburaFunctions.store: const GeburaStorePage(),
                    _GeburaFunctions.library: const GeburaLibraryOverview(),
                    _GeburaFunctions.librarySettings:
                        const GeburaLibrarySettings(),
                  };
                  Widget? page = geburaPages[function];
                  if (state.uri.queryParameters['id']?.isNotEmpty ?? false) {
                    final idStr = state.uri.queryParameters['id'] ?? '';
                    final id = int.tryParse(idStr) ?? 0;
                    page = GeburaLibraryDetailPage(index: id);
                  }
                  return CustomTransitionPage(
                    key: state.pageKey,
                    transitionsBuilder: (_, __, ___, child) => child,
                    child: FramePage(
                      selectedNav: ModuleName.gebura,
                      leftPart: GeburaNav(
                        function: function,
                      ),
                      middlePart: page,
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
                  return const NoTransitionPage(
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
                    _SettingsFunctions.notifyTarget: const NotifyTargetPage(),
                    _SettingsFunctions.notifyFlow: const NotifyFlowPage(),
                    _SettingsFunctions.session: const SessionManagePage(),
                    _SettingsFunctions.porter: const PorterManagePage(),
                    _SettingsFunctions.user: const UserManagePage(),
                    _SettingsFunctions.app: const AppManagePage(),
                    _SettingsFunctions.appPackage: const AppPackageManagePage(),
                    _SettingsFunctions.about: const AboutPage(),
                  };
                  final action = state.uri.queryParameters['action'] ??
                      _SettingsActions.userAdd;
                  final function = state.pathParameters['function'] ??
                      _SettingsFunctions.client;
                  final settingsActions = {
                    _SettingsActions.notifyTargetAdd:
                        const NotifyTargetAddPage(),
                    _SettingsActions.notifyTargetEdit:
                        const NotifyTargetEditPage(),
                    _SettingsActions.notifyFlowAdd: const NotifyFlowAddPage(),
                    _SettingsActions.notifyFlowEdit: const NotifyFlowEditPage(),
                    _SettingsActions.sessionEdit: const SessionEditPage(),
                    _SettingsActions.porterEdit: const PorterEditPage(),
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
                      middlePart: settingsPages[function] ?? Container(),
                      rightPart: settingsActions[action] ?? Container(),
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
}
