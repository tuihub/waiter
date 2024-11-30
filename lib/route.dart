import 'dart:async';

import 'package:dao/dao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_hero/local_hero.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';

import 'bloc/chesed/chesed_bloc.dart';
import 'bloc/gebura/gebura_bloc.dart';
import 'bloc/main_bloc.dart';
import 'bloc/netzach/netzach_bloc.dart';
import 'bloc/tiphereth/tiphereth_bloc.dart';
import 'bloc/yesod/yesod_bloc.dart';
import 'main_window.dart';
import 'repo/grpc/api_helper.dart';
import 'view/pages/chesed/chesed_home_page.dart';
import 'view/pages/frame_page.dart';
import 'view/pages/gebura/gebura_assign_app_panel.dart';
import 'view/pages/gebura/gebura_library_detail.dart';
import 'view/pages/gebura/gebura_library_overview.dart';
import 'view/pages/gebura/gebura_library_settings.dart';
import 'view/pages/gebura/gebura_nav.dart';
import 'view/pages/gebura/gebura_store.dart';
import 'view/pages/image_viewer.dart';
import 'view/pages/init_page.dart';
import 'view/pages/notification_page.dart';
import 'view/pages/settings/about_page.dart';
import 'view/pages/settings/app/app_add_panel.dart';
import 'view/pages/settings/app/app_edit_panel.dart';
import 'view/pages/settings/app/app_manage_page.dart';
import 'view/pages/settings/app_package/app_package_add_panel.dart';
import 'view/pages/settings/app_package/app_package_edit_panel.dart';
import 'view/pages/settings/app_package/app_package_manage_page.dart';
import 'view/pages/settings/client/client_setting_page.dart';
import 'view/pages/settings/porter/porter_manage_page.dart';
import 'view/pages/settings/porter_context_page.dart';
import 'view/pages/settings/session/session_edit_panel.dart';
import 'view/pages/settings/session/session_manage_page.dart';
import 'view/pages/settings/settings_nav.dart';
import 'view/pages/settings/user/user_add_panel.dart';
import 'view/pages/settings/user/user_edit_panel.dart';
import 'view/pages/settings/user/user_manage_page.dart';
import 'view/pages/tiphereth/tiphereth_frame_page.dart';
import 'view/pages/web_landing_page.dart';
import 'view/pages/yesod/manage_notify_flow_page.dart';
import 'view/pages/yesod/manage_notify_target_page.dart';
import 'view/pages/yesod/manage_yesod_action_page.dart';
import 'view/pages/yesod/manage_yesod_feed_page.dart';
import 'view/pages/yesod/yesod_nav.dart';
import 'view/pages/yesod/yesod_recent_page.dart';

part 'route.g.dart';

enum ModuleName {
  tiphereth._(_tiphereth),
  yesod._(_yesod),
  gebura._(_gebura),
  chesed._(_chesed),
  notification._(_notification),
  settings._(_settings);

  static const String _tiphereth = 'Tiphereth';
  static const String _yesod = 'Yesod';
  static const String _gebura = 'Gebura';
  static const String _chesed = 'Chesed';
  static const String _notification = 'Notification';
  static const String _settings = 'Settings';

  const ModuleName._(this.name);

  final String name;

  @override
  String toString() => name;
}

enum YesodFunctions {
  recent,
  timeline,
  feedManage,
  actionManage,
  notifyTargetManage,
  notifyFlowManage,
}

enum YesodActions {
  recentSettings,
  feedEdit,
  feedAdd,
  actionEdit,
  actionAdd,
  notifyTargetEdit,
  notifyTargetAdd,
  notifyFlowEdit,
  notifyFlowAdd,
}

enum GeburaFunctions {
  store,
  library,
  librarySettings,
}

enum SettingsFunctions {
  client,
  session,
  porterContext,
  porter,
  user,
  app,
  appPackage,
  about
}

enum SettingsActions {
  sessionEdit,
  porterContextAdd,
  porterContextEdit,
  porterEdit,
  userEdit,
  userAdd,
  appEdit,
  appAdd,
  appPackageEdit,
  appPackageAdd
}

final GlobalKey<NavigatorState> _tipherethNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _yesodNavigateKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _geburaNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _chesedNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _notificationNavigateKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingsNavigateKey =
    GlobalKey<NavigatorState>();
final mainWindowKey = GlobalKey();
final appFrameKey = GlobalKey();

@TypedGoRoute<InitRoute>(path: '/init')
class InitRoute extends GoRouteData {
  const InitRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
        child: MainWindow(
          key: mainWindowKey,
          child: const InitPage(),
        ),
      );
}

@TypedGoRoute<WebLandingRoute>(path: '/webLanding')
class WebLandingRoute extends GoRouteData {
  const WebLandingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
        child: MainWindow(
          key: mainWindowKey,
          child: const WebLandingPage(),
        ),
      );
}

