import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'common.dart';

class UniversalSwitch extends StatelessWidget {
  const UniversalSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.Switch(
          value: value,
          onChanged: onChanged,
        );
      case UIDesign.fluent:
        return fluent.ToggleSwitch(
          checked: value,
          onChanged: onChanged,
        );
    }
  }
}

class UniversalRadio<T> extends StatelessWidget {
  const UniversalRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.Radio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        );
      case UIDesign.fluent:
        return fluent.RadioButton(
          onChanged: (v) {
            onChanged?.call(value);
          },
          checked: value == groupValue,
        );
    }
  }
}
