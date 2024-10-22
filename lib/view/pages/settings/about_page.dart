import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../bloc/main_bloc.dart';
import '../../helper/app_bar.dart';
import '../../helper/connection.dart';
import '../../universal/card.dart';
import '../../universal/list.dart';
import '../../universal/spacing.dart';
import '../../universal/universal.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final packageInfo = context.read<MainBloc>().packageInfo;
    final serverInfo = context.read<MainBloc>().state.serverInfo;
    final logoHeight = MediaQuery.sizeOf(context).height / 3;
    final textStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 2,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
        shape: UniversalUI.of(context).defaultShape,
        backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
        leading: AppBarHelper.defaultMainLeading(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView(
          children: [
            UniversalCard(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('web/icons/Icon-512.png', height: logoHeight),
                    Text(
                      'Developed by TuiHub',
                      style: textStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SpacingHelper.defaultDivider,
                    if (kDebugMode)
                      Text(
                        '⚠️DEBUG MODE⚠️',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      )
                    else
                      Text(
                        'Version       ${packageInfo.version}\n'
                        'Build Number  ${packageInfo.buildNumber}',
                        style: textStyle,
                        textAlign: TextAlign.justify,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            UniversalExpansionTile(
              title: const Text(
                'Privacy Policy',
              ),
              children: [
                FutureBuilder(
                  future: rootBundle.loadString('PrivacyPolicy.md'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                          shrinkWrap: true, data: snapshot.data ?? '');
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (ConnectionHelper.isNotLocal(context))
              UniversalExpansionTile(
                title: const Text(
                  'Current Server Information',
                ),
                children: [
                  if (serverInfo != null)
                    Text(
                      'Project  ${serverInfo.sourceCodeAddress}\n'
                      'Version     ${serverInfo.buildVersion}\n'
                      'Build Date  ${serverInfo.buildDate}',
                      style: textStyle,
                      textAlign: TextAlign.justify,
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
