import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class SectionDividerFormField extends FormField<void> {
  SectionDividerFormField({super.key, required Widget title})
      : super(
          builder: (FormFieldState<void> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                title,
                const Divider(),
              ],
            );
          },
        );
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    Widget? title,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
  }) : super(builder: (FormFieldState<bool> state) {
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

class NumberFormField extends FormField<num> {
  NumberFormField({
    super.key,
    Widget? title,
    super.onSaved,
    num maxValue = double.infinity,
    num minValue = double.negativeInfinity,
    num steps = 1,
    num super.initialValue = 0,
    super.validator,
  }) : super(builder: (FormFieldState<num> state) {
          return Column(
            children: [
              if (title != null) title,
              InputQty(
                maxVal: maxValue,
                initVal: initialValue,
                minVal: minValue,
                steps: steps,
                validator: validator,
                decoration: const QtyDecorationProps(
                  plusBtn: Icon(Icons.add),
                  minusBtn: Icon(Icons.remove),
                  isBordered: false,
                  borderShape: BorderShapeBtn.circle,
                ),
                onQtyChanged: (value) {
                  if (value is num) {
                    state.didChange(value);
                    if (onSaved != null) {
                      onSaved(value);
                    }
                  }
                },
              ),
            ],
          );
        });
}
