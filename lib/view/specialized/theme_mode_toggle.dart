import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';
import '../universal/universal.dart';

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return IconButton(
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(24, 24),
            ),
            maximumSize: WidgetStatePropertyAll(
              Size(24, 24),
            ),
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<MainBloc>().add(ToggleThemeModeEvent());
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.themeMode == ThemeMode.system
                ? Icon(UniversalUI.of(context).icons.brightness)
                : state.themeMode == ThemeMode.light
                    ? Icon(UniversalUI.of(context).icons.brightnessLight)
                    : Icon(UniversalUI.of(context).icons.brightnessDark),
          ),
          iconSize: 14,
        );
      },
    );
  }
}
