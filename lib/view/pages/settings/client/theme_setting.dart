part of 'client_setting_page.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSettingBloc, ClientSettingState>(
      builder: (context, state) {
        return Card(
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
                      lightScheme:
                          FlexColorScheme.light(scheme: state.theme.scheme)
                              .toScheme,
                      darkScheme:
                          FlexColorScheme.dark(scheme: state.theme.scheme)
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
        );
      },
    );
  }
}
