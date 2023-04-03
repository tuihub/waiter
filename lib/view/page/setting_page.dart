import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/bloc/app_setting_bloc.dart';

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
                  height: 600,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('主题'),
                        trailing: IconButton(
                            onPressed: () {
                              context
                                  .read<AppSettingBloc>()
                                  .add(InitAppSettingEvent());
                            },
                            icon: const Icon(Icons.refresh)),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 188,
                                ),
                                children: [
                                  ThemePresent(
                                    title: state.theme.name,
                                    lightScheme: FlexColorScheme.light(
                                            scheme: state.theme)
                                        .toScheme,
                                    darkScheme: FlexColorScheme.dark(
                                            scheme: state.theme)
                                        .toScheme,
                                    selected: true,
                                    brightness: Theme.of(context).brightness,
                                  ),
                                  for (var theme in FlexScheme.values)
                                    ThemePresent(
                                      title: theme.name,
                                      lightScheme:
                                          FlexColorScheme.light(scheme: theme)
                                              .toScheme,
                                      darkScheme:
                                          FlexColorScheme.dark(scheme: theme)
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

class DesktopThemeWidget extends StatelessWidget {
  const DesktopThemeWidget({
    super.key,
    this.onTap,
    required this.theme,
  });

  final VoidCallback? onTap;
  final FlexScheme theme;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).brightness == Brightness.light
        ? FlexThemeData.light(scheme: theme).colorScheme
        : FlexThemeData.dark(scheme: theme).colorScheme;
    return Ink(
      height: 144,
      width: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: themeData.primaryContainer,
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: themeData.onPrimaryContainer,
              ),
              height: 96,
              width: 200,
            ),
          ),
          Center(
            child: Text(
              theme.name,
              style: TextStyle(
                color: themeData.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
