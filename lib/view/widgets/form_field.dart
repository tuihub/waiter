import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {super.key,
      Widget? title,
      super.onSaved,
      super.validator,
      bool super.initialValue = false})
      : super(builder: (FormFieldState<bool> state) {
          return CheckboxListTile(
            dense: state.hasError,
            title: title,
            value: state.value,
            onChanged: state.didChange,
            subtitle: state.hasError
                ? Builder(
                    builder: (BuildContext context) => Text(
                      state.errorText ?? '',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.platform,
          );
        });
}

class SwitchFormField extends FormField<bool> {
  SwitchFormField(
      {super.key,
      Widget? title,
      super.onSaved,
      super.validator,
      bool super.initialValue = false})
      : super(builder: (FormFieldState<bool> state) {
          return SwitchListTile(
            dense: state.hasError,
            title: title,
            value: state.value ?? false,
            onChanged: state.didChange,
            subtitle: state.hasError
                ? Builder(
                    builder: (BuildContext context) => Text(
                      state.errorText ?? '',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  )
                : null,
            controlAffinity: ListTileControlAffinity.platform,
          );
        });
}
