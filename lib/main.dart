import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:universal_io/io.dart';

import 'bloc/chesed/chesed_bloc.dart';
import 'bloc/deeplink_bloc.dart';
import 'bloc/gebura/gebura_bloc.dart';
import 'bloc/main_bloc.dart';
import 'bloc/netzach/netzach_bloc.dart';
import 'bloc/tiphereth/tiphereth_bloc.dart';
import 'bloc/yesod/yesod_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/deeplink/deeplink.dart';
import 'common/platform.dart';
import 'consts.dart';
import 'l10n/l10n.dart';
import 'route.dart';
import 'rust/frb_generated.dart';
import 'service/di_service.dart';
import 'service/librarian_service/client.dart';

part 'init.dart';

// main function is the entry point of the app
void main(List<String> args) async {
  // Required for Android App
  await Hive.initFlutter();

  final app = await init();

  runApp(app);

  if (PlatformHelper.isWindowsApp()) {
    doWhenWindowReady(() {
      const initialSize = Size(1024, 768);
      if (!kDebugMode) {
        appWindow.minSize = initialSize;
      }
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }

  if (PlatformHelper.isAndroidApp()) {
    await FlutterDisplayMode.setHighRefreshRate();
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp(this.router, this.diService, {super.key});

  final GoRouter router;
  final DIService diService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setState(() {
      providers = genProviders(context);
    });
  }

  late List<BlocProvider> providers;

  List<BlocProvider> genProviders(BuildContext context) {
    final List<BlocProvider> newProviders = [];
    if (widget.diService.deepLinkBloc != null) {
      newProviders.add(BlocProvider<DeepLinkBloc>(
          create: (context) => widget.diService.deepLinkBloc!));
    }
    if (widget.diService.tipherethBloc != null) {
      newProviders.add(BlocProvider<TipherethBloc>(
          create: (context) => widget.diService.tipherethBloc!));
    }
    if (widget.diService.geburaBloc != null) {
      newProviders.add(BlocProvider<GeburaBloc>(
          create: (context) => widget.diService.geburaBloc!));
    }
    if (widget.diService.yesodBloc != null) {
      newProviders.add(BlocProvider<YesodBloc>(
          create: (context) => widget.diService.yesodBloc!));
    }
    if (widget.diService.chesedBloc != null) {
      newProviders.add(BlocProvider<ChesedBloc>(
          create: (context) => widget.diService.chesedBloc!));
    }
    if (widget.diService.netzachBloc != null) {
      newProviders.add(BlocProvider<NetzachBloc>(
          create: (context) => widget.diService.netzachBloc!));
    }
    return newProviders;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.diService.mainBloc!,
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          final newProviders = genProviders(context);
          setState(() {
            providers = newProviders;
          });
        },
        child:MultiBlocProvider(
          providers: providers,
          child: _MyAppWidget(widget.router),
        ),
      ),
    );
  }
}

class _MyAppWidget extends StatelessWidget {
  const _MyAppWidget(this.router);

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final lightTheme = _customizeTheme(
            Brightness.light,
            FlexThemeData.light(
              scheme: state.theme.scheme,
              useMaterial3: true,
              surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
              blendLevel: 10,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 7,
                useTextTheme: true,
                // useM2StyleDividerInM3: true,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              swapLegacyOnMaterial3: true,
            ));

        final darkTheme = _customizeTheme(
            Brightness.dark,
            FlexThemeData.dark(
              scheme: state.theme.scheme,
              surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
              blendLevel: 13,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 20,
                useTextTheme: true,
                // useM2StyleDividerInM3: true,
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
            ));

        late fluent.FluentThemeData fluentTheme;
        switch (state.themeMode) {
          case ThemeMode.light:
            fluentTheme = fluent.FluentThemeData.light();
          case ThemeMode.dark:
            fluentTheme = fluent.FluentThemeData.dark();
          case ThemeMode.system:
            switch (MediaQuery.of(context).platformBrightness) {
              case Brightness.light:
                fluentTheme = fluent.FluentThemeData.light();
              case Brightness.dark:
                fluentTheme = fluent.FluentThemeData.dark();
            }
        }

        return fluent.FluentTheme(
          data: fluentTheme,
          child: MaterialApp.router(
            onGenerateTitle: (context) => S.of(context).title,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              fluent.FluentLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
            routerConfig: router,
          ),
        );
      },
    );
  }
}

ThemeData _customizeTheme(Brightness brightness, ThemeData theme) {
  final t = theme.copyWith(
    listTileTheme: theme.listTileTheme.copyWith(
      selectedColor: theme.colorScheme.onPrimary,
      selectedTileColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
  if (!PlatformHelper.isWeb()) {
    // Temporary fix for font issue
    // https://github.com/flutter/flutter/issues/48381
    t.useSystemChineseFont(brightness);
  }
  return t;
}
