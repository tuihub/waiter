import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/bloc/app_setting_bloc.dart';
import 'package:waitress/bloc/user_login/user_bloc.dart';
import 'package:waitress/common/const/color.dart';
import 'package:waitress/common/store/setting_dao.dart';
import 'package:waitress/view/page/init_page.dart';

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
      const initialSize = Size(600, 450);
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
        BlocProvider(create: (context) => AppSettingBloc()),
      ],
      child: BlocBuilder<AppSettingBloc, AppSettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
              brightness: state.brightness,
              // primarySwatch: Colors.amber,
              colorSchemeSeed: state.colorSeed,
              // const Color.fromARGB(255, 54, 57, 63)
              // Color.fromARGB(255, 32, 34, 37),
              // scaffoldBackgroundColor: const Color.fromARGB(255, 54, 57, 63),
              // cardColor: const Color.fromARGB(255, 54, 57, 63),
            ),
            home: const InitPage(),
          );
        },
      ),
    );
  }
}
