import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'universal.dart';

class UniversalOutlinedButton extends StatelessWidget {
  const UniversalOutlinedButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    required this.child,
  });

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.OutlinedButton.icon(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          icon: icon,
          label: child,
        );
      case UIDesign.fluent:
        return fluent.OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          child: child,
        );
    }
  }

  factory UniversalOutlinedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool? autofocus,
    Widget? icon,
    required Widget label,
  }) {
    return UniversalOutlinedButton(
      key: key,
      onPressed: onPressed!,
      onLongPress: onLongPress,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      icon: icon,
      child: label,
    );
  }
}
