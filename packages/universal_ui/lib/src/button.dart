import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

import 'common.dart';

class UniversalOutlinedButton extends StatelessWidget {
  const UniversalOutlinedButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    required this.child,
  });

  final VoidCallback? onPressed;
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
        return fluent.Button(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          child: icon != null
              ? Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    icon!,
                    child,
                  ],
                )
              : child,
        );
    }
  }

  factory UniversalOutlinedButton.icon({
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool? autofocus,
    Widget? icon,
    required Widget label,
  }) {
    return UniversalOutlinedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      icon: icon,
      child: label,
    );
  }
}

class UniversalElevatedButton extends StatelessWidget {
  const UniversalElevatedButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    this.backgroundColor,
    this.padding,
    required this.child,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? icon;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.ElevatedButton.icon(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          icon: icon,
          style: material.ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          label: Container(
            padding: padding,
            child: child,
          ),
        );
      case UIDesign.fluent:
        return fluent.FilledButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          style: fluent.ButtonTheme.of(context).filledButtonStyle?.copyWith(
                backgroundColor:
                    fluent.WidgetStateProperty.all(backgroundColor),
              ),
          child: Container(
            padding: padding,
            child: icon != null
                ? Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      icon!,
                      child,
                    ],
                  )
                : child,
          ),
        );
    }
  }

  factory UniversalElevatedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool? autofocus,
    Widget? icon,
    EdgeInsetsGeometry? padding,
    required Widget label,
  }) {
    return UniversalElevatedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      icon: icon,
      padding: padding,
      child: label,
    );
  }
}

class UniversalTextButton extends StatelessWidget {
  const UniversalTextButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    required this.child,
  });

  final VoidCallback? onPressed;
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
        return material.TextButton.icon(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          icon: icon,
          label: child,
        );
      case UIDesign.fluent:
        return fluent.HyperlinkButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          child: child,
        );
    }
  }

  factory UniversalTextButton.icon({
    Key? key,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool? autofocus,
    Widget? icon,
    required Widget label,
  }) {
    return UniversalTextButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      icon: icon,
      child: label,
    );
  }
}

class UniversalIconButton extends StatelessWidget {
  const UniversalIconButton({
    super.key,
    this.onPressed,
    this.focusNode,
    this.autofocus = false,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.IconButton(
          onPressed: onPressed,
          focusNode: focusNode,
          autofocus: autofocus,
          icon: icon,
        );
      case UIDesign.fluent:
        return fluent.IconButton(
          onPressed: onPressed,
          focusNode: focusNode,
          autofocus: autofocus,
          icon: icon,
        );
    }
  }
}
