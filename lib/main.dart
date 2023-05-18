import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/app_setting/app_setting_bloc.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/common/store/setting_dao.dart';
import 'package:waitress/view/page/init_page.dart';

import 'common/const/route.dart';
import 'common/const/string.dart';

void main() async {
  await Hive.initFlutter();

  final settingBox = await Hive.openBox<Object>(settingBoxKey);

  runApp(MyApp(
    dependencies: AppDependency(
      settingDao: SettingDao(settingBox),
    ),
  ));

  if (!kIsWeb && Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = Size(1024, 768);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class AppDependency {
  final SettingDao settingDao;

  AppDependency({required this.settingDao});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.dependencies});

  final AppDependency dependencies;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(dependencies.settingDao),
        ),
        BlocProvider(
            create: (context) => AppSettingBloc(dependencies.settingDao)),
      ],
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          if (state is DefaultAppState) {
            context.read<AppSettingBloc>().add(InitAppSettingEvent());
          }
          final router = getRouter(context);
          return MaterialApp.router(
            title: 'Flutter Demo',
            // The Mandy red, light theme.
            theme: FlexThemeData.light(
              scheme: state.theme.scheme,
              useMaterial3: true,
            ),
            // The Mandy red, dark theme.
            darkTheme: FlexThemeData.dark(
              scheme: state.theme.scheme,
              useMaterial3: true,
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
