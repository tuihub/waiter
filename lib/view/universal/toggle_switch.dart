import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'common.dart';

class UniversalToggleSwitch<T> extends StatelessWidget {
  const UniversalToggleSwitch({
    super.key,
    required this.current,
    required this.values,
    this.onChanged,
    this.iconBuilder,
  });

  final T current;
  final List<T> values;
  final ChangeCallback<T>? onChanged;
  final SimpleIconBuilder<T>? iconBuilder;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return AnimatedToggleSwitch<T>.size(
          current: current,
          values: values,
          iconBuilder: iconBuilder,
          iconAnimationType: AnimationType.onHover,
          style: ToggleStyle(
            borderColor: material.Colors.transparent,
            borderRadius: UniversalUI.of(context).defaultBorderRadius,
            indicatorBorderRadius: UniversalUI.of(context).defaultBorderRadius,
          ),
          onChanged: onChanged,
        );
      case UIDesign.fluent:
        final theme = fluent.FluentTheme.of(context);
        return fluent.DefaultTextStyle.merge(
          style: theme.typography.body?.copyWith(
            color: theme.resources.textOnAccentFillColorPrimary,
          ),
          child: AnimatedToggleSwitch<T>.size(
            current: current,
            values: values,
            iconBuilder: iconBuilder,
            borderWidth: 4.0,
            height: 32.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              indicatorColor:
                  theme.accentColor.defaultBrushFor(theme.brightness),
              backgroundColor: theme.resources.accentFillColorDisabled,
              borderColor: theme.resources.controlFillColorTransparent,
              borderRadius: UniversalUI.of(context).defaultBorderRadius,
              indicatorBorderRadius:
                  UniversalUI.of(context).defaultBorderRadius,
            ),
            onChanged: onChanged,
          ),
        );
    }
  }
}
