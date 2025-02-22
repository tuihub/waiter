import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../bloc/main_bloc.dart';
import '../../common/platform.dart';
import '../../consts.dart';
import '../../l10n/l10n.dart';
import '../../route.dart';

import '../layout/bootstrap_container.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(MainInitEvent(null));
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
          if (state is MainInitState && state.success) {
            const TipherethRootRoute().go(context);
            UniversalToast.show(context, message: S.of(context).welcomeBack);
          } else if (state is MainInitState && state.failed) {
            if (PlatformHelper.isWeb() &&
                (DotEnvValue.andClientDownloadUrl.isNotEmpty ||
                    DotEnvValue.winClientDownloadUrl.isNotEmpty)) {
              const WebLandingRoute().go(context);
            } else {
              const TipherethRootRoute().go(context);
              if (state.msg != null) {
                UniversalToast.show(context, message: state.msg!);
              }
            }
          }
        },
        builder: (context, state) {
          return const Scaffold(
            body: BootstrapContainer(children: [
              BootstrapColumn(
                xxs: 12,
                md: 6,
                child: InitWidget(),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      final logoHeight = MediaQuery.sizeOf(context).height / 5;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: SpacingHelper.listSpacing(
          height: 16,
          children: [
            Image.asset('web/icons/Icon-512.png', height: logoHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' #',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 24.0,
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
            ),
            const UniversalLinearProgressIndicator(),
            UniversalTextButton(
                child: Text(S.of(context).skipLoading),
                onPressed: () {
                  const TipherethRootRoute().go(context);
                }),
          ],
        ),
      );
    });
  }
}