@TypedGoRoute<ImageViewerRoute>(path: '/imageViewer/:index')
class ImageViewerRoute extends GoRouteData {
  const ImageViewerRoute(this.index, this.$extra);

  final int index;
  final List<PicSwiperItem>? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      fullscreenDialog: true,
      opaque: false,
      transitionsBuilder: (_, __, ___, child) => child,
      child: PicSwiper(
        index: index,
        pics: $extra,
      ),
    );
  }
}

@TypedStatefulShellRoute<ModuleRoute>(
  branches: [
    TypedStatefulShellBranch<TipherethRoute>(
      routes: [TypedGoRoute<TipherethRootRoute>(path: '/module/Tiphereth')],
    ),
    TypedStatefulShellBranch<YesodRoute>(
      routes: [
        TypedGoRoute<YesodRootRoute>(path: '/module/Yesod'),
        TypedGoRoute<YesodFunctionRoute>(path: '/module/Yesod/:function'),
      ],
    ),
    TypedStatefulShellBranch<GeburaRoute>(
      routes: [
        TypedGoRoute<GeburaRootRoute>(path: '/module/Gebura'),
        TypedGoRoute<GeburaStoreRoute>(path: '/module/Gebura/store'),
        TypedGoRoute<GeburaLibraryRoute>(path: '/module/Gebura/library'),
        TypedGoRoute<GeburaLibrarySettingsRoute>(
            path: '/module/Gebura/librarySettings'),
        TypedGoRoute<GeburaLibraryDetailRoute>(
            path: '/module/Gebura/library/:uuid'),
      ],
    ),
    TypedStatefulShellBranch<ChesedRoute>(
      routes: [TypedGoRoute<ChesedRootRoute>(path: '/module/Chesed')],
    ),
    TypedStatefulShellBranch<NotificationRoute>(
      routes: [
        TypedGoRoute<NotificationRootRoute>(path: '/module/Notification')
      ],
    ),
    TypedStatefulShellBranch<SettingsRoute>(
      routes: [
        TypedGoRoute<SettingsRootRoute>(path: '/module/Settings'),
        TypedGoRoute<SettingsFunctionRoute>(path: '/module/Settings/:function'),
      ],
    ),
  ],
)
class ModuleRoute extends StatefulShellRouteData {
  const ModuleRoute();

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return NoTransitionPage(child: BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.currentUser != null ||
            context.read<MainBloc>().tipherethBloc != null) {
          return MainWindow(
            key: mainWindowKey,
            child: AppFramePage(
              key: appFrameKey,
              navigationShell: navigationShell,
              child: navigationShell,
            ),
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
  }
}

class TipherethRoute extends StatefulShellBranchData {
  const TipherethRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _tipherethNavigateKey;
}

class TipherethRootRoute extends GoRouteData {
  const TipherethRootRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    context.read<TipherethBloc>().add(TipherethGetAccountsEvent());
    return const NoTransitionPage(
      child: ModuleFramePage(
        leftPart: TipherethFramePage(),
      ),
    );
  }
}

class YesodRoute extends StatefulShellBranchData {
  const YesodRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _yesodNavigateKey;
}

class YesodRootRoute extends GoRouteData {
  const YesodRootRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return const YesodFunctionRoute(YesodFunctions.recent).location;
  }
}

class YesodFunctionRoute extends GoRouteData {
  const YesodFunctionRoute(this.function, {this.action, this.$extra});

