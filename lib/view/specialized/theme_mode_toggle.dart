import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_setting/app_setting_bloc.dart';

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingBloc, AppSettingState>(
      builder: (context, state) {
        return IconButton(
          style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(
              Size(24, 24),
            ),
            maximumSize: MaterialStatePropertyAll(
              Size(24, 24),
            ),
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<AppSettingBloc>().add(ToggleThemeModeEvent());
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.themeMode == ThemeMode.system
                ? const Icon(
                    Icons.brightness_auto,
                    key: ValueKey('auto'),
                  )
                : state.themeMode == ThemeMode.light
                    ? const Icon(
                        Icons.brightness_5,
                        key: ValueKey('light'),
                      )
                    : const Icon(
                        Icons.brightness_3,
                        key: ValueKey('dark'),
                      ),
          ),
          iconSize: 14,
        );
      },
    );
  }
}
