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
      factory: _$InitRoute._fromState,
    );

mixin _$InitRoute on GoRouteData {
  static InitRoute _fromState(GoRouterState state) => const InitRoute();

  @override
  String get location => GoRouteData.$location(
        '/init',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $webLandingRoute => GoRouteData.$route(
      path: '/webLanding',
      factory: _$WebLandingRoute._fromState,
    );

mixin _$WebLandingRoute on GoRouteData {
  static WebLandingRoute _fromState(GoRouterState state) =>
      const WebLandingRoute();

  @override
  String get location => GoRouteData.$location(
        '/webLanding',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $imageViewerRoute => GoRouteData.$route(
      path: '/imageViewer/:index',
      factory: _$ImageViewerRoute._fromState,
    );

mixin _$ImageViewerRoute on GoRouteData {
  static ImageViewerRoute _fromState(GoRouterState state) => ImageViewerRoute(
        int.parse(state.pathParameters['index']!)!,
        state.extra as List<PicSwiperItem>?,
      );

  ImageViewerRoute get _self => this as ImageViewerRoute;

  @override
  String get location => GoRouteData.$location(
        '/imageViewer/${Uri.encodeComponent(_self.index.toString())}',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $moduleRoute => StatefulShellRouteData.$route(
      factory: $ModuleRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: TipherethRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Tiphereth',
              factory: _$TipherethRootRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: YesodRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Yesod',
              factory: _$YesodRootRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Yesod/:function',
              factory: _$YesodFunctionRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: GeburaRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Gebura',
              factory: _$GeburaRootRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/store',
              factory: _$GeburaStoreRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/library',
              factory: _$GeburaLibraryRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/librarySettings',
              factory: _$GeburaLibrarySettingsRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Gebura/library/:uuid',
              factory: _$GeburaLibraryDetailRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: ChesedRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Chesed',
              factory: _$ChesedRootRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: NotificationRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Notification',
              factory: _$NotificationRootRoute._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SettingsRoute.$navigatorKey,
          routes: [
            GoRouteData.$route(
              path: '/module/Settings',
              factory: _$SettingsRootRoute._fromState,
            ),
            GoRouteData.$route(
              path: '/module/Settings/:function',
              factory: _$SettingsFunctionRoute._fromState,
            ),
          ],
        ),
      ],
    );

extension $ModuleRouteExtension on ModuleRoute {
  static ModuleRoute _fromState(GoRouterState state) => const ModuleRoute();
}

mixin _$TipherethRootRoute on GoRouteData {
  static TipherethRootRoute _fromState(GoRouterState state) =>
      const TipherethRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Tiphereth',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$YesodRootRoute on GoRouteData {
  static YesodRootRoute _fromState(GoRouterState state) =>
      const YesodRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Yesod',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$YesodFunctionRoute on GoRouteData {
  static YesodFunctionRoute _fromState(GoRouterState state) =>
      YesodFunctionRoute(
        _$YesodFunctionsEnumMap._$fromName(state.pathParameters['function']!)!,
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$YesodActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  YesodFunctionRoute get _self => this as YesodFunctionRoute;

  @override
  String get location => GoRouteData.$location(
        '/module/Yesod/${Uri.encodeComponent(_$YesodFunctionsEnumMap[_self.function]!)}',
        queryParams: {
          if (_self.action != null)
            'action': _$YesodActionsEnumMap[_self.action!],
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
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

mixin _$GeburaRootRoute on GoRouteData {
  static GeburaRootRoute _fromState(GoRouterState state) =>
      const GeburaRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Gebura',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$GeburaStoreRoute on GoRouteData {
  static GeburaStoreRoute _fromState(GoRouterState state) =>
      const GeburaStoreRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Gebura/store',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$GeburaLibraryRoute on GoRouteData {
  static GeburaLibraryRoute _fromState(GoRouterState state) =>
      const GeburaLibraryRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Gebura/library',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$GeburaLibrarySettingsRoute on GoRouteData {
  static GeburaLibrarySettingsRoute _fromState(GoRouterState state) =>
      GeburaLibrarySettingsRoute(
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$GeburaLibrarySettingsActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  GeburaLibrarySettingsRoute get _self => this as GeburaLibrarySettingsRoute;

  @override
  String get location => GoRouteData.$location(
        '/module/Gebura/librarySettings',
        queryParams: {
          if (_self.action != null)
            'action': _$GeburaLibrarySettingsActionsEnumMap[_self.action!],
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

const _$GeburaLibrarySettingsActionsEnumMap = {
  GeburaLibrarySettingsActions.appScanResult: 'app-scan-result',
};

mixin _$GeburaLibraryDetailRoute on GoRouteData {
  static GeburaLibraryDetailRoute _fromState(GoRouterState state) =>
      GeburaLibraryDetailRoute(
        state.pathParameters['uuid']!,
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$GeburaLibraryDetailActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  GeburaLibraryDetailRoute get _self => this as GeburaLibraryDetailRoute;

  @override
  String get location => GoRouteData.$location(
        '/module/Gebura/library/${Uri.encodeComponent(_self.uuid)}',
        queryParams: {
          if (_self.action != null)
            'action': _$GeburaLibraryDetailActionsEnumMap[_self.action!],
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

const _$GeburaLibraryDetailActionsEnumMap = {
  GeburaLibraryDetailActions.assignApp: 'assign-app',
  GeburaLibraryDetailActions.appEdit: 'app-edit',
  GeburaLibraryDetailActions.appInstAdd: 'app-inst-add',
  GeburaLibraryDetailActions.appInstEdit: 'app-inst-edit',
  GeburaLibraryDetailActions.appInstLauncherAdd: 'app-inst-launcher-add',
  GeburaLibraryDetailActions.appInstLauncherEdit: 'app-inst-launcher-edit',
};

mixin _$ChesedRootRoute on GoRouteData {
  static ChesedRootRoute _fromState(GoRouterState state) =>
      const ChesedRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Chesed',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NotificationRootRoute on GoRouteData {
  static NotificationRootRoute _fromState(GoRouterState state) =>
      const NotificationRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Notification',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRootRoute on GoRouteData {
  static SettingsRootRoute _fromState(GoRouterState state) =>
      const SettingsRootRoute();

  @override
  String get location => GoRouteData.$location(
        '/module/Settings',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsFunctionRoute on GoRouteData {
  static SettingsFunctionRoute _fromState(GoRouterState state) =>
      SettingsFunctionRoute(
        _$SettingsFunctionsEnumMap
            ._$fromName(state.pathParameters['function']!)!,
        action: _$convertMapValue('action', state.uri.queryParameters,
            _$SettingsActionsEnumMap._$fromName),
        $extra: state.extra as dynamic,
      );

  SettingsFunctionRoute get _self => this as SettingsFunctionRoute;

  @override
  String get location => GoRouteData.$location(
        '/module/Settings/${Uri.encodeComponent(_$SettingsFunctionsEnumMap[_self.function]!)}',
        queryParams: {
          if (_self.action != null)
            'action': _$SettingsActionsEnumMap[_self.action!],
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

const _$SettingsFunctionsEnumMap = {
  SettingsFunctions.client: 'client',
  SettingsFunctions.server: 'server',
  SettingsFunctions.session: 'session',
  SettingsFunctions.porterContext: 'porter-context',
  SettingsFunctions.about: 'about',
};

const _$SettingsActionsEnumMap = {
  SettingsActions.sessionEdit: 'session-edit',
  SettingsActions.porterContextAdd: 'porter-context-add',
  SettingsActions.porterContextEdit: 'porter-context-edit',
};

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
