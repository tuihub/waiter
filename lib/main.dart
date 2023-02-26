import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waitress/bloc/api_request/api_request_bloc.dart';
import 'package:waitress/bloc/app_setting/app_setting_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/view/page/init_page.dart';

void main() {
  runApp(const MyApp());

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingBloc(),
        ),
        BlocProvider(
          create: (context) => ApiRequestBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
          // const Color.fromARGB(255, 54, 57, 63)
          // Color.fromARGB(255, 32, 34, 37),
          scaffoldBackgroundColor: const Color.fromARGB(255, 54, 57, 63),
          cardColor: const Color.fromARGB(255, 54, 57, 63),
        ),
        home: InitPage(),
      ),
    );
  }
}
