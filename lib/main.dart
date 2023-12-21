import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
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
import 'repo/grpc/api_helper.dart';
import 'repo/local/common.dart';
import 'repo/local/gebura.dart';
import 'repo/local/yesod.dart';
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

class MyApp extends StatelessWidget {
  const MyApp(this.router, this.mainBloc, {super.key});

  final GoRouter router;
  final MainBloc mainBloc;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => mainBloc),
        BlocProvider(create: (context) => mainBloc.tipherethBloc),
        BlocProvider(create: (context) => mainBloc.clientSettingBloc),
        BlocProvider(create: (context) => mainBloc.chesedBloc),
        BlocProvider(create: (context) => mainBloc.yesodBloc),
        BlocProvider(create: (context) => mainBloc.geburaBloc),
        BlocProvider(create: (context) => mainBloc.netzachBloc),
      ],
      child: BlocBuilder<ClientSettingBloc, ClientSettingState>(
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
      ),
    );
  }
}
