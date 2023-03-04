import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/bloc/app_setting_bloc.dart';
import 'package:waitress/view/widget/window_button.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
          height: 28,
        ),
        const Text(
          "Tui",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 145, 0),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            "Hub",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(
          child: (!kIsWeb && Platform.isWindows)
              ? WindowTitleBarBox(
                  child: MoveWindow(),
                )
              : const SizedBox(),
        ),
        IconButton(
          style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(
              Size(24, 24),
            ),
            maximumSize: MaterialStatePropertyAll(
              Size(24, 24),
            ),
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<AppSettingBloc>().add(ToggleBrightnessEvent());
          },
          icon: Theme.of(context).brightness == Brightness.light
              ? const Icon(Icons.brightness_5)
              : const Icon(Icons.brightness_3),
          iconSize: 14,
        ),
        if (!kIsWeb && Platform.isWindows) const WindowButtons()
      ],
    );
  }
}
