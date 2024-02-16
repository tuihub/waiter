import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/client_setting/client_setting_bloc.dart';
import '../../../../consts.dart';
import '../../../specialized/theme_presentation.dart';
import 'cache_setting.dart';

class ClientSettingPage extends StatelessWidget {
  const ClientSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        title: const Text('设置'),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Material(
          color: Colors.transparent,
          child: BlocBuilder<ClientSettingBloc, ClientSettingState>(
            builder: (context, state) {
              return ListView(
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    height: 240,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('主题'),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                // ThemePresent(
                                //   title: state.theme.name,
                                //   lightScheme: FlexColorScheme.light(
                                //           scheme: state.theme.scheme)
                                //       .toScheme,
                                //   darkScheme: FlexColorScheme.dark(
                                //           scheme: state.theme.scheme)
                                //       .toScheme,
                                //   selected: true,
                                //   brightness: Theme.of(context).brightness,
                                // ),
                                // const VerticalDivider(
                                //   thickness: 2,
                                // ),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      for (final theme in themeData)
                                        ThemePresent(
                                          title: theme.name,
                                          lightScheme: FlexColorScheme.light(
                                                  scheme: theme.scheme)
                                              .toScheme,
                                          darkScheme: FlexColorScheme.dark(
                                                  scheme: theme.scheme)
                                              .toScheme,
                                          selected: false,
                                          onTap: () {
                                            context
                                                .read<ClientSettingBloc>()
                                                .add(ChangeThemeEvent(theme));
                                          },
                                          brightness:
                                              Theme.of(context).brightness,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
