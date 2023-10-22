import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/app_setting/app_setting_bloc.dart';
import 'bloc/user_login/user_bloc.dart';
import 'common/util/platform.dart';
import 'init.dart';
import 'l10n/l10n.dart';

void main() async {
  await Hive.initFlutter();

  await init();

  runApp(const MyApp());

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I<AppSettingBloc>(),
        ),
      ],
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          if (state is DefaultAppState) {
            context.read<AppSettingBloc>().add(InitAppSettingEvent());
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
            routerConfig: GetIt.I<GoRouter>(),
          );
        },
      ),
    );
  }
}
