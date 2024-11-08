// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $initRoute,
      $webLandingRoute,
      $imageViewerRoute,
      $moduleRoute,
    ];

RouteBase get $initRoute => GoRouteData.$route(
      path: '/init',
      factory: $InitRouteExtension._fromState,
    );

extension $InitRouteExtension on InitRoute {
  static InitRoute _fromState(GoRouterState state) => const InitRoute();

  String get location => GoRouteData.$location(
        '/init',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $webLandingRoute => GoRouteData.$route(
      path: '/webLanding',
      factory: $WebLandingRouteExtension._fromState,
    );

extension $WebLandingRouteExtension on WebLandingRoute {
  static WebLandingRoute _fromState(GoRouterState state) =>
      const WebLandingRoute();

  String get location => GoRouteData.$location(
        '/webLanding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $imageViewerRoute => GoRouteData.$route(
      path: '/imageViewer/:index',
      factory: $ImageViewerRouteExtension._fromState,
    );

extension $ImageViewerRouteExtension on ImageViewerRoute {
  static ImageViewerRoute _fromState(GoRouterState state) => ImageViewerRoute(
        int.parse(state.pathParameters['index']!),
        state.extra as List<PicSwiperItem>?,
      );

  String get location => GoRouteData.$location(
        '/imageViewer/${Uri.encodeComponent(index.toString())}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $moduleRoute => StatefulShellRouteData.$route(
      factory: $ModuleRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: TipherethRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Tiphereth',
              factory: $TipherethRootRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: YesodRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Yesod',
              factory: $YesodRootRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Yesod/:function',
              factory: $YesodFunctionRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: GeburaRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Gebura',
              factory: $GeburaRootRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/store',
              factory: $GeburaStoreRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/library',
              factory: $GeburaLibraryRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/librarySettings',
              factory: $GeburaLibrarySettingsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/library/:uuid',
              factory: $GeburaLibraryDetailRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: ChesedRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Chesed',
              factory: $ChesedRootRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: NotificationRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Notification',
              factory: $NotificationRootRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SettingsRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Settings',
              factory: $SettingsRootRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Settings/:function',
              factory: $SettingsFunctionRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ModuleRouteExtension on ModuleRoute {
  static ModuleRoute _fromState(GoRouterState state) => const ModuleRoute();
}

extension $TipherethRootRouteExtension on TipherethRootRoute {
  static TipherethRootRoute _fromState(GoRouterState state) =>
      const TipherethRootRoute();

  String get location => GoRouteData.$location(
        '/module/Tiphereth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $YesodRootRouteExtension on YesodRootRoute {
  static YesodRootRoute _fromState(GoRouterState state) =>
      const YesodRootRoute();

  String get location => GoRouteData.$location(
        '/module/Yesod',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $YesodFunctionRouteExtension on YesodFunctionRoute {
  static YesodFunctionRoute _fromState(GoRouterState state) =>
      YesodFunctionRoute(
        _$YesodFunctionsEnumMap._$fromName(state.pathParameters['function']!),
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$YesodActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  String get location => GoRouteData.$location(
        '/module/Yesod/${Uri.encodeComponent(_$YesodFunctionsEnumMap[function]!)}',
        queryParams: {
          if (action != null) 'action': _$YesodActionsEnumMap[action!],
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

const _$YesodFunctionsEnumMap = {
  YesodFunctions.recent: 'recent',
  YesodFunctions.timeline: 'timeline',
  YesodFunctions.feedManage: 'feed-manage',
  YesodFunctions.actionManage: 'action-manage',
  YesodFunctions.notifyTargetManage: 'notify-target-manage',
  YesodFunctions.notifyFlowManage: 'notify-flow-manage',
};

const _$YesodActionsEnumMap = {
  YesodActions.recentSettings: 'recent-settings',
  YesodActions.feedEdit: 'feed-edit',
  YesodActions.feedAdd: 'feed-add',
  YesodActions.actionEdit: 'action-edit',
  YesodActions.actionAdd: 'action-add',
  YesodActions.notifyTargetEdit: 'notify-target-edit',
  YesodActions.notifyTargetAdd: 'notify-target-add',
  YesodActions.notifyFlowEdit: 'notify-flow-edit',
  YesodActions.notifyFlowAdd: 'notify-flow-add',
};

extension $GeburaRootRouteExtension on GeburaRootRoute {
  static GeburaRootRoute _fromState(GoRouterState state) =>
      const GeburaRootRoute();

  String get location => GoRouteData.$location(
        '/module/Gebura',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GeburaStoreRouteExtension on GeburaStoreRoute {
  static GeburaStoreRoute _fromState(GoRouterState state) =>
      const GeburaStoreRoute();

  String get location => GoRouteData.$location(
        '/module/Gebura/store',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GeburaLibraryRouteExtension on GeburaLibraryRoute {
  static GeburaLibraryRoute _fromState(GoRouterState state) =>
      const GeburaLibraryRoute();

  String get location => GoRouteData.$location(
        '/module/Gebura/library',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GeburaLibrarySettingsRouteExtension on GeburaLibrarySettingsRoute {
  static GeburaLibrarySettingsRoute _fromState(GoRouterState state) =>
      GeburaLibrarySettingsRoute(
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$GeburaLibrarySettingsActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  String get location => GoRouteData.$location(
        '/module/Gebura/librarySettings',
        queryParams: {
          if (action != null)
            'action': _$GeburaLibrarySettingsActionsEnumMap[action!],
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

const _$GeburaLibrarySettingsActionsEnumMap = {
  GeburaLibrarySettingsActions.commonAppScanResult: 'common-app-scan-result',
  GeburaLibrarySettingsActions.steamAppScanResult: 'steam-app-scan-result',
};

extension $GeburaLibraryDetailRouteExtension on GeburaLibraryDetailRoute {
  static GeburaLibraryDetailRoute _fromState(GoRouterState state) =>
      GeburaLibraryDetailRoute(
        state.pathParameters['uuid']!,
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$GeburaLibraryDetailActionsEnumMap._$fromName),
      );

  String get location => GoRouteData.$location(
        '/module/Gebura/library/${Uri.encodeComponent(uuid)}',
        queryParams: {
          if (action != null)
            'action': _$GeburaLibraryDetailActionsEnumMap[action!],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$GeburaLibraryDetailActionsEnumMap = {
  GeburaLibraryDetailActions.assignApp: 'assign-app',
};

extension $ChesedRootRouteExtension on ChesedRootRoute {
  static ChesedRootRoute _fromState(GoRouterState state) =>
      const ChesedRootRoute();

  String get location => GoRouteData.$location(
        '/module/Chesed',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotificationRootRouteExtension on NotificationRootRoute {
  static NotificationRootRoute _fromState(GoRouterState state) =>
      const NotificationRootRoute();

  String get location => GoRouteData.$location(
        '/module/Notification',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRootRouteExtension on SettingsRootRoute {
  static SettingsRootRoute _fromState(GoRouterState state) =>
      const SettingsRootRoute();

  String get location => GoRouteData.$location(
        '/module/Settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsFunctionRouteExtension on SettingsFunctionRoute {
  static SettingsFunctionRoute _fromState(GoRouterState state) =>
      SettingsFunctionRoute(
        _$SettingsFunctionsEnumMap
            ._$fromName(state.pathParameters['function']!),
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$SettingsActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  String get location => GoRouteData.$location(
        '/module/Settings/${Uri.encodeComponent(_$SettingsFunctionsEnumMap[function]!)}',
        queryParams: {
          if (action != null) 'action': _$SettingsActionsEnumMap[action!],
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

const _$SettingsFunctionsEnumMap = {
  SettingsFunctions.client: 'client',
  SettingsFunctions.session: 'session',
  SettingsFunctions.porterContext: 'porter-context',
  SettingsFunctions.porter: 'porter',
  SettingsFunctions.user: 'user',
  SettingsFunctions.app: 'app',
  SettingsFunctions.appPackage: 'app-package',
  SettingsFunctions.about: 'about',
};

const _$SettingsActionsEnumMap = {
  SettingsActions.sessionEdit: 'session-edit',
  SettingsActions.porterContextAdd: 'porter-context-add',
  SettingsActions.porterContextEdit: 'porter-context-edit',
  SettingsActions.porterEdit: 'porter-edit',
  SettingsActions.userEdit: 'user-edit',
  SettingsActions.userAdd: 'user-add',
  SettingsActions.appEdit: 'app-edit',
  SettingsActions.appAdd: 'app-add',
  SettingsActions.appPackageEdit: 'app-package-edit',
  SettingsActions.appPackageAdd: 'app-package-add',
};

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
