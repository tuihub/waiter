import 'package:flutter/services.dart';

class IntInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final value = int.tryParse(newValue.text);
    if (value == null) {
      return oldValue;
    }
    return newValue;
  }
}
