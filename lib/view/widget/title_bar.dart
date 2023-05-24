import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waitress/view/widget/window_button.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, this.actions = const []});

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
          height: 28,
        ),
        Expanded(
          child: (!kIsWeb && Platform.isWindows)
              ? WindowTitleBarBox(
                  child: MoveWindow(),
                )
              : const SizedBox(),
        ),
        for (var action in actions) action,
        SizedBox(
          width: 8,
        ),
        if (!kIsWeb && Platform.isWindows) const WindowButtons()
      ],
    );
  }
}
