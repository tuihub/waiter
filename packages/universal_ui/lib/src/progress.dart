import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'base.dart';

class UniversalCircularProgressIndicator extends StatelessWidget {
  const UniversalCircularProgressIndicator({
    super.key,
    this.value,
    this.backgroundColor,
    this.color,
    this.strokeWidth = 4.0,
  });

  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.CircularProgressIndicator(
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          strokeWidth: strokeWidth,
        );
      case UIDesign.fluent:
        return fluent.ProgressRing(
          value: value,
          backgroundColor: backgroundColor,
          activeColor: color,
          strokeWidth: strokeWidth,
        );
    }
  }
}

class UniversalLinearProgressIndicator extends StatelessWidget {
  const UniversalLinearProgressIndicator({
    super.key,
    this.value,
    this.backgroundColor,
    this.color,
  });

  final double? value;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final design = UniversalUI.of(context).design;

    switch (design) {
      case UIDesign.material:
        return material.LinearProgressIndicator(
          value: value,
          backgroundColor: backgroundColor,
          color: color,
        );
      case UIDesign.fluent:
        return fluent.ProgressBar(
          value: value != null ? value! * 100 : null,
          backgroundColor: backgroundColor,
          activeColor: color,
        );
    }
  }
}
