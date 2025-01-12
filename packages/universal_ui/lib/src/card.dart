import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'common.dart';

class UniversalCard extends StatelessWidget {
  const UniversalCard({
    super.key,
    this.color,
    this.shadowColor,
    this.margin,
    required this.child,
  });

  final Color? color;
  final Color? shadowColor;
  final EdgeInsets? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.Card(
          color: color,
          shadowColor: shadowColor,
          margin: margin,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        );
      case UIDesign.fluent:
        return fluent.Card(
          backgroundColor: color,
          borderColor: shadowColor,
          margin: margin,
          child: child,
        );
    }
  }
}
