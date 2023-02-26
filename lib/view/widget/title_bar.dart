import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waitress/view/widget/window_button.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 8,
          height: 28,
        ),
        Text(
          "Tui",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 145, 0),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "Hub",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        if (!kIsWeb && Platform.isWindows)
          Expanded(
              child: WindowTitleBarBox(
            child: MoveWindow(),
          )),
        if (!kIsWeb && Platform.isWindows) WindowButtons()
      ],
    );
  }
}