  final YesodFunctions function;
  final YesodActions? action;
  final dynamic $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final yesodPages = {
      YesodFunctions.recent: const YesodRecentPage(),
      YesodFunctions.timeline: Container(),
      YesodFunctions.feedManage: const YesodFeedManagePage(),
      YesodFunctions.actionManage: const YesodActionManagePage(),
      YesodFunctions.notifyTargetManage: const NotifyTargetPage(),
      YesodFunctions.notifyFlowManage: const NotifyFlowPage(),
    };
    final yesodActions = {
      YesodActions.recentSettings: const YesodRecentSettingPanel(),
      YesodActions.feedEdit: YesodFeedManageEditPanel(
        key: ValueKey($extra),
        index: $extra is int ? $extra! as int : 0,
      ),
      YesodActions.feedAdd: const YesodFeedManageAddPanel(),
      YesodActions.actionEdit: YesodActionManageEditPanel(
        key: ValueKey($extra),
        index: $extra is int ? $extra! as int : 0,
      ),
      YesodActions.actionAdd: const YesodActionManageAddPanel(),
      YesodActions.notifyTargetEdit: NotifyTargetEditPanel(
        key: ValueKey($extra),
        index: $extra is int ? $extra! as int : 0,
      ),
      YesodActions.notifyTargetAdd: const NotifyTargetAddPanel(),
      YesodActions.notifyFlowEdit: const NotifyFlowEditPanel(),
      YesodActions.notifyFlowAdd: const NotifyFlowAddPanel(),
    };
    if (action == null) {
      switch (function) {
        case YesodFunctions.recent:
        case YesodFunctions.timeline:
          context.read<YesodBloc>().add(YesodInitEvent());
          context.read<YesodBloc>().add(YesodFeedConfigLoadEvent());
        case YesodFunctions.feedManage:
          context.read<MainBloc>().add(MainRefreshServerInfoEvent());
          context.read<YesodBloc>().add(YesodFeedConfigLoadEvent());
        case YesodFunctions.actionManage:
          context.read<MainBloc>().add(MainRefreshServerInfoEvent());
          context.read<YesodBloc>().add(YesodFeedActionSetLoadEvent());
        case YesodFunctions.notifyTargetManage:
        case YesodFunctions.notifyFlowManage:
          context.read<MainBloc>().add(MainRefreshServerInfoEvent());
          context.read<NetzachBloc>().add(NetzachInitEvent());
          context.read<YesodBloc>().add(YesodInitEvent());
        default:
      }
    }
    return NoTransitionPage(
      child: ModuleFramePage(
        leftPart: YesodNav(
          function: function,
        ),
        middlePart: yesodPages[function] ?? Container(),
        rightPart: yesodActions[action] ?? Container(),
        gestureRight: false,
      ),
    );
  }
}

class GeburaRoute extends StatefulShellBranchData {
  const GeburaRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _geburaNavigateKey;

  static Widget rootWidget({required Widget child}) {
    return LocalHeroScope(
      curve: Curves.easeInOut,
      child: child,
    );
  }
}

class GeburaRootRoute extends GoRouteData {
  const GeburaRootRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    context.read<GeburaBloc>().add(GeburaInitEvent());
    return const GeburaLibraryRoute().location;
  }
}

class GeburaStoreRoute extends GoRouteData {
  const GeburaStoreRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: GeburaRoute.rootWidget(
        child: const ModuleFramePage(
          leftPart: GeburaNav(
            function: GeburaFunctions.store,
          ),
          middlePart: GeburaStorePage(),
        ),
      ),
    );
  }
}

class GeburaLibraryRoute extends GoRouteData {
  const GeburaLibraryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: GeburaRoute.rootWidget(
        child: const ModuleFramePage(
          leftPart: GeburaNav(
            function: GeburaFunctions.library,
          ),
          middlePart: GeburaLibraryOverview(),
        ),
      ),
    );
  }
}

enum GeburaLibrarySettingsActions {
  appScanResult,
}

class GeburaLibrarySettingsRoute extends GoRouteData {
  const GeburaLibrarySettingsRoute({this.action, this.$extra});

  final GeburaLibrarySettingsActions? action;
  final dynamic $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final actions = {
      GeburaLibrarySettingsActions.appScanResult: GeburaAppScanResultPanel(
        uuid: $extra is String ? $extra! as String : '',
      ),
    };
    return NoTransitionPage(
      child: GeburaRoute.rootWidget(
        child: ModuleFramePage(
          leftPart: const GeburaNav(
            function: GeburaFunctions.librarySettings,
          ),
          middlePart: const GeburaLibrarySettingsPage(),
          rightPart: actions[action] ?? Container(),
        ),
      ),
    );
  }
}

enum GeburaLibraryDetailActions {
  assignApp,
  appEdit,
  appInstAdd,
  appInstEdit,
  appInstLauncherAdd,
  appInstLauncherEdit,
}

class GeburaLibraryDetailRoute extends GoRouteData {
  const GeburaLibraryDetailRoute(this.uuid, {this.action, this.$extra});

  final GeburaLibraryDetailActions? action;
  final String uuid;
  final dynamic $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final actions = {
      GeburaLibraryDetailActions.assignApp: const GeburaAssignAppPanel(),
      GeburaLibraryDetailActions.appEdit: GeburaLibraryDetailAppPanel(
        uuid: uuid,
      ),
      GeburaLibraryDetailActions.appInstAdd: GeburaLibraryDetailAppInstAddPanel(
        uuid: uuid,
      ),
      GeburaLibraryDetailActions.appInstEdit:
          GeburaLibraryDetailAppInstEditPanel(
        initialValue: $extra is LocalAppInst ? $extra! as LocalAppInst : null,
      ),
      GeburaLibraryDetailActions.appInstLauncherAdd:
          GeburaLibraryDetailAppInstLauncherAddPanel(
        uuid: uuid,
        inst: $extra is LocalAppInst ? $extra! as LocalAppInst : null,
      ),
      GeburaLibraryDetailActions.appInstLauncherEdit:
          GeburaLibraryDetailAppInstLauncherEditPanel(
        launcher: $extra is LocalAppInstLauncher
            ? $extra! as LocalAppInstLauncher
            : null,
      ),
    };
    return NoTransitionPage(
      child: GeburaRoute.rootWidget(
        child: ModuleFramePage(
          leftPart: GeburaNav(
            function: GeburaFunctions.library,
            selectedItem: uuid,
          ),
          middlePart: GeburaLibraryDetailPage(uuid: uuid),
          rightPart: actions[action] ?? Container(),
        ),
      ),
    );
  }
}

