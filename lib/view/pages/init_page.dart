import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../../common/platform.dart';
import '../../consts.dart';
import '../../l10n/l10n.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../layout/bootstrap_container.dart';
import '../universal/card.dart';
import 'server_select_overlay.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(MainAutoLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor:
            Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state is MainAutoLoginState && state.success) {
            const TipherethRootRoute().go(context);
            ServerSelectOverlay.of(context)?.minimize();
            Toast(title: '', message: S.of(context).welcomeBack).show(context);
          }
          if (state is MainAutoLoginState &&
              state.failed &&
              PlatformHelper.isWeb() &&
              (DotEnvValue.andClientDownloadUrl.isNotEmpty ||
                  DotEnvValue.winClientDownloadUrl.isNotEmpty)) {
            ServerSelectOverlay.of(context)?.hide();
            const WebLandingRoute().go(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BootstrapContainer(children: [
              BootstrapColumn(
                xxs: 12,
                md: 6,
                child: UniversalCard(
                  child: SizedBox(
                    height: 320,
                    child: getInitWidget(state),
                  ),
                ),
              ),
            ]),
            floatingActionButton: state is MainAutoLoginState && state.failed
                ? FloatingActionButton.extended(
                    onPressed: () {
                      ServerSelectOverlay.of(context)?.fullscreen();
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: Text(S.of(context).login),
                  )
                : Container(),
          );
        },
      ),
    );
  }

  Widget getInitWidget(MainState state) {
    return const InitWidget();
    // if (state is AutoLogging) {
    //   return const InitWidget();
    // }
    // return const WelComeWidget();
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tui',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(
                width: 4,
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          if (state is MainAutoLoginState && state.processing)
            const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          else
            SizedBox(
              height: 24,
              child: Text(
                S.of(context).clickLoginToStart,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      );
    });
  }
}

class WelComeWidget extends StatelessWidget {
  const WelComeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          ' #',
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 3000),
            animatedTexts: [
              TyperAnimatedText(
                'Tiphereth',
                speed: const Duration(
                  milliseconds: 200,
                ),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Gebura',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
              TyperAnimatedText(
                'Yesod',
                speed: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
