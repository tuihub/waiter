import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../../common/util/platform.dart';
import 'window_button.dart';

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
        const Text(
          'Tui',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'Hub',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(
          child: PlatformHelper.isWindowsApp()
              ? WindowTitleBarBox(
                  child: MoveWindow(),
                )
              : const SizedBox(),
        ),
        for (final action in actions) action,
        const SizedBox(
          width: 8,
        ),
        if (PlatformHelper.isWindowsApp()) const WindowButtons()
      ],
    );
  }
}
