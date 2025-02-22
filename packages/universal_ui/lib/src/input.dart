import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'base.dart';

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

class UniversalDatePicker extends StatefulWidget {
  const UniversalDatePicker({
    super.key,
    required this.selectedDate,
    required this.onChanged,
    this.showMonth = true,
    this.showDay = true,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;
  final bool showMonth;
  final bool showDay;

  @override
  State<UniversalDatePicker> createState() => _UniversalDatePickerState();
}

class _UniversalDatePickerState extends State<UniversalDatePicker> {
  DateTime get selectedDate => widget.selectedDate;
  ValueChanged<DateTime> get onChanged => widget.onChanged;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.TextButton.icon(
          onPressed: () async {
            final date = await material.showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                selectableDayPredicate: (date) {
                  // if disable showMonth, only select first day of year
                  if (!widget.showMonth) {
                    return date.month == 1 && date.day == 1;
                  }
                  // if disable showDay, only select first day of month
                  if (!widget.showDay) {
                    return date.day == 1;
                  }
                  return true;
                });
            if (date != null) {
              onChanged(date);
            }
          },
          icon: const material.Icon(material.Icons.calendar_today),
          label: const material.Text('Select date'),
        );
      case UIDesign.fluent:
        return fluent.DatePicker(
          selected: selectedDate,
          onChanged: onChanged,
          showMonth: widget.showMonth,
          showDay: widget.showDay,
        );
    }
  }
}
