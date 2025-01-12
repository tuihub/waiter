import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/deeplink_bloc.dart';
import 'bloc/main_bloc.dart';
import 'common/platform.dart';
import 'view/specialized/theme_mode_toggle.dart';
import 'view/specialized/title_bar.dart';
import 'view/universal/common.dart';

// MainWindow is the top-level widget of the app
class MainWindow extends StatelessWidget {
  const MainWindow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AppRetainWidget(
      child: _DeepLinkWidget(
        child: _UIWidget(
          child: Scaffold(
            body: SafeArea(
              maintainBottomViewPadding: true,
              child: Stack(
                children: [
                  child,
                  const TitleBar(
                    actions: [ThemeModeToggle()],
                  ),
                ],
              ),
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
    const channel = MethodChannel('org.tuihub.waiter/app_retain');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) return;
        final stack =
            GoRouter.of(context).routerDelegate.currentConfiguration.matches;
        if (PlatformHelper.isAndroidApp()) {
          if (GoRouter.of(context).canPop() &&
              stack.elementAtOrNull(stack.length - 2)?.matchedLocation != '/') {
            GoRouter.of(context).pop();
          } else {
            unawaited(channel.invokeMethod('sendToBackground'));
          }
        } else {
          GoRouter.of(context).pop();
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
          context
              .read<MainBloc>()
              .add(MainSetNextServerConfigEvent(state.serverConfig));
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}

class _UIWidget extends StatelessWidget {
  const _UIWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) =>
          previous.uiDesign != current.uiDesign,
      builder: (context, state) {
        return UIDesignProvider(design: state.uiDesign, child: child);
      },
    );
  }
}
