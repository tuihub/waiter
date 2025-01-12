import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_ui/universal_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/main_bloc.dart';
import '../../consts.dart';
import '../../l10n/l10n.dart';
import '../../route.dart';
import '../components/toast.dart';
import '../layout/bootstrap_container.dart';

class WebLandingPage extends StatelessWidget {
  const WebLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryButtonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        Theme.of(context).colorScheme.primary,
      ),
      foregroundColor: WidgetStateProperty.all<Color>(
        Theme.of(context).colorScheme.onPrimary,
      ),
    );
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor:
            Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state.currentUser != null) {
            const TipherethRootRoute().go(context);
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
                child: UniversalCard(
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
                        if (DotEnvValue.host.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                UniversalElevatedButton.icon(
                                  onPressed: () async {
                                    final host = DotEnvValue.host;
                                    final port = DotEnvValue.port.isNotEmpty
                                        ? DotEnvValue.port
                                        : '443';
                                    final tls = DotEnvValue.tls.isNotEmpty
                                        ? DotEnvValue.tls
                                        : 'true';
                                    final url = Uri.parse(
                                        'tuihub://connect/$host?port=$port&tls=$tls');
                                    await launchUrl(url);
                                  },
                                  // style: primaryButtonStyle,
                                  icon: Icon(const FaIcon(FontAwesomeIcons
                                          .arrowUpRightFromSquare)
                                      .icon),
                                  label: Text(S.of(context).connectInClient),
                                ),
                                UniversalElevatedButton.icon(
                                  onPressed: () async {
                                    final host = DotEnvValue.host;
                                    final port = DotEnvValue.port.isNotEmpty
                                        ? DotEnvValue.port
                                        : '443';
                                    final tls = DotEnvValue.tls.isNotEmpty
                                        ? DotEnvValue.tls
                                        : 'true';
                                    unawaited(showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return UniversalDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SelectableText(
                                                  '${S.of(context).address}: $host'),
                                              SelectableText(
                                                  '${S.of(context).port}: $port'),
                                              SelectableText(
                                                  '${S.of(context).tls}: $tls'),
                                            ],
                                          ),
                                        );
                                      },
                                    ));
                                  },
                                  icon: Icon(
                                      const FaIcon(FontAwesomeIcons.circleInfo)
                                          .icon),
                                  label: Text(S.of(context).showServerConfig),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 16),
                        SpacingHelper.defaultDivider,
                        Text(
                          S.of(context).downloadClient,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            UniversalElevatedButton.icon(
                              onPressed:
                                  DotEnvValue.winClientDownloadUrl.isNotEmpty
                                      ? () async {
                                          final url = Uri.parse(
                                              DotEnvValue.winClientDownloadUrl);
                                          await launchUrl(url);
                                        }
                                      : null,
                              // style: PlatformHelper.isWindows() &&
                              //         DotEnvValue
                              //             .winClientDownloadUrl.isNotEmpty
                              //     ? primaryButtonStyle
                              //     : null,
                              icon: Icon(
                                  const FaIcon(FontAwesomeIcons.windows).icon),
                              label: const Text('Windows'),
                            ),
                            UniversalElevatedButton.icon(
                              onPressed:
                                  DotEnvValue.andClientDownloadUrl.isNotEmpty
                                      ? () async {
                                          final url = Uri.parse(
                                              DotEnvValue.andClientDownloadUrl);
                                          await launchUrl(url);
                                        }
                                      : null,
                              // style: PlatformHelper.isAndroid() &&
                              //         DotEnvValue
                              //             .andClientDownloadUrl.isNotEmpty
                              //     ? primaryButtonStyle
                              //     : null,
                              icon: Icon(
                                  const FaIcon(FontAwesomeIcons.android).icon),
                              label: const Text('Android'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SpacingHelper.defaultDivider,
                        const SizedBox(height: 16),
                        // OutlinedButton(
                        //   onPressed: () {
                        //     const TipherethRootRoute().go(context);
                        //     context.read<MainBloc>().add(
                        //           MainSetNextServerConfigEvent(
                        //             ServerConfig.empty(),
                        //           ),
                        //         );
                        //   },
                        //   child: Text(S.of(context).continueInWebVersion),
                        // ),
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
