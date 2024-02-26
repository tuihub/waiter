import 'package:file_sizes/file_sizes.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/client_setting/client_setting_bloc.dart';
import '../../../../bloc/main_bloc.dart';
import '../../../../consts.dart';
import '../../../../l10n/l10n.dart';
import '../../../helper/spacing.dart';
import '../../../specialized/theme_presentation.dart';

part 'cache_setting.dart';

class ClientSettingPage extends StatelessWidget {
  const ClientSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: SpacingHelper.defaultBorderRadius,
        ),
        title: Text(S.of(context).clientSetting),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: BlocBuilder<ClientSettingBloc, ClientSettingState>(
          builder: (context, state) {
            return ListView(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(S.of(context).theme),
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<ClientSettingBloc>()
                                .add(ToggleThemeModeEvent());
                          },
                          icon: AnimatedSwitcher(
                            duration: Duration.zero,
                            child: state.themeMode == ThemeMode.system
                                ? const Icon(Icons.brightness_auto)
                                : state.themeMode == ThemeMode.light
                                    ? const Icon(Icons.brightness_5)
                                    : const Icon(Icons.brightness_3),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ThemePresent(
                              title: S.of(context).currentTheme,
                              lightScheme: FlexColorScheme.light(
                                      scheme: state.theme.scheme)
                                  .toScheme,
                              darkScheme: FlexColorScheme.dark(
                                      scheme: state.theme.scheme)
                                  .toScheme,
                              selected: true,
                              brightness: Theme.of(context).brightness,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: [
                                for (final theme in themeData)
                                  ChoiceChip(
                                    label: Text(theme.name),
                                    selected: state.theme.name == theme.name,
                                    onSelected: (selected) {
                                      if (selected) {
                                        context
                                            .read<ClientSettingBloc>()
                                            .add(ChangeThemeEvent(theme));
                                      }
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CacheSetting(),
              ],
            );
          },
        ),
      ),
    );
  }
}
