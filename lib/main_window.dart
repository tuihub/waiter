import 'package:flutter/material.dart';

import 'view/specialized/theme_mode_toggle.dart';
import 'view/specialized/title_bar.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const TitleBar(
              actions: [ThemeModeToggle()],
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
