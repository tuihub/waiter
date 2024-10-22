import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';

import '../../common/platform.dart';
import '../../l10n/l10n.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, this.actions = const []});

  final List<Widget> actions;

  static const double height = 28;

  @override
  Widget build(BuildContext context) {
    if (PlatformHelper.isAndroidApp()) {
      return const SizedBox();
    }
    return Row(
      children: [
        const SizedBox(
          width: 8,
          height: 28,
        ),
        // const Text(
        //   'Tui',
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 4),
        //   margin: const EdgeInsets.symmetric(horizontal: 2),
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).colorScheme.primary,
        //     borderRadius: BorderRadius.circular(4),
        //   ),
        //   child: const Text(
        //     'Hub',
        //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        //   ),
        // ),
        Expanded(
          child: PlatformHelper.isWindowsApp()
              ? WindowTitleBarBox(
                  child: MoveWindow(),
                )
              : PlatformHelper.isWeb()
                  ? Align(child: Text(S.of(context).webVersionFunctionLimited))
                  : const SizedBox(),
        ),
        for (final action in actions) action,
        const SizedBox(
          width: 8,
        ),
        if (PlatformHelper.isWindowsApp())
          Row(
            children: [
              MinimizeWindowButton(),
              MaximizeWindowButton(),
              CloseWindowButton(onPressed: () {
                unawaited(showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.of(context).close),
                      content: Text(S.of(context).areYouSureToClose),
                      actions: <Widget>[
                        TextButton(
                          child: Text(S.of(context).exit),
                          onPressed: () {
                            final SystemTray systemTray = SystemTray();
                            systemTray.destroy();
                            appWindow.close();
                          },
                        ),
                        TextButton(
                          child: Text(S.of(context).minimizeToTray),
                          onPressed: () {
                            Navigator.of(context).pop();
                            appWindow.hide();
                          },
                        ),
                        TextButton(
                          child: Text(S.of(context).cancel),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ));
              }),
            ],
          ),
      ],
    );
  }
}
