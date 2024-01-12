import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_tray/system_tray.dart';

import 'bloc/chesed/chesed_bloc.dart';
import 'bloc/client_setting/client_setting_bloc.dart';
import 'bloc/gebura/gebura_bloc.dart';
import 'bloc/main_bloc.dart';
import 'bloc/netzach/netzach_bloc.dart';
import 'bloc/tiphereth/tiphereth_bloc.dart';
import 'bloc/yesod/yesod_bloc.dart';
import 'common/bloc_observer.dart';
import 'common/platform.dart';
import 'l10n/l10n.dart';
import 'model/common_model.dart';
import 'repo/grpc/api_helper.dart';
import 'repo/local/common.dart';
import 'route.dart';

part 'init.dart';

void main() async {
  // Required for Android App
  await Hive.initFlutter();

  final app = await init();

  runApp(app);

  if (PlatformHelper.isWindowsApp()) {
    doWhenWindowReady(() {
      const initialSize = Size(1024, 768);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }

  if (PlatformHelper.isAndroidApp()) {
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp(this.router, this.mainBloc, {super.key});

  final GoRouter router;
  final MainBloc mainBloc;

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
    final List<BlocProvider> newProviders = [
      BlocProvider<ClientSettingBloc>(
          create: (context) => widget.mainBloc.clientSettingBloc),
    ];
    if (widget.mainBloc.tipherethBloc != null) {
      newProviders.add(BlocProvider<TipherethBloc>(
          create: (context) => widget.mainBloc.tipherethBloc!));
    }
    if (widget.mainBloc.geburaBloc != null) {
      newProviders.add(BlocProvider<GeburaBloc>(
          create: (context) => widget.mainBloc.geburaBloc!));
    }
    if (widget.mainBloc.yesodBloc != null) {
      newProviders.add(BlocProvider<YesodBloc>(
          create: (context) => widget.mainBloc.yesodBloc!));
    }
    if (widget.mainBloc.chesedBloc != null) {
      newProviders.add(BlocProvider<ChesedBloc>(
          create: (context) => widget.mainBloc.chesedBloc!));
    }
    if (widget.mainBloc.netzachBloc != null) {
      newProviders.add(BlocProvider<NetzachBloc>(
          create: (context) => widget.mainBloc.netzachBloc!));
    }
    return newProviders;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.mainBloc,
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          final newProviders = genProviders(context);
          setState(() {
            providers = newProviders;
          });
        },
        builder: (context, state) {
          return MultiBlocProvider(
            providers: providers,
            child: _MyAppWidget(widget.router),
          );
        },
      ),
    );
  }
}

class _MyAppWidget extends StatelessWidget {
  const _MyAppWidget(this.router);

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSettingBloc, ClientSettingState>(
      builder: (context, state) {
        if (state is DefaultAppState) {
          context.read<ClientSettingBloc>().add(InitClientSettingEvent());
        }
        return MaterialApp.router(
          onGenerateTitle: (context) => S.of(context).title,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // The Mandy red, light theme.
          theme: FlexThemeData.light(
            scheme: state.theme.scheme,
            useMaterial3: true,
            surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
            blendLevel: 10,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 7,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            swapLegacyOnMaterial3: true,
          ),
          // The Mandy red, dark theme.
          darkTheme: FlexThemeData.dark(
            scheme: state.theme.scheme,
            surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
          ),
          themeMode: state.themeMode,
          // Use dark or light theme based on system setting.
          routerConfig: router,
        );
      },
    );
  }
}
