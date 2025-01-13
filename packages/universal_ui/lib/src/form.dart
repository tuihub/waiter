import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'common.dart';

class UniversalTextFormField extends StatelessWidget {
  const UniversalTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.initialValue,
    this.onSaved,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final bool obscureText;
  final String obscuringCharacter;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.TextFormField(
          controller: controller,
          initialValue: initialValue,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          decoration: material.InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
        );
      case UIDesign.fluent:
        final textBox = fluent.TextFormBox(
          placeholder: hintText,
          controller: controller,
          initialValue: initialValue,
          onSaved: onSaved,
          onChanged: onChanged,
          prefix: prefixIcon,
          suffix: suffixIcon,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
        );
        if (labelText == null) {
          return textBox;
        } else {
          return fluent.InfoLabel(
            label: labelText!,
            child: textBox,
          );
        }
    }
  }
}

class UniversalDropdownButtonFormField<T> extends StatelessWidget {
  const UniversalDropdownButtonFormField({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.isExpanded = false,
  });

  final T? value;
  final List<UniversalDropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.DropdownButtonFormField<T>(
          value: value,
          items: items.map((item) => item.buildMaterial()).toList(),
          onChanged: onChanged,
          isExpanded: isExpanded,
        );
      case UIDesign.fluent:
        return fluent.ComboBox<T>(
          value: value,
          items: items.map((item) => item.buildFluent()).toList(),
          onChanged: onChanged,
          isExpanded: isExpanded,
        );
    }
  }
}

class UniversalDropdownMenuItem<T> {
  UniversalDropdownMenuItem({required this.child, this.value});

  final T? value;
  final Widget child;

  material.DropdownMenuItem<T> buildMaterial() {
    return material.DropdownMenuItem<T>(
      value: value,
      child: child,
    );
  }

  fluent.ComboBoxItem<T> buildFluent() {
    return fluent.ComboBoxItem<T>(
      value: value,
      child: child,
    );
  }
}

class UniversalSwitchFormField extends FormField<bool> {
  UniversalSwitchFormField({
    super.key,
    Widget? title,
    super.onSaved,
    ValueChanged<bool>? onChanged,
    super.validator,
    bool super.initialValue = false,
  }) : super(builder: (FormFieldState<bool> state) {
          final design = UniversalUI.of(state.context).design;
          final subtitle = state.hasError
              ? Builder(
                  builder: (BuildContext context) => material.Text(
                    state.errorText ?? '',
                    style: material.TextStyle(
                        color: material.Theme.of(context).colorScheme.error),
                  ),
                )
              : null;

          switch (design) {
            case UIDesign.material:
              return material.SwitchListTile(
                dense: state.hasError,
                title: title,
                value: state.value ?? false,
                onChanged: (value) {
                  state.didChange(value);
                  if (onChanged != null) {
                    onChanged(value);
                  }
                },
                subtitle: subtitle,
              );
            case UIDesign.fluent:
              return fluent.ListTile(
                title: title,
                subtitle: subtitle,
                trailing: fluent.ToggleSwitch(
                  checked: state.value ?? false,
                  onChanged: (value) {
                    state.didChange(value);
                    if (onChanged != null) {
                      onChanged(value);
                    }
                  },
                ),
              );
          }
        });
}
