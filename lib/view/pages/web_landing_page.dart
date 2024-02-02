import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/main_bloc.dart';
import '../../common/platform.dart';
import '../../consts.dart';
import '../../l10n/l10n.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../helper/spacing.dart';
import '../layout/bootstrap_container.dart';
import 'server_select_overlay.dart';

class WebLandingPage extends StatelessWidget {
  const WebLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.primary,
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.onPrimary,
      ),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state.currentUser != null) {
            AppRoutes.tiphereth.go(context);
            Toast(title: '', message: S.of(context).welcome).show(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BootstrapContainer(children: [
              BootstrapColumn(
                xxs: 12,
                md: 8,
                lg: 6,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).welcomeHeader,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        SpacingHelper.defaultDivider,
                        Text(
                          S.of(context).downloadClient,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed:
                                  DotEnvValue.winClientDownloadUrl.isNotEmpty
                                      ? () async {
                                          final url = Uri.parse(
                                              DotEnvValue.winClientDownloadUrl);
                                          await launchUrl(url);
                                        }
                                      : null,
                              style: PlatformHelper.isWindows()
                                  ? primaryButtonStyle
                                  : null,
                              icon: Icon(
                                  const FaIcon(FontAwesomeIcons.windows).icon),
                              label: const Text('Windows'),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed:
                                  DotEnvValue.andClientDownloadUrl.isNotEmpty
                                      ? () async {
                                          final url = Uri.parse(
                                              DotEnvValue.andClientDownloadUrl);
                                          await launchUrl(url);
                                        }
                                      : null,
                              style: PlatformHelper.isAndroid()
                                  ? primaryButtonStyle
                                  : null,
                              icon: Icon(
                                  const FaIcon(FontAwesomeIcons.android).icon),
                              label: const Text('Android'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SpacingHelper.defaultDivider,
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            ServerSelectOverlay.of(context)?.fullscreen();
                          },
                          child: Text(S.of(context).continueInWebVersion),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
