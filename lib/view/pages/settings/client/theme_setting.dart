part of 'client_setting_page.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return UniversalCard(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              UniversalListTile(
                title: Text(S.of(context).theme),
                trailing: UniversalIconButton(
                  onPressed: () {
                    context.read<MainBloc>().add(ToggleThemeModeEvent());
                  },
                  icon: AnimatedSwitcher(
                    duration: Duration.zero,
                    child: state.themeMode == ThemeMode.system
                        ? Icon(UniversalUI.of(context).icons.brightness)
                        : state.themeMode == ThemeMode.light
                            ? Icon(
                                UniversalUI.of(context).icons.brightnessLight)
                            : Icon(
                                UniversalUI.of(context).icons.brightnessDark),
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
                                    .read<MainBloc>()
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
