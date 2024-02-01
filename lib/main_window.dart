import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/deeplink_bloc.dart';
import 'common/platform.dart';
import 'view/pages/server_select_overlay.dart';
import 'view/specialized/theme_mode_toggle.dart';
import 'view/specialized/title_bar.dart';

class MainWindow extends StatelessWidget {
  const MainWindow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AppRetainWidget(
      child: _DeepLinkWidget(
        child: Scaffold(
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                const TitleBar(
                  actions: [ThemeModeToggle()],
                ),
                Expanded(
                  child: ClipRect(
                    child: ServerSelectOverlay(child: child),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Temporary fix for https://github.com/flutter/flutter/issues/117061
// From https://github.com/ppicas/flutter-android-background
class _AppRetainWidget extends StatelessWidget {
  const _AppRetainWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const channel = MethodChannel('com.tuihub.waiter/app_retain');
    return WillPopScope(
      onWillPop: () async {
        if (PlatformHelper.isAndroidApp()) {
          if (Navigator.of(context).canPop()) {
            return true;
          } else {
            await channel.invokeMethod('sendToBackground');
            return false;
          }
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}

class _DeepLinkWidget extends StatelessWidget {
  const _DeepLinkWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeepLinkBloc, DeepLinkState>(
      listener: (context, state) {
        if (state is DeepLinkConnectState) {
          // TODO
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}
