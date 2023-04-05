import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/bloc/app_setting_bloc.dart';
import 'package:waitress/common/const/theme.dart';

import '../widget/theme_presentation.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Material(
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.only(right: 8),
              children: [
                Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                  height: 224,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('主题'),
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<AppSettingBloc>()
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
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ThemePresent(
                                    title: state.theme.name,
                                    lightScheme: FlexColorScheme.light(
                                            scheme: state.theme.scheme)
                                        .toScheme,
                                    darkScheme: FlexColorScheme.dark(
                                            scheme: state.theme.scheme)
                                        .toScheme,
                                    selected: true,
                                    brightness: Theme.of(context).brightness,
                                  ),
                                  for (var theme in themeData)
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
                                            .read<AppSettingBloc>()
                                            .add(ChangeThemeEvent(theme));
                                      },
                                      brightness: Theme.of(context).brightness,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