class ChesedRoute extends StatefulShellBranchData {
  const ChesedRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _chesedNavigateKey;
}

class ChesedRootRoute extends GoRouteData {
  const ChesedRootRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    context.read<ChesedBloc>().add(ChesedSearchImagesEvent(''));
    return const NoTransitionPage(
      child: ModuleFramePage(
        leftPart: ChesedHome(),
      ),
    );
  }
}

class NotificationRoute extends StatefulShellBranchData {
  const NotificationRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      _notificationNavigateKey;
}

class NotificationRootRoute extends GoRouteData {
  const NotificationRootRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    context.read<NetzachBloc>().add(NetzachSystemNotificationLoadEvent(1));
    return const NoTransitionPage(
      child: ModuleFramePage(
        leftPart: NotificationPage(),
      ),
    );
  }
}

class SettingsRoute extends StatefulShellBranchData {
  const SettingsRoute();

  static final GlobalKey<NavigatorState> $navigatorKey = _settingsNavigateKey;
}

class SettingsRootRoute extends GoRouteData {
  const SettingsRootRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return const SettingsFunctionRoute(SettingsFunctions.client).location;
  }
}

class SettingsFunctionRoute extends GoRouteData {
  const SettingsFunctionRoute(this.function, {this.action, this.$extra});

  final SettingsFunctions function;
  final SettingsActions? action;
  final dynamic $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final settingsPages = {
      SettingsFunctions.client: const ClientSettingPage(),
      SettingsFunctions.session: const SessionManagePage(),
      SettingsFunctions.porterContext: const PorterContextManagePage(),
      SettingsFunctions.porter: const PorterManagePage(),
      SettingsFunctions.user: const UserManagePage(),
      SettingsFunctions.app: const AppManagePage(),
      SettingsFunctions.appPackage: const AppPackageManagePage(),
      SettingsFunctions.about: const AboutPage(),
    };
    final settingsActions = {
      SettingsActions.sessionEdit: const SessionEditPanel(),
      SettingsActions.porterContextAdd: PorterContextAddPanel(
        key: ValueKey($extra),
        porterGroup:
            $extra is PorterGroup ? $extra! as PorterGroup : PorterGroup(),
      ),
      SettingsActions.porterContextEdit: PorterContextEditPanel(
        key: ValueKey($extra),
        porterContext: $extra is PorterContext
            ? $extra! as PorterContext
            : PorterContext(),
      ),
      SettingsActions.porterEdit: const PorterEditPanel(),
      SettingsActions.userAdd: const UserAddPanel(),
      SettingsActions.userEdit: UserEditPanel(
        key: ValueKey($extra),
        user: $extra is User ? $extra! as User : User(),
      ),
      SettingsActions.appAdd: const AppAddPanel(),
      SettingsActions.appEdit: AppEditPanel(
        key: ValueKey($extra),
        app: $extra is AppInfo ? $extra! as AppInfo : AppInfo(),
      ),
      SettingsActions.appPackageAdd: const AppPackageAddPanel(),
      SettingsActions.appPackageEdit: AppPackageEditPanel(
        key: ValueKey($extra),
        appPackage: $extra is App ? $extra! as App : App(),
      ),
    };
    if (action == null) {
      switch (function) {
        case SettingsFunctions.session:
          context.read<TipherethBloc>().add(TipherethLoadSessionsEvent());
        case SettingsFunctions.porter:
          context.read<TipherethBloc>().add(TipherethLoadPortersEvent());
        case SettingsFunctions.porterContext:
          context.read<TipherethBloc>().add(TipherethLoadPorterContextsEvent());
        default:
      }
    }
    return NoTransitionPage(
      child: ModuleFramePage(
        leftPart: SettingsNav(
          function: function,
        ),
        middlePart: settingsPages[function] ?? Container(),
        rightPart: settingsActions[action] ?? Container(),
        gestureRight: false,
      ),
    );
  }
}

GoRouter getRouter(MainBloc mainBloc, ApiHelper apiHelper) {
  return GoRouter(
    initialLocation: const InitRoute().location,
    observers: [
      HeroController(),
      SentryNavigatorObserver(),
    ],
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
  );
}
